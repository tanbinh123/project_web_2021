package vn.edu.topedu.rest;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import vn.edu.topedu.dao.AppUserDAO;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.response.MessageResponse;

@RestController
@RequestMapping("/home")
public class HomeREST {
	@Autowired
	AppUserDAO appUserDAO;

	@PostMapping(value="/email")
	@ResponseBody
	
	public ResponseEntity<Object> blockCourse(
			HttpServletRequest httpServletRequest, 
			@RequestBody Map<String,String> body
			) {	
		System.out.println("---------------------------------");
		String email=body.get("email");
		AppUser a = appUserDAO.findUserByEmail(email);
		if(a!=null)
		return ResponseEntity.ok(new MessageResponse("Email exist.", "Email tồn tại trong hệ thống."));
		
		else return ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(new MessageResponse("Email not exist.", "Email không tồn tại trong hệ thống."));
		
	}
	
}
