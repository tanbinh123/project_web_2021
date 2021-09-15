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
import vn.edu.topedu.dto.DTOAppRole;
import vn.edu.topedu.entity.AppRole;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.course.BaseCourse;
import vn.edu.topedu.response.MessageResponse;
import vn.edu.topedu.response.PageResponse;
import vn.edu.topedu.response.PageResponse.Pagination;

@RestController
@RequestMapping("/api/admin/role")
public class AppRoleREST {
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
					 List<AppRole> rs1 = appUserDAO.getAppRoles(_page, _limit, _sort, _search);
					 Long count = appUserDAO.countAppRole(_search);
					 
					 List<DTOAppRole> rs = new ArrayList<DTOAppRole>();
					 for (AppRole appRole : rs1) {
						 rs.add(DTOAppRole.cover(appRole));
					}
					// System.err.println(count);
					
//					rs.getUserPoster().getAvatar().setBeforeResource(WebUtils.getUrl(httpServletRequest));
					 @SuppressWarnings({ "rawtypes", "unchecked" })
						PageResponse<BaseCourse> pageResponse = new PageResponse(rs, _limit, _page, count, new Pagination() {
							public String get_sort() {
								return _sort;
							}

						});
					 
					 return ResponseEntity.ok(pageResponse);
				} 
				catch (NoResultException e) {
					 @SuppressWarnings({ "rawtypes", "unchecked" })
						PageResponse<BaseCourse> pageResponse = new PageResponse(new ArrayList<>(), 1	, 1, 0, new Pagination() {
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
	
	@GetMapping(value="/{appRole}")
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> postCate(
			HttpServletRequest httpServletRequest, 	
			@PathVariable AppRole appRole,
			Authentication authentication	
			) {
		System.out.println("---------------------------------");
		
		
		if (authentication != null) {
			authentication.getName();
			AppUser currentUser = appUserDAO.findUserAccount(authentication.getName());
			if (currentUser != null) {	
				return ResponseEntity.ok(appRole);				
			}
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
	}
}
