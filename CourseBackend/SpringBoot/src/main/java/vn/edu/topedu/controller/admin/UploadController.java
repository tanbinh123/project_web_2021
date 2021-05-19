package vn.edu.topedu.controller.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import vn.edu.topedu.dao.AppUserDAO;
import vn.edu.topedu.dao.ResourceImageDAO;
import vn.edu.topedu.entity.ResourceImage;
import vn.edu.topedu.fileprocess.FileProcess;
import vn.edu.topedu.request.LoginFormRedirect;

@Controller
public class UploadController {

	private static final String String = null;

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
	@Autowired
	ResourceImageDAO resourceImageDAO;
	@Autowired
	AppUserDAO appUserDAO;
	@PostMapping(value = "/admin/upload/image/multipartfile", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public String testUploadImage(@RequestPart("file") MultipartFile file, Map<String, Object> model, HttpSession httpSession) {
		String username = (String) httpSession.getAttribute("username");
		if (username == null) {
			LoginFormRedirect authRequest=new LoginFormRedirect();
			authRequest.setUrlReturn("/admin/upload/image/multipartfile");
			model.put("formLogin", authRequest);
			return "login";
		}
		
		
		String pathContain = String.format("user/%s/img", username);
		try {
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
			
			ResourceImage image=new ResourceImage();
			pathContain = String.format("user/%s/image", username);
			image.setPath(pathContain+"/"+file.getOriginalFilename());
			image.setAppUser(appUserDAO.findUserAccount(username));
			resourceImageDAO.save(image);
			System.err.println("Upload Success");
			return "upload-image";
		} catch (Exception e) {
			System.err.println(e.getMessage());
			return "upload-image";
		}

	}

	@GetMapping("/admin/upload/image/multipartfile")
	public String adminLogin(HttpServletRequest httpServletRequest, Map<String, Object> model,
			HttpSession httpSession) {
		String username = (String) httpSession.getAttribute("username");
		if (username == null) {
			LoginFormRedirect authRequest=new LoginFormRedirect();
			authRequest.setUrlReturn("/admin/upload/image/multipartfile");
			model.put("formLogin", authRequest);
			return "login";
		}
		return "upload-image";
	}

	@GetMapping("/admin")
	public String admin(HttpServletRequest httpServletRequest, Map<String, Object> model, HttpSession httpSession) {
		String username = (String) httpSession.getAttribute("username");
		if (username == null) {
			LoginFormRedirect authRequest=new LoginFormRedirect();
			authRequest.setUrlReturn("/admin");
			model.put("formLogin", authRequest);
			return "login";
		}
		return "admin";
	}

}
