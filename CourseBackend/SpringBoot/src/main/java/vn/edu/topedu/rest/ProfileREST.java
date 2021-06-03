package vn.edu.topedu.rest;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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

import vn.edu.topedu.dao.AppUserDAO;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.response.MessageResponse;
import vn.edu.topedu.utils.WebUtils;

@RestController
@RequestMapping("/profile")
public class ProfileREST {

	@Autowired
	private AppUserDAO appUserDAO;

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
				appUser.getAvatar().setBeforeResource(WebUtils.getUrl(httpServletRequest));
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
			
			@RequestPart String phone,
			@RequestPart String fullname,
			@RequestPart String email
			) {
		System.out.println("---------------------------------");
		System.out.println(String.format("email: %s", email));
		System.out.println(String.format("phone: %s", phone));
		System.out.println(String.format("fullname: %s", fullname));
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null) {
				
				appUser.setPhone(phone);
				appUser.setEmail(email);
				appUser.setFullname(fullname);
				appUserDAO.updateAppUser(appUser);
				appUser.getAvatar().setBeforeResource(WebUtils.getUrl(httpServletRequest));
				return ResponseEntity.ok(appUser);
			}
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", ""));
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

	
}
