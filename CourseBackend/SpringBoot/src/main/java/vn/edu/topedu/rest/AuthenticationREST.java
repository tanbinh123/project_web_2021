package vn.edu.topedu.rest;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.UnexpectedRollbackException;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import vn.edu.topedu.consts.VariableConst;
import vn.edu.topedu.dao.AppUserDAO;
import vn.edu.topedu.dao.ResourceImageDAO;
import vn.edu.topedu.dao.UserCourseDAO;
import vn.edu.topedu.entity.AppRole;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.UserRole;
import vn.edu.topedu.entity.course.Course;
import vn.edu.topedu.jwt.security.JWTUtil;
import vn.edu.topedu.jwt.security.PBKDF2Encoder;
import vn.edu.topedu.request.AuthRequest;
import vn.edu.topedu.request.SignUpRequest;
import vn.edu.topedu.response.AuthResponse;
import vn.edu.topedu.response.MessageResponse;
import vn.edu.topedu.response.SignUpResponse;
import vn.edu.topedu.response.model.AccountResponse;
import vn.edu.topedu.utils.WebUtils;

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
	@Autowired
	private ResourceImageDAO resourceImageDAO;
	//private String url="/login"
	
	//@CrossOrigin(origins = "http://localhost:3000"/* ,"http://192.168.0.222:3000"} */)
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ResponseEntity<Object> login(@RequestBody AuthRequest ar, HttpServletRequest httpServletRequest) {
		AppUser user = appUserDAO.findUserAccount(ar.getUsername());
		if (user!=null&&passwordEncoder.encode(ar.getPassword()).equals(user.getEncrytedPassword())) {
			AuthResponse authResponse = new AuthResponse(jwtUtil.generateToken(user));
			AccountResponse account = new AccountResponse();
			user.getAvatar().setBeforeResource(getUrl(httpServletRequest));
			account.setAvatar(user.getAvatar().getImage());
			//account.setAvatar(VariableConst.SRC_IMAGE_BEFORE + FileProcess.encodeFileToBase64(user.getAvater()));
			account.setUsername(user.getUserName());
			authResponse.setUser(account);
			List<Course> lstCourse = userCourseDAO.getOwerCourse(user.getId());
			for(Course c:lstCourse) {
				c.setBeforeResource(this.getUrl(httpServletRequest));
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
	public ResponseEntity<Object> signup(HttpServletRequest httpServletRequest,@RequestBody SignUpRequest signUpRequest) {
		System.out.println(signUpRequest);
		AppUser user = new AppUser();
		user.setEmail(signUpRequest.getEmail());
		user.setUserName(signUpRequest.getUsername());
		user.setEncrytedPassword(passwordEncoder.encode(signUpRequest.getPassword()));
		user.setAvatar(resourceImageDAO.findById(Long.parseLong(String.valueOf(1))));
		System.out.println(user.getAvatar().getImage());
		AppRole role = appUserDAO.findRoleByRoleName("ROLE_USER");
		if(role==null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(
					new MessageResponse("Role Default not found ROLE_USER.", "Không tìm thấy quyền default ROLE_USER."));
		}
		try {
			boolean rs = appUserDAO.register(user, role);
			if (rs) {
				SignUpResponse authResponse = new SignUpResponse(jwtUtil.generateToken(user));
				AccountResponse account = new AccountResponse();
				user.getAvatar().setBeforeResource(getUrl(httpServletRequest));
//				System.out.println(user.getAvatar().getPath());
//				System.out.println(user.getAvatar());
				System.out.println(user.getAvatar().getImage());
				account.setAvatar(user.getAvatar().getImage());
				account.setUsername(user.getUserName());
				authResponse.setUser(account);
				return ResponseEntity.ok(authResponse);
			}else {
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(
						new MessageResponse("Not insert UserRole.", "Không cấp quyền cho user được."));
				
			}
			
		}catch(UnexpectedRollbackException e) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(
					new Object() {
						private String message="Lỗi Mysql, không thể chèn bảng ghi vào cơ sở dữ liệu";

						public String getMessage() {
							return message;
						}

						
					});
			
		}
		
		

	}
	@RequestMapping(value = "/signup2", method = RequestMethod.POST)
	public ResponseEntity<Object> signup2(HttpServletRequest serverHttpRequest,@RequestBody SignUpRequest signUpRequest) {
		System.out.println(signUpRequest);
		AppUser user = new AppUser();
		user.setEmail(signUpRequest.getEmail());
		user.setUserName(signUpRequest.getUsername());
		user.setEncrytedPassword(passwordEncoder.encode(signUpRequest.getPassword()));
		user.setAvatar(resourceImageDAO.findById(Long.parseLong(String.valueOf(1))));
		AppRole role = appUserDAO.findRoleByRoleName("ROLE_USER");
		if(role==null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(
					new MessageResponse("Role Default not found ROLE_USER.", "Không tìm thấy quyền default ROLE_USER."));
		}
		
		user = appUserDAO.insertUser(user);
		if(user==null)	{
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Email or username is unvalid.", "Tài khoản không hợp lệ."));
		}
		
		
		
		
		UserRole userRole= new UserRole();
		userRole.setAppUser(user);
		userRole.setAppRole(role);
		user.setUserRoles(Arrays.asList(userRole));
		
		userRole=appUserDAO.putUserRole(userRole);
		if (userRole!=null) {
			SignUpResponse authResponse = new SignUpResponse(jwtUtil.generateToken(user));
			AccountResponse account = new AccountResponse();
			account.setAvatar(getUrl(serverHttpRequest)+VariableConst.RESOURCE_BEFORE +user.getAvatar());
			account.setUsername(user.getUserName());
			authResponse.setUser(account);
			return ResponseEntity.ok(authResponse);
		}else {
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(
				new MessageResponse("Not insert UserRole.", "Không cấp quyền cho user được."));
			
		}
		
		

	}

}
