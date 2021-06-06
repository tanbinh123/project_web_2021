package vn.edu.topedu.rest.admin;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import vn.edu.topedu.dao.AppUserDAO;
import vn.edu.topedu.dao.CourseDAO;
import vn.edu.topedu.dao.ResourceImageDAO;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.ResourceImage;
import vn.edu.topedu.entity.course.full.FullCourse;
import vn.edu.topedu.response.MessageResponse;
import vn.edu.topedu.utils.WebUtils;

@RestController
@RequestMapping("/api/admin/course")
public class CourseAdminRest {
	@Autowired
	private CourseDAO courseDAO;
	
	@Autowired
	private AppUserDAO appUserDAO;
	@Autowired
	private ResourceImageDAO resourceImageDAO;
	
	@GetMapping(value = "/{id}")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> getCourse(@PathVariable Long id, HttpServletRequest httpServletRequest) {
		FullCourse course = courseDAO.getFullCourse(id);
		String bf = WebUtils.getUrl(httpServletRequest);
		course.setBeforeResource(bf);		
		return ResponseEntity.ok(course);
	}
	
	@PostMapping(value="/{fullcourse}/img-poster", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> postProfile(HttpServletRequest httpServletRequest, 
			Authentication authentication,	
			@PathVariable FullCourse fullcourse,
			@RequestPart(required=false) MultipartFile image			
			) {
		System.out.println("---------------------------------");
		if(image==null||image.isEmpty()) {
			return ResponseEntity.badRequest().body(new MessageResponse("Image not ready", "Chưa chọn hình để tài lên"));
		}
		
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null) {				
				
				ResourceImage newPoster=null;
				try {
					newPoster = resourceImageDAO.uploadImage(image, appUser);
				} catch (Exception e) {
					return ResponseEntity.badRequest().body(new MessageResponse("Image not upload", "Hình không thể tải lên"));
				}
				if(newPoster!=null) {
					fullcourse.setImgPosterId(newPoster.getId());
					fullcourse.setImagePoster(newPoster);
				}
				try {
					courseDAO.updateFullCourse(fullcourse);
				} catch (Exception e) {
					return ResponseEntity.badRequest().body(new MessageResponse("Poster not update", "Không thể cập nhật poster"));
				}
				fullcourse.setBeforeResource(WebUtils.getUrl(httpServletRequest));
				
				return ResponseEntity.ok(fullcourse);
			}
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
	}

}
