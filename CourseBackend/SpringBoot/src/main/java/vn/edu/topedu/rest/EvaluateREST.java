package vn.edu.topedu.rest;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import vn.edu.topedu.dao.AppUserDAO;
import vn.edu.topedu.dao.CourseDAO;
import vn.edu.topedu.dao.OwerCourseDAO;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.EvaluateEntity;
import vn.edu.topedu.entity.course.Course;
import vn.edu.topedu.entity.course.full.FullCourse;
import vn.edu.topedu.entity.previewcourse.PreviewCourseEntity;
import vn.edu.topedu.response.MessageResponse;
import vn.edu.topedu.response.PageResponse;
import vn.edu.topedu.response.PageResponse.Pagination;
import vn.edu.topedu.utils.WebUtils;

@RestController
@RequestMapping("/course")
public class EvaluateREST {
	@Autowired
	private CourseDAO courseDAO;
	@Autowired
	private OwerCourseDAO owerCourseDAO;
	@Autowired
	private AppUserDAO appUserDAO;
	
	@PostMapping(value="/{fullcourse}/rating")
	@ResponseBody
	@PreAuthorize("hasRole('USER')")
	public ResponseEntity<Object> postRating(
			HttpServletRequest httpServletRequest, 
			@PathVariable FullCourse fullcourse,
			@RequestBody Map<String, String> body,			
			Authentication authentication	
			) {
		System.out.println("---------------------------------");
		
		
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null) {				
				String content=body.get("content");
				System.out.println(String.format("Content : %s", content));
				
				String rating=body.get("rating");
				System.out.println(String.format("rating : %s", rating));
				
				EvaluateEntity entity= new EvaluateEntity();
				entity.setContent(content);
				entity.setCourseId(fullcourse.getId());
				entity.setUserPosterId(appUser.getId());
				entity.setRating(Double.valueOf(rating));
				try {
					EvaluateEntity rs = courseDAO.persistEvaluateEntity(entity);					
					rs.getUserPoster().getAvatar().setBeforeResource(WebUtils.getUrl(httpServletRequest));
					return ResponseEntity.ok(rs);
				} catch (Exception e) {
					return ResponseEntity.badRequest().body(new MessageResponse("Poster not update", "Không thể cập nhật poster"));
				}
			}
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
	}
	
	@GetMapping(value="/{previewCourse}/ratings")
	@ResponseBody
	@PreAuthorize("hasRole('USER')")
	public ResponseEntity<Object> getRatings(
			HttpServletRequest httpServletRequest, 
			@PathVariable PreviewCourseEntity previewCourse,				
			@RequestParam(defaultValue = "-1") int _page,
			@RequestParam(defaultValue = "-1") int _limit,
			@RequestParam(defaultValue = "id:asc") String _sort, 
			@RequestParam(defaultValue = "") String _search,
			Authentication authentication	
			) {
		System.out.println("---------------------------------");
		
		
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null) {				
				
				try {
					List<EvaluateEntity> rs = courseDAO.getEvaluates(previewCourse.getId(),_page,_limit,_sort,_search);					
					Long count = courseDAO.countEvaluates(previewCourse.getId(),_search);					
					for(EvaluateEntity e: rs) {						
						e.getUserPoster().getAvatar().setBeforeResource(WebUtils.getUrl(httpServletRequest));
					}
					
					
					@SuppressWarnings({ "rawtypes", "unchecked" })
					PageResponse<Course> pageResponse = new PageResponse(rs, _limit, _page, count, new Pagination() {
						public String get_sort() {
							return _sort;
						}

					});
					
					return ResponseEntity.ok(pageResponse);
				} catch (Exception e) {
					System.err.println(e.getMessage());
					return ResponseEntity.badRequest().body(new MessageResponse("List ratings not ready", "Không thể lấy danh sách ratings"));
				}
			}
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
	}

}
