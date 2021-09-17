package vn.edu.topedu.rest;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import vn.edu.topedu.dao.ActiveAccountDAO;
import vn.edu.topedu.dao.AppUserDAO;
import vn.edu.topedu.dao.RequestResetPasswordDAO;
import vn.edu.topedu.email.EmailService;
import vn.edu.topedu.entity.ActiveAccount;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.RequestResetPassword;
import vn.edu.topedu.jwt.security.PBKDF2Encoder;
import vn.edu.topedu.response.MessageResponse;
import vn.edu.topedu.utils.WebUtils;
@RestController
@RequestMapping("/active")
public class ActiveAccountREST {
	@Autowired
	private EmailService emailService;
	@Autowired
	private ActiveAccountDAO activeAccountDAO;
	@Autowired
	private AppUserDAO appUserDAO;
	
	@PostMapping
	@ResponseBody
	@PreAuthorize("hasRole('USER')")
	public ResponseEntity<Object> sendMailByEmail(
			HttpServletRequest httpServletRequest,
			Authentication authentication
			,@RequestBody ActiveRequest requestBody
			) {
		 if (authentication != null) {
			 authentication.getName();			
			 AppUser appUser=appUserDAO.findUserAccount(authentication.getName());
					 if(appUser!=null) {
						 ActiveAccount requestResetPassword= new ActiveAccount();
						 requestResetPassword.genderCode(appUser.getUserName());
						 requestResetPassword.setAppUser(appUser);
						 ActiveAccount id = activeAccountDAO.insert(requestResetPassword);
						 if(id==null)return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(new MessageResponse("Can't gender code.",""));;
						 String to= appUser.getEmail();
						 String subject= "TopEdu: Active Account";
						 if(requestBody.url.charAt(requestBody.url.length()-1)!='/') {
							 requestBody.url+='/';
						 }
						 String text=  String.format( "Link active account: %s%s", requestBody.url,requestResetPassword.getCode());
						 //System.out.println(text);
						 boolean isBackground= false;	
						 try {
							 emailService.sendSimpleMessage(to, subject, text, isBackground);
							 return ResponseEntity.ok(new MessageResponse("Send Mail Success.","Gửi mail thành công."));
							 
						 } catch (Exception e) {
							 e.printStackTrace();
							 return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(new MessageResponse("Not send mail",""));
						 }
						 
					 }
		 }
	        
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.",""));		
	}
	@PostMapping("/confirm")
	@ResponseBody
	@PreAuthorize("hasRole('USER')")
	public ResponseEntity<Object> check(
			HttpServletRequest httpServletRequest,
			Authentication authentication,
			@RequestBody ActiveConfirmRequest requestBody) {
		MessageResponse codeNotEquatls = new MessageResponse("Code not corect.","Mã xác mình không không đúng.");
		MessageResponse codeNotExist = new MessageResponse("Error.","Lỗi. Không có code trong cơ sở dữ liệu để xác minh");
		if (authentication != null) {
			 System.out.println("Code: "+requestBody.code);
			 ActiveAccount rrp = activeAccountDAO.getNewCode(authentication.getName());
			if(rrp==null)return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(codeNotExist);
			String trueCode=rrp.getCode();
			if(requestBody.code.equals(trueCode)) {
				 AppUser appUser=appUserDAO.findUserAccount(authentication.getName());
				 appUser.setActived(true);
				 appUser=appUserDAO.updateAppUser(appUser);
				 if(appUser!=null) {
					 rrp.setAlive(false);
					 activeAccountDAO.merge(rrp);
					 appUser.getAvatar().setBeforeResource(WebUtils.getUrl(httpServletRequest));
					 return ResponseEntity.ok(appUser);
				 }
				 //System.out.println(rrp.getTime());
			
			}
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(codeNotEquatls);		
					
		 }
	        
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(codeNotExist);		
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
	public static class ActiveRequest{
		private String url;

		public String getUrl() {
			return url;
		}

		public void setUrl(String url) {
			this.url = url;
		}

		
	}
	
	
	


}
