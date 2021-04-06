package vn.edu.topedu.rest;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.ResponseEntity.BodyBuilder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import vn.edu.topedu.dao.AppUserDAO;
import vn.edu.topedu.dao.UserCourseDAO;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.Course;
import vn.edu.topedu.jwt.security.JWTUtil;
import vn.edu.topedu.jwt.security.PBKDF2Encoder;
import vn.edu.topedu.request.AuthRequest;
import vn.edu.topedu.request.SignUpRequest;
import vn.edu.topedu.response.AuthResponse;
import vn.edu.topedu.response.MessageResponse;
import vn.edu.topedu.response.SignUpResponse;
import vn.edu.topedu.response.model.AccountResponse;

@RestController
public class AuthenticationREST implements IMyHost {

	@Autowired
	private JWTUtil jwtUtil;

	@Autowired
	private PBKDF2Encoder passwordEncoder;

	@Autowired
	private AppUserDAO appUserDAO;
	@Autowired
	private UserCourseDAO userCourseDAO;
	//private String url="/login"
	
	//@CrossOrigin(origins = "http://localhost:3000"/* ,"http://192.168.0.222:3000"} */)
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ResponseEntity<Object> login(@RequestBody AuthRequest ar, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {
//		httpServletResponse.setHeader("Access-Control-Allow-Origin", "*");
		httpServletResponse.setHeader("Access-Control-Allow-Methods", "POST, PUT, GET, OPTIONS, DELETE");
		//httpServletResponse.addHeader("Access-Control-Allow-Origin", "*");
		AppUser user = appUserDAO.findUserAccount(ar.getUsername());
		if (user!=null&&passwordEncoder.encode(ar.getPassword()).equals(user.getEncrytedPassword())) {
			AuthResponse authResponse = new AuthResponse(jwtUtil.generateToken(user));
			AccountResponse account = new AccountResponse();
			account.setAvatar(getUrlResource(httpServletRequest)+user.getAvater());
			//account.setAvatar(VariableConst.SRC_IMAGE_BEFORE + FileProcess.encodeFileToBase64(user.getAvater()));
			account.setUsername(user.getUserName());
			authResponse.setUser(account);
			List<Course> lstCourse = userCourseDAO.getOwerCourse(user.getUserId());
			for(Course c:lstCourse) {
				c.setBeforeResource(this.getUrlResource(httpServletRequest));
			}
			authResponse.setCourses(lstCourse);
			//System.out.println(Arrays.toString(lstCourse.toArray()));
			return ResponseEntity.ok(authResponse);
		} else {
			MessageResponse messageResponse= new MessageResponse("User not exists.", "Tài khoản không hợp lệ.");
			
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(messageResponse);
		}

	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public ResponseEntity<Object> signup(HttpServletRequest serverHttpRequest,@RequestBody SignUpRequest signUpRequest) {
		System.out.println(signUpRequest);
//		Test test = new Test();
//		test.setName(true);
//		testDAo.insertTest(test);
//		 return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
		AppUser user = new AppUser();
		user.setEmail(signUpRequest.getEmail());
		user.setUserName(signUpRequest.getUsername());
		user.setEncrytedPassword(passwordEncoder.encode(signUpRequest.getPassword()));
		boolean rs = false;
		try {
			rs = appUserDAO.insertUser(user);
		} catch (Exception e) {
			rs = false;
		}
		if (rs) {
			SignUpResponse authResponse = new SignUpResponse(jwtUtil.generateToken(user));
			AccountResponse account = new AccountResponse();
			account.setAvatar(getUrlResource(serverHttpRequest) +user.getAvater());
			//account.setAvatar(VariableConst.SRC_IMAGE_BEFORE + FileProcess.encodeFileToBase64(user.getAvater()));
			account.setUsername(user.getUserName());
			authResponse.setUser(account);
			return ResponseEntity.ok(authResponse);
		}
		BodyBuilder rs2 = ResponseEntity.status(HttpStatus.BAD_REQUEST);
		rs2.body("Email or username is unvalid.");
		MessageResponse messageResponse= new MessageResponse("Email or username is unvalid.", "Tài khoản không hợp lệ.");
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(messageResponse);
		

	}

}
