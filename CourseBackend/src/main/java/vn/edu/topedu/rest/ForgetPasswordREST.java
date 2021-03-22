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
import vn.edu.topedu.request.ForgetPasswordRequest;
@RestController
public class ForgetPasswordREST {
	@Autowired
	private EmailService emailService;
	@Autowired
	private RequestResetPasswordDAO requestResetPasswordDAO;
	@Autowired
	private AppUserDAO appUserDAO;
	@GetMapping("/forgetpassword")
	@ResponseBody
	public ResponseEntity<Object> get() {
		RequestResetPassword rs=requestResetPasswordDAO.getCourse(Long.valueOf(1));
		return ResponseEntity.ok(rs.getCode());
		
	}
	@PostMapping("/forgetpassword/username")
	@ResponseBody
	public ResponseEntity<Object> sendMailByUsername(
			@RequestBody ForgetPasswordRequest forgetPasswordRequest) {
		//System.out.println("Request: "+forgetPasswordRequest);
		String emailOrUsername=forgetPasswordRequest.getEmailOrUsername();
		
		AppUser appUser=appUserDAO.findUserAccount(emailOrUsername);
		RequestResetPassword requestResetPassword= new RequestResetPassword();
		requestResetPassword.genderCode(appUser.getUserName());
		requestResetPassword.setAppUser(appUser);
		if(appUser!=null) {
			int id=requestResetPasswordDAO.insert(requestResetPassword);
			if(id==0)return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Can't gender code.");;
			String to= appUser.getEmail();
			String subject= "Reset Password";
			String text= "Code: "+requestResetPassword.getCode();
			boolean isBackground= false;	
			try {
				emailService.sendSimpleMessage(to, subject, text, isBackground);
				return ResponseEntity.ok().build();
				
			} catch (Exception e) {
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Not send mail");
			}
			
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Username not exists.");
		
	}
	@PostMapping("/forgetpassword/email")
	@ResponseBody
	public ResponseEntity<Object> sendMailByEmail(
			@RequestBody ForgetPasswordRequest forgetPasswordRequest) {
		System.out.println("Request: "+forgetPasswordRequest);
		String emailOrUsername=forgetPasswordRequest.getEmailOrUsername();	
		AppUser appUser=appUserDAO.findUserByEmail(emailOrUsername);
		if(appUser!=null) {
			RequestResetPassword requestResetPassword= new RequestResetPassword();
			requestResetPassword.genderCode(appUser.getUserName());
			requestResetPassword.setAppUser(appUser);
			int id=requestResetPasswordDAO.insert(requestResetPassword);
			if(id==0)return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Can't gender code.");;
			String to= appUser.getEmail();
			String subject= "Reset Password";
			String text= "Code: "+requestResetPassword.getCode();
			boolean isBackground= false;	
			try {
				emailService.sendSimpleMessage(to, subject, text, isBackground);
				return ResponseEntity.ok(appUser.getUserName());
				
			} catch (Exception e) {
				e.printStackTrace();
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Not send mail");
			}
			
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Email not exists.");		
	}
	@PostMapping("/forgetpassword/code")
	@ResponseBody
	public ResponseEntity<Object> resetPassword(
			@RequestBody Map<String,Object> body) {
		String username=body.get("username").toString();
		String code=body.get("code").toString();
		RequestResetPassword rrp = requestResetPasswordDAO.getCourse(username);
		if(rrp==null)return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Code not corect.");
		String trueCode=rrp.getCode();
		if(code.equals(trueCode)) {
			
			return ResponseEntity.ok().build();
		
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Code not corect.");		
	}
	@Autowired
	private PBKDF2Encoder passwordEncoder;
	@PostMapping("/forgetpassword/change")
	@ResponseBody
	public ResponseEntity<Object> changePassword(
			@RequestBody Map<String,Object> body) {
		System.out.println(body);
		String username=body.get("username").toString();
		String code=body.get("code").toString();
		String password=body.get("password").toString();
		RequestResetPassword rrp = requestResetPasswordDAO.getCourse(username);
		if(rrp==null)return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Code not corect.");		
		String trueCode=rrp.getCode();
		if(code.equals(trueCode)) {
			AppUser user=appUserDAO.findUserAccount(username);
			user.setEncrytedPassword(passwordEncoder.encode(password));
			appUserDAO.updateUser(user);
			return ResponseEntity.ok().build();
			
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Code not corect.");		
	}
	


}
