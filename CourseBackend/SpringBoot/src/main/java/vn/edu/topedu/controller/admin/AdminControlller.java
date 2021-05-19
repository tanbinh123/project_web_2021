package vn.edu.topedu.controller.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.ConversionService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import vn.edu.topedu.dao.AppUserDAO;
import vn.edu.topedu.dao.CourseDAO;
import vn.edu.topedu.dao.ResourceImageDAO;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.fileprocess.FileProcess;
import vn.edu.topedu.jwt.security.PBKDF2Encoder;
import vn.edu.topedu.request.AuthRequest;
import vn.edu.topedu.request.LoginFormRedirect;

@Controller
public class AdminControlller {
	
	@Autowired
	CourseDAO courseDAO;
	@Autowired
	ResourceImageDAO resourceImageDAO;
	
	@Autowired
	ConversionService conversionService;
	
	
	
	@Autowired
	private PBKDF2Encoder passwordEncoder;
	@Autowired
	private AppUserDAO appUserDAO;
	@GetMapping("/admin/login")
	public String adminLogin(HttpServletRequest httpServletRequest,Map<String, Object> model, HttpSession httpSession) {
		LoginFormRedirect authRequest=new LoginFormRedirect();
		authRequest.setUrlReturn("/admin");
		model.put("formLogin", authRequest);
		return "login";
	}
	
	@PostMapping("/admin/login")
	public String adminLoginPost(HttpServletRequest httpServletRequest,@ModelAttribute LoginFormRedirect authRequest,Map<String, Object> model, HttpSession httpSession) {
		System.out.println(String.format("Username: %s", authRequest.getUsername()));
		System.out.println(String.format("Password: %s", authRequest.getPassword()));
		AppUser user = appUserDAO.findUserAccount(authRequest.getUsername());
		if (user!=null&&passwordEncoder.encode(authRequest.getPassword()).equals(user.getEncrytedPassword())) {
			httpSession.setAttribute("username", user.getUserName());
			return "redirect:"+authRequest.getUrlReturn();
		} else {
			model.put("formLogin", authRequest); 
		}
		
		return "login";
	}
	

	
	
	
	

}
