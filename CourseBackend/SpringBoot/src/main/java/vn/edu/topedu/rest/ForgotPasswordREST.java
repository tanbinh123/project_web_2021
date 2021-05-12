package vn.edu.topedu.rest;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import vn.edu.topedu.dao.AppUserDAO;
import vn.edu.topedu.dao.RequestResetPasswordDAO;
import vn.edu.topedu.email.EmailService;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.RequestResetPassword;
import vn.edu.topedu.jwt.security.PBKDF2Encoder;
import vn.edu.topedu.request.ForgotPasswordByEmailRequest;
import vn.edu.topedu.request.ForgetPasswordByUsernameRequest;
import vn.edu.topedu.response.MessageResponse;
@RestController
public class ForgotPasswordREST {
	@Autowired
	private EmailService emailService;
	@Autowired
	private RequestResetPasswordDAO requestResetPasswordDAO;
	@Autowired
	private AppUserDAO appUserDAO;
	@Autowired
	private PBKDF2Encoder passwordEncoder;
	
	
	
	@PostMapping("/forgotpassword/username")
	@ResponseBody
	public ResponseEntity<Object> sendMailByUsername(
			@RequestBody ForgetPasswordByUsernameRequest forgetPasswordRequest) {
		//System.out.println("Request: "+forgetPasswordRequest);
		String emailOrUsername=forgetPasswordRequest.getUsername();
		
		AppUser appUser=appUserDAO.findUserAccount(emailOrUsername);
		RequestResetPassword requestResetPassword= new RequestResetPassword();
		requestResetPassword.genderCode(appUser.getUserName());
		requestResetPassword.setAppUser(appUser);
		if(appUser!=null) {
			int id=requestResetPasswordDAO.insert(requestResetPassword);
			if(id==0)return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(new MessageResponse("Can't gender code.",""));;
			String to= appUser.getEmail();
			String subject= "Reset Password";
			String text= "Code: "+requestResetPassword.getCode();
			boolean isBackground= false;	
			try {
				emailService.sendSimpleMessage(to, subject, text, isBackground);
				return ResponseEntity.ok().build();
				
			} catch (Exception e) {
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(new MessageResponse("Not send mail",""));
			}
			
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Username not exists.",""));
		
	}
	@PostMapping("/forgotpassword/email")
	@ResponseBody
	public ResponseEntity<Object> sendMailByEmail(
			@RequestBody ForgotPasswordByEmailRequest forgetPasswordRequest) {
		System.out.println("Request: "+forgetPasswordRequest);
		String email=forgetPasswordRequest.getEmail();	
		AppUser appUser=appUserDAO.findUserByEmail(email);
		if(appUser!=null) {
			RequestResetPassword requestResetPassword= new RequestResetPassword();
			requestResetPassword.genderCode(appUser.getUserName());
			requestResetPassword.setAppUser(appUser);
			int id=requestResetPasswordDAO.insert(requestResetPassword);
			if(id==0)return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(new MessageResponse("Can't gender code.",""));;
			String to= appUser.getEmail();
			String subject= "Reset Password";
			String text= "Code: "+requestResetPassword.getCode();
			boolean isBackground= false;	
			try {
				emailService.sendSimpleMessage(to, subject, text, isBackground);
				return ResponseEntity.ok(new ForgotPasswordByEmailResponse(appUser.getUserName()));
				
			} catch (Exception e) {
				e.printStackTrace();
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(new MessageResponse("Not send mail",""));
			}
			
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Email not exists.",""));		
	}
	@PostMapping("/forgotpassword/code")
	@ResponseBody
	public ResponseEntity<Object> resetPassword(
			@RequestBody Map<String,Object> body) {
		String username=body.get("username").toString();
		String code=body.get("code").toString();
		RequestResetPassword rrp = requestResetPasswordDAO.getNewCode(username);
		if(rrp==null)return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Code not corect.",""));
		String trueCode=rrp.getCode();
		if(code.equals(trueCode)) {
			//System.out.println(rrp.getTime());
			return ResponseEntity.ok(new MessageResponse("Code valid.","Xác minh thành công."));
		
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Code not corect.",""));		
	}
	
	@PostMapping("/forgotpassword/change")
	@ResponseBody
	public ResponseEntity<Object> changePassword(
			@RequestBody Map<String,Object> body) {
		System.out.println(body);
		String username=body.get("username").toString();
		String code=body.get("code").toString();
		String password=body.get("password").toString();
		RequestResetPassword rrp = requestResetPasswordDAO.getNewCode(username);
		if(rrp==null) return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Code not corect.",""));		
		String trueCode=rrp.getCode();
		if(code.equals(trueCode)) {
			AppUser user=appUserDAO.findUserAccount(username);
			user.setEncrytedPassword(passwordEncoder.encode(password));
			if(appUserDAO.updateUser(user)) {
				rrp.setAlive(false);
				requestResetPasswordDAO.merge(rrp);
				
				return ResponseEntity.ok(new MessageResponse("Password change successful.","Thay đổi mật khẩu thành công."));
			}
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(new Object() {
				String message="MySql error";
			});
			
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Code not corect.",""));		
	}
	public class ForgotPasswordByEmailResponse{
		private String username;

		public ForgotPasswordByEmailResponse(String username) {
			super();
			this.username = username;
		}

		public String getUsername() {
			return username;
		}

		public void setUsername(String username) {
			this.username = username;
		}
	}
	


}
