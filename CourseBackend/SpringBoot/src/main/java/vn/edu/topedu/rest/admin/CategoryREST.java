package vn.edu.topedu.rest.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import vn.edu.topedu.dao.AppUserDAO;
import vn.edu.topedu.dao.CourseDAO;
import vn.edu.topedu.dao.OwerCourseDAO;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.CategoryEntity;
import vn.edu.topedu.response.MessageResponse;

@RestController
@RequestMapping("/category")
public class CategoryREST {
	@Autowired
	private CourseDAO courseDAO;
	@Autowired
	private OwerCourseDAO owerCourseDAO;
	@Autowired
	private AppUserDAO appUserDAO;

	
	
	@PostMapping(value="/new")
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> postCate(
			HttpServletRequest httpServletRequest, 			
			@RequestBody Map<String, String> body,			
			Authentication authentication	
			) {
		System.out.println("---------------------------------");
		
		
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null) {				
				String name=body.get("name");
				System.out.println(String.format("Name : %s", name));
				if(name==null)return ResponseEntity.badRequest().body(new MessageResponse("Content null.", "Không có content"));
				String deleted=body.get("deleted");
				System.out.println(String.format("deleted : %s", deleted));
				if(deleted==null||!deleted.equals("true"))deleted="false";
				String actived=body.get("actived");
				System.out.println(String.format("actived : %s", deleted));
				if(actived==null||!actived.equals("false"))actived="true";
				
				CategoryEntity entity= new CategoryEntity();
				entity.setDeleted(Boolean.parseBoolean(deleted));
				entity.setActived(Boolean.parseBoolean(actived));
				entity.setName(name);
				try {
					CategoryEntity rs = courseDAO.persistCategoryEntity(entity);					
//					rs.getUserPoster().getAvatar().setBeforeResource(WebUtils.getUrl(httpServletRequest));
					return ResponseEntity.ok(rs);
				} catch (Exception e) {
					System.err.println(e.getMessage());
					return ResponseEntity.badRequest().body(new MessageResponse("Poster not update", "Không thể cập nhật poster"));
				}
			}
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
	}
	
	@PostMapping(value="/{category}")
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> updateCate(
			HttpServletRequest httpServletRequest, 
			@PathVariable CategoryEntity category,
			@RequestBody Map<String, String> body,			
			Authentication authentication	
			) {
		System.out.println("---------------------------------");
		
		
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null) {				
				String name=body.get("name");
				System.out.println(String.format("Name : %s", name));
				if(name==null)return ResponseEntity.badRequest().body(new MessageResponse("Content null.", "Không có content"));
				String deleted=body.get("deleted");
				System.out.println(String.format("deleted : %s", deleted));
				if(deleted==null||!deleted.equals("true"))deleted="false";
				String actived=body.get("actived");
				System.out.println(String.format("actived : %s", deleted));
				if(actived==null||!actived.equals("false"))actived="true";
				
				
				category.setDeleted(Boolean.parseBoolean(deleted));
				category.setActived(Boolean.parseBoolean(actived));
				category.setName(name);
				try {
					CategoryEntity rs = courseDAO.mergeCategoryEntity(category);					
//					rs.getUserPoster().getAvatar().setBeforeResource(WebUtils.getUrl(httpServletRequest));
					return ResponseEntity.ok(rs);
				} catch (Exception e) {
					System.err.println(e.getMessage());
					return ResponseEntity.badRequest().body(new MessageResponse("Poster not update", "Không thể cập nhật poster"));
				}
			}
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
	}

}
