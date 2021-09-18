package vn.edu.topedu.rest;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import vn.edu.topedu.dao.AppUserDAO;
import vn.edu.topedu.dao.ResourceImageDAO;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.GENDER;
import vn.edu.topedu.entity.RequestResetPassword;
import vn.edu.topedu.entity.ResourceImage;
import vn.edu.topedu.fileprocess.FileProcess;
import vn.edu.topedu.json.MultiDateDeserializer;
import vn.edu.topedu.jwt.security.PBKDF2Encoder;
import vn.edu.topedu.response.MessageResponse;
import vn.edu.topedu.utils.WebUtils;

@RestController
@RequestMapping("/profile")
public class ProfileREST {

	@Autowired
	private AppUserDAO appUserDAO;

	@Autowired
	ResourceImageDAO resourceImageDAO;
	
	@Autowired
	private PBKDF2Encoder passwordEncoder;
	

	@GetMapping
	@ResponseBody
	@PreAuthorize("hasRole('USER')")
	public ResponseEntity<Object> profile(HttpServletRequest httpServletRequest, 
			Authentication authentication
			) {
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null) {
				//appUser.getAvatar().setBeforeResource(WebUtils.getUrl(httpServletRequest));
				return ResponseEntity.ok(appUser);
			}
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", ""));
	}
	
	@PostMapping( consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	@ResponseBody
	@PreAuthorize("hasRole('USER')")
	public ResponseEntity<Object> postProfile(HttpServletRequest httpServletRequest, 
			Authentication authentication,
			
			@RequestPart(required=false) String phone,
			@RequestPart(required=false) String fullname,
			@RequestPart String gender,			
			@RequestPart String birthDay,
			@RequestPart(required=false) String location,
			@RequestPart(required=false) String description,
			@RequestPart(required=false) String facebook,
			@RequestPart(required=false) MultipartFile uploadAvatar,
			@RequestPart(required=false) String email
			) {
		System.out.println("---------------------------------");
		System.out.println(String.format("email: %s", email));
		System.out.println(String.format("phone: %s", phone));
		System.out.println(String.format("fullname: %s", fullname));
		System.out.println(String.format("gender: %s", gender));
		System.out.println(String.format("location: %s", location));
		System.out.println(String.format("description: %s", description));
		System.out.println(String.format("birthDay: %s", birthDay.toString()));
		SimpleDateFormat df = new SimpleDateFormat("E MMM dd yyyy HH:mm:ss 'GMT'z", Locale.ENGLISH);
		df.setLenient(true);
		Date birthDate=null;
		try {
			birthDate=df.parse(birthDay);
			System.out.println(birthDate);
		} catch (ParseException e) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Birth Date not format.", "Ngày tháng không đúng format")); 
		}
		
		
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null) {
				if(!appUser.getEmail().equals(email))
					appUser.setActived(false);
				
				appUser.setPhone(phone);
				appUser.setEmail(email);
				appUser.setFullname(fullname);
				appUser.setGender(GENDER.valueOf(gender));
				appUser.setBirthDay(birthDate);
				appUser.setLocation(location);
				appUser.setFacebook(facebook);
				appUser.setDescription(description);
				ResourceImage newAvatar=null;
				try {
					newAvatar = resourceImageDAO.uploadImage(uploadAvatar, appUser);
				} catch (Exception e) {
					e.printStackTrace();
				}
				if(newAvatar!=null)appUser.setAvatar(newAvatar);
				appUserDAO.updateAppUser(appUser);
				appUser.getAvatar().setBeforeResource(WebUtils.getUrl(httpServletRequest));
				
				System.out.println(String.format("birthDayAfter: %s", appUser.getBirthDay().toString()));
				return ResponseEntity.ok(appUser);
			}
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
	}
	
	@PostMapping(value="/adaf", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	//@PostMapping
	@ResponseBody
	@PreAuthorize("hasRole('USER')")
	public ResponseEntity<Object> postProfile2(HttpServletRequest httpServletRequest, 
			Authentication authentication, @RequestBody AppUser appUser
			) {
		if (authentication != null) {
			authentication.getName();
			return ResponseEntity.ok(appUser);
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", ""));
	}
	
	@PostMapping("/changepassword")
	@ResponseBody
	@PreAuthorize("hasRole('USER')")
	public ResponseEntity<Object> changePassword(
			Authentication authentication,
			@RequestBody Map<String,String> body) {
		if (authentication != null) {
			
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null) {
				
				System.out.println(body);
				
				String password=body.get("password");
				if(password==null||password.length()==0)
					return ResponseEntity.badRequest().body(new MessageResponse("Required Password.","Thiếu trường Password."));
				String newPassword=body.get("newPassword");
				if(newPassword==null||newPassword.length()==0)
					return ResponseEntity.badRequest().body(new MessageResponse("Required newPassword.","Thiếu trường newPassword."));
				if(!appUser.getEncrytedPassword().equals(passwordEncoder.encode(password)))
					return ResponseEntity.badRequest().body(new MessageResponse("Password not corect.","Mật khẩu không đúng."));
				appUser.setEncrytedPassword(passwordEncoder.encode(newPassword));
				if(appUserDAO.updateUser(appUser)) {					
					
					return ResponseEntity.ok(new MessageResponse("Password change successful.","Thay đổi mật khẩu thành công."));
				}
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(new Object() {
					String message="MySql error";
				});
					
			}
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Code not corect.",""));		
	}

	
}
