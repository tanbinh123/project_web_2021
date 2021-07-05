package vn.edu.topedu.rest.admin;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import vn.edu.topedu.dao.AppUserDAO;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.course.Course;
import vn.edu.topedu.response.MessageResponse;
import vn.edu.topedu.response.PageResponse;
import vn.edu.topedu.response.PageResponse.Pagination;
import vn.edu.topedu.utils.WebUtils;

@RestController
@RequestMapping("/api/admin/user")
public class AppUserREST {
	@Autowired
	private AppUserDAO appUserDAO;
	@GetMapping(value="/list")
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> postCate(
			HttpServletRequest httpServletRequest, 
			@RequestParam(defaultValue = "0") int _page,
			@RequestParam(defaultValue = "10") int _limit,
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
					 List<AppUser> rs = appUserDAO.getAppUsers(_page, _limit, _sort, _search);
					 Long count = appUserDAO.countAppUser(_search);
					// System.err.println(count);
					 for(AppUser a: rs) {
						 a.setBeforeResource(WebUtils.getUrl(httpServletRequest));
					 }
//					rs.getUserPoster().getAvatar().setBeforeResource(WebUtils.getUrl(httpServletRequest));
					 @SuppressWarnings({ "rawtypes", "unchecked" })
						PageResponse<Course> pageResponse = new PageResponse(rs, _limit, _page, count, new Pagination() {
							public String get_sort() {
								return _sort;
							}

						});
					 
					 return ResponseEntity.ok(pageResponse);
				} 
				catch (NoResultException e) {
					 @SuppressWarnings({ "rawtypes", "unchecked" })
						PageResponse<Course> pageResponse = new PageResponse(new ArrayList<>(), 1	, 1, 0, new Pagination() {
							public String get_sort() {
								return _sort;
							}

						});
					 
					 return ResponseEntity.ok(pageResponse);
				}
				catch (Exception e) {
					System.err.println(e.getMessage());
					return ResponseEntity.badRequest().body(new MessageResponse("Poster not update", "Không thể cập nhật poster"));
				}
			}
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
	}
	
	@GetMapping(value="/{appUser}")
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> postCate(
			HttpServletRequest httpServletRequest, 	
			@PathVariable AppUser appUser,
			Authentication authentication	
			) {
		System.out.println("---------------------------------");
		
		
		if (authentication != null) {
			authentication.getName();
			AppUser currentUser = appUserDAO.findUserAccount(authentication.getName());
			if (currentUser != null) {	
				appUser.setBeforeResource(WebUtils.getUrl(httpServletRequest));
				return ResponseEntity.ok(appUser);				
			}
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
	}
}
