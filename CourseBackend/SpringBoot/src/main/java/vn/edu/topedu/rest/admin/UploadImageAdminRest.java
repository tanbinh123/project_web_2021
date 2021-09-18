package vn.edu.topedu.rest.admin;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import vn.edu.topedu.dao.ResourceImageDAO;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.ResourceImage;
import vn.edu.topedu.entity.course.full.FullCourse;
import vn.edu.topedu.response.MessageResponse;
import vn.edu.topedu.utils.WebUtils;

@RestController
@RequestMapping("/api/admin/upload")
public class UploadImageAdminRest {
	@Autowired
	private ResourceImageDAO resourceImageDAO;
	@PostMapping(value = "/finder", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	@ResponseBody
	//@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> finder(
			HttpServletRequest httpServletRequest, 
			@RequestPart("upload") MultipartFile file) {
		
		ResourceImage newPoster=null;
		try {
			newPoster = resourceImageDAO.uploadImage(file, null, false);
			newPoster.setBeforeResource(WebUtils.getUrl(httpServletRequest));
			final String url=newPoster.getImage();
			return ResponseEntity.ok(new Object() {
				public boolean getUploaded() {
					return true;
				}
				public String getUrl() {
					return url;
				}
			});
		} catch (Exception e) {
			return ResponseEntity.ok(new Object() {
				public boolean getUploaded() {
					return false;
				}
				public String getUrl() {
					return null;
				}
			});
		}
		
		
	
			
			
	

	}


}
