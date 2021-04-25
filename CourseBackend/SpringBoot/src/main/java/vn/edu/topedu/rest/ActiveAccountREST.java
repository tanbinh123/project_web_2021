package vn.edu.topedu.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import vn.edu.topedu.dao.AppUserDAO;
import vn.edu.topedu.dao.RequestResetPasswordDAO;
import vn.edu.topedu.email.EmailService;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.RequestResetPassword;
import vn.edu.topedu.jwt.security.PBKDF2Encoder;
import vn.edu.topedu.response.MessageResponse;
@RestController
@RequestMapping("/active")
public class ActiveAccountREST {
	@Autowired
	private EmailService emailService;
	@Autowired
	private RequestResetPasswordDAO requestResetPasswordDAO;
	@Autowired
	private AppUserDAO appUserDAO;
	@Autowired
	private PBKDF2Encoder passwordEncoder;
	
	@PostMapping("/")
	@ResponseBody
	public ResponseEntity<Object> sendMailByEmail(
			Authentication authentication
			) {
		 if (authentication != null) {
			 authentication.getName();			
			 AppUser appUser=appUserDAO.findUserAccount( authentication.getName());
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
							 return ResponseEntity.ok(new MessageResponse("Can't gender code.",""));
							 
						 } catch (Exception e) {
							 e.printStackTrace();
							 return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(new MessageResponse("Not send mail",""));
						 }
						 
					 }
		 }
	        
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Email not exists.",""));		
	}
	@PostMapping("/confirm")
	@ResponseBody
	public ResponseEntity<Object> check(
			Authentication authentication,
			@RequestBody ActiveConfirmRequest requestBody) {
		 if (authentication != null) {
			 authentication.getName();
			 System.out.println("Code: "+requestBody.code);
			 AppUser appUser=appUserDAO.findUserAccount( authentication.getName());
				 if(appUser!=null) {
					 
					 return ResponseEntity.ok().build();
				 }
		 }
	        
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Email not exists.",""));		
	}
	public static class ActiveConfirmRequest{
		private String code;

		public String getCode() {
			return code;
		}

		public void setCode(String code) {
			this.code = code;
		}
	}
	
	
	


}
