package vn.edu.topedu.rest;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.NoResultException;
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
import vn.edu.topedu.entity.course.BaseCourse;
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
				try {
					EvaluateEntity ev = courseDAO.getEvalUser(fullcourse.getId(), appUser.getId());
					if(ev!=null)
						return ResponseEntity.badRequest().body(new MessageResponse("user had rating.", "User Này đã đánh giá"));
					
				} catch (NoResultException e) {
					
				}
				String content=body.get("content");
				System.out.println(String.format("Content : %s", content));
				if(content==null)return ResponseEntity.badRequest().body(new MessageResponse("Content null.", "Không có content"));
				String rating=body.get("rating");
				System.out.println(String.format("rating : %s", rating));
				if(rating==null)return ResponseEntity.badRequest().body(new MessageResponse("Rating null.", "Không có rating"));
				String deleted=body.get("deleted");
				System.out.println(String.format("deleted : %s", deleted));
				if(deleted==null||!deleted.equals("true"))deleted="false";
				
				EvaluateEntity entity= new EvaluateEntity();
				entity.setContent(content);
				entity.setCourseId(fullcourse.getId());
				entity.setUserPosterId(appUser.getId());
				entity.setRating(Double.valueOf(rating));
				entity.setUserPoster(appUser);
				entity.setDeleted(Boolean.parseBoolean(deleted));
				try {
					EvaluateEntity rs = courseDAO.persistEvaluateEntity(entity);					
					rs.getUserPoster().getAvatar().setBeforeResource(WebUtils.getUrl(httpServletRequest));
					return ResponseEntity.ok(rs);
				} catch (Exception e) {
					System.err.println(e.getMessage());
					return ResponseEntity.badRequest().body(new MessageResponse("Poster not update", "Không thể cập nhật poster"));
				}
			}
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
	}
	
	@PostMapping(value="/{fullcourse}/rating/{evaluate}")
	@ResponseBody
	@PreAuthorize("hasRole('USER')")
	public ResponseEntity<Object> updateRating(
			HttpServletRequest httpServletRequest, 
			@PathVariable FullCourse fullcourse,
			@PathVariable EvaluateEntity evaluate,
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
				String deleted=body.get("deleted");
				//if(deleted==null) deleted=false;
				System.out.println(String.format("deleted : %s", deleted));
				if(deleted==null||!deleted.equals("true")) {
					deleted="false";				
					if(content==null)return ResponseEntity.badRequest().body(new MessageResponse("Content null.", "Không có content"));
					if(rating==null)return ResponseEntity.badRequest().body(new MessageResponse("Rating null.", "Không có rating"));
				}
				
				evaluate.setContent(content);
				evaluate.setCourseId(fullcourse.getId());
				evaluate.setUserPosterId(appUser.getId());
				evaluate.setRating(Double.valueOf(rating));
				evaluate.setUserPoster(appUser);
				evaluate.setDeleted(Boolean.parseBoolean(deleted));
				try {
					EvaluateEntity rs = courseDAO.mergeEvaluateEntity(evaluate);					
					rs.getUserPoster().getAvatar().setBeforeResource(WebUtils.getUrl(httpServletRequest));
					return ResponseEntity.ok(rs);
				} catch (Exception e) {
					System.err.println(e.getMessage());
					return ResponseEntity.badRequest().body(new MessageResponse("Poster not update", "Không thể cập nhật poster"));
				}
			}
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
	}
	
	@GetMapping(value="/{previewCourse}/ratings")
	@ResponseBody
	//@PreAuthorize("hasRole('USER')")
	public ResponseEntity<Object> getRatings(
			HttpServletRequest httpServletRequest, 
			@PathVariable PreviewCourseEntity previewCourse,				
			@RequestParam(defaultValue = "0") int _page,
			@RequestParam(defaultValue = "10") int _limit,
			@RequestParam(defaultValue = "id:asc") String _sort, 
			@RequestParam(defaultValue = "") String _search
			) {
		System.out.println("---------------------------------");
		
		
			
				
				try {
					List<EvaluateEntity> rs = courseDAO.getEvaluates(previewCourse.getId(),_page,_limit,_sort,_search);					
					Long count = courseDAO.countEvaluates(previewCourse.getId(),_search);					
					for(EvaluateEntity e: rs) {						
						e.getUserPoster().getAvatar().setBeforeResource(WebUtils.getUrl(httpServletRequest));
					}
					
					
					@SuppressWarnings({ "rawtypes", "unchecked" })
					PageResponse<BaseCourse> pageResponse = new PageResponse(rs, _limit, _page, count, new Pagination() {
						public String get_sort() {
							return _sort;
						}

					});
					
					return ResponseEntity.ok(pageResponse);
				} 
				catch (NoResultException e) {
					System.err.println(e.getMessage());
					@SuppressWarnings({ "rawtypes", "unchecked" })
					PageResponse<BaseCourse> pageResponse = new PageResponse(new ArrayList<>(), 1, 1, 0, new Pagination() {
						public String get_sort() {
							return _sort;
						}

					});
					
					return ResponseEntity.ok(pageResponse);
				}
				catch (Exception e) {
					System.err.println(e.getMessage());
					return ResponseEntity.badRequest().body(new MessageResponse("List ratings not ready", "Không thể lấy danh sách ratings"));
				}
			
		
	}
	
	
	
	

}
