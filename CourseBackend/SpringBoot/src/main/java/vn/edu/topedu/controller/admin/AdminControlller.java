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
		AuthRequest authRequest=new AuthRequest();
		model.put("formLogin", authRequest);
		return "login";
	}
	
	@PostMapping("/admin/login")
	public String adminLoginPost(HttpServletRequest httpServletRequest,@ModelAttribute AuthRequest authRequest,Map<String, Object> model, HttpSession httpSession) {
		System.out.println(String.format("Username: %s", authRequest.getUsername()));
		System.out.println(String.format("Password: %s", authRequest.getPassword()));
		AppUser user = appUserDAO.findUserAccount(authRequest.getUsername());
		if (user!=null&&passwordEncoder.encode(authRequest.getPassword()).equals(user.getEncrytedPassword())) {
			httpSession.setAttribute("username", user.getUserName());
			return "redirect:/admin/courses";
		} else {
			model.put("formLogin", authRequest); 
		}
		
		return "login";
	}
	

	
	
	
	@PostMapping(value = "/admin/upload/video/multipartfile", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	@ResponseBody
	public ResponseEntity<Object> testUploadFilePart(@RequestPart("name") String name,
			@RequestPart("file") MultipartFile file) {
		String pathContain = "test";
		try {
			System.out.println(String.format("Name: %s", name));
			System.out.println(String.format("File: %s", file.getOriginalFilename()));
			File p = FileProcess.getPath(pathContain, file.getOriginalFilename()).toFile();
			System.out.println(p.getAbsolutePath());
			p.getParentFile().mkdirs();
			InputStream initialStream = file.getInputStream();
			OutputStream outStream = new FileOutputStream(p);

			byte[] buffer = new byte[8 * 1024];
			int bytesRead;
			while ((bytesRead = initialStream.read(buffer)) != -1) {
				outStream.write(buffer, 0, bytesRead);
			}
			IOUtils.closeQuietly(initialStream);
			IOUtils.closeQuietly(outStream);
			return ResponseEntity.ok().build();
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
		}

	}
	
	@PostMapping(value = "/admin/upload/image/multipartfile", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	@ResponseBody
	public ResponseEntity<Object> testUploadImage(@RequestPart("name") String name,
			@RequestPart("file") MultipartFile file) {
		String pathContain = "test";
		try {
			System.out.println(String.format("Name: %s", name));
			System.out.println(String.format("File: %s", file.getOriginalFilename()));
			File p = FileProcess.getPath(pathContain, file.getOriginalFilename()).toFile();
			System.out.println(p.getAbsolutePath());
			p.getParentFile().mkdirs();
			InputStream initialStream = file.getInputStream();
			OutputStream outStream = new FileOutputStream(p);

			byte[] buffer = new byte[8 * 1024];
			int bytesRead;
			while ((bytesRead = initialStream.read(buffer)) != -1) {
				outStream.write(buffer, 0, bytesRead);
			}
			IOUtils.closeQuietly(initialStream);
			IOUtils.closeQuietly(outStream);
			return ResponseEntity.ok().build();
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
		}

	}

}
