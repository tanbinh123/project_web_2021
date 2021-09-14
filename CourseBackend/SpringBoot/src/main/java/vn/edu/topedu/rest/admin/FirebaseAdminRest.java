package vn.edu.topedu.rest.admin;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.UnexpectedRollbackException;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.FirebaseToken;

import vn.edu.topedu.consts.VariableConst;
import vn.edu.topedu.dao.AppUserDAO;
import vn.edu.topedu.dao.OwerCourseDAO;
import vn.edu.topedu.dao.ResourceImageDAO;
import vn.edu.topedu.entity.AppRole;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.ImageAdminEntity;
import vn.edu.topedu.entity.ResourceImage;
import vn.edu.topedu.entity.UserRole;
import vn.edu.topedu.entity.course.Course;
import vn.edu.topedu.jwt.security.JWTUtil;
import vn.edu.topedu.jwt.security.PBKDF2Encoder;
import vn.edu.topedu.response.AuthResponse;
import vn.edu.topedu.response.MessageResponse;
import vn.edu.topedu.response.SignUpResponse;
import vn.edu.topedu.response.model.AccountResponse;
import vn.edu.topedu.utils.WebUtils;

@RestController
@RequestMapping("/api/admin/firebase")
public class FirebaseAdminRest {
	@Autowired
	private ResourceImageDAO resourceImageDAO;
	@Autowired
	private AppUserDAO appUserDAO;
	
	@Autowired
	private JWTUtil jwtUtil;

	@Autowired
	private PBKDF2Encoder passwordEncoder;
	
	@Autowired
	private OwerCourseDAO owerCourseDAO;

	@PostMapping(value = "/verify")
	@ResponseBody
	public ResponseEntity<Object> postProfile(
			HttpServletRequest httpServletRequest, 
			@RequestBody Map<String, String> body) {
		System.out.println("---------------------------------");

		// idToken comes from the client app (shown above)
		String accessToken=body.get("accessToken");
		FirebaseToken decodedToken;
		AppRole appRole = appUserDAO.findRoleByRoleName("ROLE_ADMIN");
		
		try {
			decodedToken = FirebaseAuth.getInstance().verifyIdToken(accessToken);
			//decodedToken.isEmailVerified();
			//decodedToken.get
			String uid = decodedToken.getUid();
			//if(de)
			AppUser appUser = appUserDAO.findUserByEmail(decodedToken.getEmail());
			if(appUser!=null) {
				appUser.getAvatar().setBeforeResource(WebUtils.getUrl(httpServletRequest));
				AuthResponse authResponse = new AuthResponse(jwtUtil.generateToken(appUser));
				AccountResponse account = new AccountResponse();
				account.setAvatar(appUser.getAvatar().getImage());
				account.setUsername(appUser.getUserName());
				authResponse.setUser(account);
				List<Course> lstCourse = owerCourseDAO.querryAllBought(appUser.getId());
				for (Course c : lstCourse) {
					c.setBeforeResource(WebUtils.getUrl(httpServletRequest));
				}
				authResponse.setCourses(lstCourse);
				if (appUser.getAuthorities().contains(appRole)) {
					authResponse.getUser().setAdmin(true);
				}				
				authResponse.setProfile(appUser);
				return ResponseEntity.ok(authResponse);
			}
			
			
			
			ResourceImage image= new ResourceImage();
			image.setPath(decodedToken.getPicture());
			//image.
			image=resourceImageDAO.save(image);
			
			
			AppUser user = new AppUser();
			user.setEmail(decodedToken.getEmail());
			user.setUserName(decodedToken.getUid());
			user.setFullname(decodedToken.getName());
			user.setAvatar(image);
			user.setEncrytedPassword(passwordEncoder.encode(decodedToken.getUid()));
			//user.setAvatar(resourceImageDAO.findFirst());
			AppRole role = appUserDAO.findRoleByRoleName("ROLE_USER");
			if (role == null) {
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse(
						"Role Default not found ROLE_USER.", "Không tìm thấy quyền default ROLE_USER."));
			}
			try {
				user = appUserDAO.insertUser(user);
				
			} catch (UnexpectedRollbackException e) {
				e.printStackTrace();
				return ResponseEntity.status(HttpStatus.BAD_REQUEST)
						.body(new MessageResponse("Email or username is unvalid.", "Tài khoản không hợp lệ."));
			
			}
			if (user == null) {
				return ResponseEntity.status(HttpStatus.BAD_REQUEST)
						.body(new MessageResponse("Email or username is unvalid.", "Tài khoản không hợp lệ."));
			}

			UserRole userRole = new UserRole();
			userRole.setAppUser(user);
			userRole.setAppRole(role);
			user.setUserRoles(Arrays.asList(userRole));

			userRole = appUserDAO.putUserRole(userRole);
			if (userRole != null) {
				appUser=user;
				appUser.getAvatar().setBeforeResource(WebUtils.getUrl(httpServletRequest));
				AuthResponse authResponse = new AuthResponse(jwtUtil.generateToken(appUser));
				AccountResponse account = new AccountResponse();
				account.setAvatar(appUser.getAvatar().getImage());
				account.setUsername(appUser.getUserName());
				authResponse.setUser(account);
				List<Course> lstCourse = owerCourseDAO.querryAllBought(appUser.getId());
				for (Course c : lstCourse) {
					c.setBeforeResource(WebUtils.getUrl(httpServletRequest));
				}
				authResponse.setCourses(lstCourse);
				if (appUser.getAuthorities().contains(appRole)) {
					authResponse.getUser().setAdmin(true);
				}				
				authResponse.setProfile(appUser);
				return ResponseEntity.ok(authResponse);
			} else {
				return ResponseEntity.status(HttpStatus.BAD_REQUEST)
						.body(new MessageResponse("Not insert UserRole.", "Không cấp quyền cho user được."));

			}
			
			
		} catch (FirebaseAuthException e) {
			e.printStackTrace();
		}

		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
	}

}
