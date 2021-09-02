package vn.edu.topedu.rest.admin;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import vn.edu.topedu.dao.AppUserDAO;
import vn.edu.topedu.dao.CourseDAO;
import vn.edu.topedu.dao.ImageAdminDAO;
import vn.edu.topedu.dao.ResourceImageDAO;
import vn.edu.topedu.dao.VideoDAO;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.ImageAdminEntity;
import vn.edu.topedu.entity.ResourceImage;
import vn.edu.topedu.entity.course.full.FullCourse;
import vn.edu.topedu.entity.course.full.Lesson;
import vn.edu.topedu.entity.course.full.Part;
import vn.edu.topedu.entity.course.full.VideoEntity;
import vn.edu.topedu.response.MessageResponse;
import vn.edu.topedu.utils.WebUtils;
@RestController
@RequestMapping("/api/admin/image")
public class ImageAdminRest {
	
	@Autowired
	private CourseDAO courseDAO;
	
	@Autowired
	private AppUserDAO appUserDAO;
	
	@Autowired
	private ImageAdminDAO imageAdminDAO;
	@Autowired
	private ResourceImageDAO resourceImageDAO;
	@Autowired
	private VideoDAO videoDAO;
	
	@GetMapping(value="/list")
	@ResponseBody
	public ResponseEntity<Object> getAllImageAdmin(
			HttpServletRequest httpServletRequest
			) {
		System.out.println("---------------------------------");
		
		try {
			List<ImageAdminEntity> rs = imageAdminDAO.getEntitys(-1);
			for (ImageAdminEntity imageAdminEntity : rs) {
				
				imageAdminEntity.setBeforeResource(WebUtils.getUrl(httpServletRequest));
			}
			
			return ResponseEntity.ok(rs);
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
		}
		
	}
	
	@GetMapping(value="/one")
	@ResponseBody
	public ResponseEntity<Object> getOne(
			HttpServletRequest httpServletRequest,
			@RequestParam String name
			) {
		System.out.println("---------------------------------");
		System.out.println(name);
		
		ImageAdminEntity rs = imageAdminDAO.getEntity(name);
		if(rs==null)	
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Not Image.", "Không có hình với name tồn tại"));
		rs.setBeforeResource(WebUtils.getUrl(httpServletRequest));
		
		return ResponseEntity.ok(rs);
	
		
	}
	
	@GetMapping(value="/tagname")
	@ResponseBody
	public ResponseEntity<Object> getTagName(
			HttpServletRequest httpServletRequest,
			@RequestParam String tagname
			) {
		System.out.println("---------------------------------");
		System.out.println(tagname);
		
		List<ImageAdminEntity> rs = imageAdminDAO.getEntityByTagName(tagname);
		if(rs==null)	
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Not Image.", "Không có hình với name tồn tại"));
		for (ImageAdminEntity imageAdminEntity : rs) {
			
			imageAdminEntity.setBeforeResource(WebUtils.getUrl(httpServletRequest));
		}
		
		return ResponseEntity.ok(rs);
	
		
	}
	
	@DeleteMapping(value="/{imageAdmin}")
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> deleteLesson(HttpServletRequest httpServletRequest, 
			Authentication authentication,	
			@PathVariable ImageAdminEntity imageAdmin
			) {
		System.out.println("---------------------------------");
		if(imageAdmin==null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Course not contain part.", "Part không thuộc về khóa học này"));
		}
		
		
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null) {				
				imageAdmin.setDeleted(true);
				imageAdmin.setUpdateTime(new Date());
				try {
					
					ImageAdminEntity rs = imageAdminDAO.merge(imageAdmin);
					rs.setBeforeResource(WebUtils.getUrl(httpServletRequest));	
					imageAdminDAO.deleteAllImageAdminDeleted();
					return ResponseEntity.ok(rs);
				} catch (Exception e) {
					e.printStackTrace();
					return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
				}
			}
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
	}
	
	
	
	@PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> postProfile(HttpServletRequest httpServletRequest, 
			Authentication authentication,				
			@RequestPart(required=false) String tagName, 
			@RequestPart(required=false) String description, 
			@RequestPart(required=false) MultipartFile image
			) {
		System.out.println("---------------------------------");
		if(image==null||image.isEmpty()) {
			return ResponseEntity.badRequest().body(new MessageResponse("Image not ready", "Chưa chọn hình để tài lên"));
		}
		
		if(tagName==null||tagName.isEmpty()) {
			return ResponseEntity.badRequest().body(new MessageResponse("Required name", "Yêu cầu name"));
		}
		
//		if(description==null||description.isEmpty()) {
//			return ResponseEntity.badRequest().body(new MessageResponse("Required description", "Yêu cầu description"));
//		}
		
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
					ImageAdminEntity entity= new ImageAdminEntity();
					entity.setImageId(newPoster.getId());
					entity.setTagName(tagName);
					entity.setDescription(description);
					try {
						ImageAdminEntity rs = imageAdminDAO.insert(entity);
						rs.setImage(newPoster);
						rs.setBeforeResource(WebUtils.getUrl(httpServletRequest));					
						return ResponseEntity.ok(rs);
					} catch (Exception e) {
						return ResponseEntity.badRequest().body(new MessageResponse("Poster not update", "Không thể cập nhật poster"));
					}
				}
			}
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
	}

}
