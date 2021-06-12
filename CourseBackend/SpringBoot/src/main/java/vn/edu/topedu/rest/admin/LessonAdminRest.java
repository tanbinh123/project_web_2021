package vn.edu.topedu.rest.admin;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.DeleteMapping;
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
import vn.edu.topedu.dao.VideoDAO;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.course.full.FullCourse;
import vn.edu.topedu.entity.course.full.Lesson;
import vn.edu.topedu.entity.course.full.Part;
import vn.edu.topedu.entity.course.full.VideoEntity;
import vn.edu.topedu.response.MessageResponse;
import vn.edu.topedu.utils.WebUtils;
@RestController
@RequestMapping("/api/admin/course")
public class LessonAdminRest {
	
	@Autowired
	private CourseDAO courseDAO;
	
	@Autowired
	private AppUserDAO appUserDAO;
	@Autowired
	private ResourceImageDAO resourceImageDAO;
	@Autowired
	private VideoDAO videoDAO;
	
	@DeleteMapping(value="/{fullcourse}/{part}/{lesson}")
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> deleteLesson(HttpServletRequest httpServletRequest, 
			Authentication authentication,	
			@PathVariable FullCourse fullcourse,
			@PathVariable Part part,
			@PathVariable Lesson lesson
			) {
		System.out.println("---------------------------------");
		if(!part.getCourseId().equals(fullcourse.getId())) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Course not contain part.", "Part không thuộc về khóa học này"));
		}
		if(!lesson.getPartId().equals(part.getId())) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Part not contain lesson.", "Lesson không thuộc về phần học này"));
		}
		
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null) {				
				
//				part.set
				courseDAO.deleteLesson(lesson);
				part.getLessons().remove(lesson);
				courseDAO.deleteAllLessonDeleted();
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
	@PostMapping(value="/{fullcourse}/{part}/lesson" , consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> postLesson(HttpServletRequest httpServletRequest, 
			Authentication authentication,	
			@PathVariable FullCourse fullcourse,
			@PathVariable Part part,
			@RequestPart MultipartFile videoCourse,
			@RequestPart String description
			) {
		
		if(!part.getCourseId().equals(fullcourse.getId())) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Course not contain part.", "Part không thuộc về khóa học này"));
		}
		System.out.println("---------------------------------");
		System.out.println(String.format("videoCourse: %s", videoCourse));
		System.out.println(String.format("description: %s", description));
		
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null) {				
				Lesson lesson = new Lesson();
				lesson.setPartId(part.getId());
				lesson.setDescription(description);
				VideoEntity newPoster=null;
				try {
					newPoster = videoDAO.uploadVideo(videoCourse, appUser);
				} catch (Exception e) {
					return ResponseEntity.badRequest().body(new MessageResponse("Video not upload", "Video không thể tải lên"));
				}
				if(newPoster!=null) {
					lesson.setVideoId(newPoster.getId());
					lesson.setVideo(newPoster);
					
				}
//				part.set
				courseDAO.persistLesson(lesson);
				part.getLessons().add(lesson);
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

	@PostMapping(value="/{fullcourse}/{part}/{lesson}" , consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> updateLesson(HttpServletRequest httpServletRequest, 
			Authentication authentication,	
			@PathVariable FullCourse fullcourse,
			@PathVariable Part part,
			@PathVariable Lesson lesson,
			@RequestPart(required = false) MultipartFile videoCourse,
			@RequestPart String description
			) {
		
		if(!part.getCourseId().equals(fullcourse.getId())) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Course not contain part.", "Part không thuộc về khóa học này"));
		}
		if(!lesson.getPartId().equals(part.getId())) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Part not contain lesson.", "Lesson không thuộc về phần học này"));
		}
		System.out.println("---------------------------------");
		System.out.println(String.format("videoCourse: %s", videoCourse));
		System.out.println(String.format("description: %s", description));
		
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null) {	
				
				lesson.setDescription(description);
				if(videoCourse!=null) {
					VideoEntity newPoster=null;
					try {
						newPoster = videoDAO.uploadVideo(videoCourse, appUser);
					} catch (Exception e) {
						return ResponseEntity.badRequest().body(new MessageResponse("Video not upload", "Video không thể tải lên"));
					}
					if(newPoster!=null) {
						lesson.setVideoId(newPoster.getId());
						lesson.setVideo(newPoster);
						
					}
					
				}
//				part.set
				courseDAO.mergeLesson(lesson);
				part.getLessons().add(lesson);
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
