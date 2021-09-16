package vn.edu.topedu.rest;

import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import vn.edu.topedu.dao.AppUserDAO;
import vn.edu.topedu.dao.CourseDAO;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.response.MessageResponse;

@RestController
@RequestMapping("/home")
public class HomeREST {
	@Autowired
	AppUserDAO appUserDAO;
	@Autowired
	CourseDAO courseDAO;

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
	
	@PostMapping(value="/username")
	@ResponseBody
	
	public ResponseEntity<Object> username(
			HttpServletRequest httpServletRequest, 
			@RequestBody Map<String,String> body
			) {	
		System.out.println("---------------------------------");
		String username=body.get("username");
		AppUser a = appUserDAO.findUserAccount(username);
		if(a!=null)
		return ResponseEntity.ok(new MessageResponse("username exist.", "username tồn tại trong hệ thống."));
		
		else return ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(new MessageResponse("username not exist.", "username không tồn tại trong hệ thống."));
		
	}
	
	@PostMapping(value="/admin")
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> alive() {	
		return ResponseEntity.ok().body(new MessageResponse("You are ADMIN ROLE.", "Bạn có quyền ADMIN."));
	}
	@PostMapping(value="/user")
	@ResponseBody
	@PreAuthorize("hasRole('USER')")
	public ResponseEntity<Object> user() {	
		return ResponseEntity.ok().body(new MessageResponse("You are USER ROLE.", "Bạn có quyền USER."));
	}
	
	
	
	@GetMapping(value="/home")
	@ResponseBody
	
	public ResponseEntity<Object> username(
			HttpServletRequest httpServletRequest
			) {	
		System.out.println("---------------------------------");
		
		Long countAppUser = appUserDAO.countAppUser(null);
		Long countCourse = courseDAO.getCount(-1, null, BigDecimal.valueOf(-1), BigDecimal.valueOf(-1),-1);
		
		return ResponseEntity.ok(new Object() {
			public Object numberUser=countAppUser;
			public Object numberCourse=countCourse;
		});
		
		//else return ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(new MessageResponse("username not exist.", "username không tồn tại trong hệ thống."));
		
	}
	
}
