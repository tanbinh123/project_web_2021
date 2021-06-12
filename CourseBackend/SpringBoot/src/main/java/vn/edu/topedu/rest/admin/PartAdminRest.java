package vn.edu.topedu.rest.admin;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import vn.edu.topedu.dao.AppUserDAO;
import vn.edu.topedu.dao.CourseDAO;
import vn.edu.topedu.dao.ResourceImageDAO;
import vn.edu.topedu.dao.VideoDAO;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.course.full.FullCourse;
import vn.edu.topedu.entity.course.full.Part;
import vn.edu.topedu.response.MessageResponse;
import vn.edu.topedu.utils.WebUtils;
@RestController
@RequestMapping("/api/admin/course")
public class PartAdminRest {
	@Autowired
	private CourseDAO courseDAO;
	
	@Autowired
	private AppUserDAO appUserDAO;
	@Autowired
	private ResourceImageDAO resourceImageDAO;
	@Autowired
	private VideoDAO videoDAO;
	

	@PostMapping(value="/{fullcourse}/part")
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> postPart(HttpServletRequest httpServletRequest, 
			Authentication authentication,	
			@PathVariable FullCourse fullcourse,
			@RequestBody Map<String,String> body 
			) {
		System.out.println("---------------------------------");
		String title=body.get("namepart");
		System.out.println(String.format("namepart: %s", body.get("namepart")));
		
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null) {				
				Part part= new Part();
				part.setCourseId(fullcourse.getId());
				part.setTitle(title);
//				part.set
				courseDAO.persistPart(part);
				fullcourse.getParts().add(part);
				//fullcourse.setTitle(body.get("title"));
				fullcourse.setUpdateAt(new Date());
				try {
					FullCourse rs = courseDAO.merge(fullcourse);
					rs.setBeforeResource(WebUtils.getUrl(httpServletRequest));
					
					return ResponseEntity.ok(rs);
				} catch (Exception e) {
					e.printStackTrace();
					return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
				}
			}
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
	}
	
	
	
	
	
	@PostMapping(value="/{fullcourse}/{part}")
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> postPart(HttpServletRequest httpServletRequest, 
			Authentication authentication,	
			@PathVariable FullCourse fullcourse,
			@PathVariable Part part,
			@RequestBody Map<String,String> body 
			) {
		System.out.println("---------------------------------");
		if(!part.getCourseId().equals(fullcourse.getId())) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Course not contain part.", "Part không thuộc về khóa học này"));
		}
		String titlePart=body.get("titlePart");
		System.out.println(String.format("titlePart: %s", titlePart));
		
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null) {				
				part.setTitle(titlePart);
//				part.set
				courseDAO.mergePart(part);
				fullcourse.getParts().add(part);
				//fullcourse.setTitle(body.get("title"));
				fullcourse.setUpdateAt(new Date());
				try {
					FullCourse rs = courseDAO.merge(fullcourse);
					rs.setBeforeResource(WebUtils.getUrl(httpServletRequest));
					
					return ResponseEntity.ok(rs);
				} catch (Exception e) {
					e.printStackTrace();
					return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
				}
			}
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
	}
	
	@DeleteMapping(value="/{fullcourse}/{part}")
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> deletePart(HttpServletRequest httpServletRequest, 
			Authentication authentication,	
			@PathVariable FullCourse fullcourse,
			@PathVariable Part part
			) {
		System.out.println("---------------------------------");
		if(!part.getCourseId().equals(fullcourse.getId())) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Course not contain part.", "Part không thuộc về khóa học này"));
		}
		
		
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null) {				
				
//				part.set
				courseDAO.deletePart(part);
				fullcourse.getParts().remove(part);
				courseDAO.deleteAllPartDeleted();
				//fullcourse.setTitle(body.get("title"));
				fullcourse.setUpdateAt(new Date());
				try {
					FullCourse rs = courseDAO.merge(fullcourse);
					rs.setBeforeResource(WebUtils.getUrl(httpServletRequest));
					
					return ResponseEntity.ok(rs);
				} catch (Exception e) {
					e.printStackTrace();
					return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
				}
			}
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
	}
	
}
