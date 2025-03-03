package vn.edu.topedu.rest.admin;

import java.io.File;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

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
import org.springframework.web.bind.annotation.RequestBody;
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
import vn.edu.topedu.entity.ResourceImage;
import vn.edu.topedu.entity.course.full.FullCourse;
import vn.edu.topedu.entity.course.full.Learning;
import vn.edu.topedu.entity.course.full.Lesson;
import vn.edu.topedu.entity.course.full.Part;
import vn.edu.topedu.entity.course.full.VideoEntity;
import vn.edu.topedu.fileprocess.FileProcess;
import vn.edu.topedu.humble.VideoInfo;
import vn.edu.topedu.response.MessageResponse;
import vn.edu.topedu.utils.WebUtils;

@RestController
@RequestMapping("/api/admin/course")
public class CourseAdminRest {
	@Autowired
	private VideoInfo videoService;
	@Autowired
	private CourseDAO courseDAO;
	
	@Autowired
	private AppUserDAO appUserDAO;
	@Autowired
	private ResourceImageDAO resourceImageDAO;
	@Autowired
	private VideoDAO videoDAO;
	
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
	public ResponseEntity<Object> postImagePoster(HttpServletRequest httpServletRequest, 
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
					newPoster = resourceImageDAO.uploadImage(image, appUser, true);
				} catch (Exception e) {
					return ResponseEntity.badRequest().body(new MessageResponse("Image not upload", "Hình không thể tải lên"));
				}
				if(newPoster!=null) {
					fullcourse.setImagePosterId(newPoster.getId());
					fullcourse.setImagePoster(newPoster);
				}
				try {
					fullcourse.setUpdateAt(new Date());
					FullCourse rs = courseDAO.merge(fullcourse);
					rs.setImagePoster(newPoster);
					rs.setBeforeResource(WebUtils.getUrl(httpServletRequest));					
					return ResponseEntity.ok(rs);
				} catch (Exception e) {
					return ResponseEntity.badRequest().body(new MessageResponse("Poster not update", "Không thể cập nhật poster"));
				}
			}
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
	}
	
	@PostMapping(value="/{fullcourse}/video-demo", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> postVideoDemo(HttpServletRequest httpServletRequest, 
			Authentication authentication,	
			@PathVariable FullCourse fullcourse,
			@RequestPart(required=false) MultipartFile video			
			) {
		System.out.println("---------------------------------");
		if(video==null||video.isEmpty()) {
			return ResponseEntity.badRequest().body(new MessageResponse("Video not ready", "Chưa chọn video để tài lên"));
		}
		
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null) {				
				
				VideoEntity newPoster=null;
				try {
					newPoster = videoDAO.uploadVideo(video, appUser, true);
				} catch (Exception e) {
					return ResponseEntity.badRequest().body(new MessageResponse("Video not upload", "Video không thể tải lên"));
				}
				if(newPoster!=null) {
					fullcourse.setVideoDemoId(newPoster.getId());
					fullcourse.setDemo(newPoster);
					
					try {
						File f = FileProcess.getPath(newPoster.absPath()).toFile();
						if (f.exists()) {
							newPoster.setDuration(videoService.getDuration(f));
							videoDAO.mergePart(newPoster);
						}
					} catch (Exception e) {
					}

				}
				try {
					fullcourse.setUpdateAt(new Date());
					FullCourse rs = courseDAO.merge(fullcourse);
					rs.setBeforeResource(WebUtils.getUrl(httpServletRequest));					
					return ResponseEntity.ok(rs);
				} catch (Exception e) {
					return ResponseEntity.badRequest().body(new MessageResponse("Poster not update", "Không thể cập nhật poster"));
				}
			}
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
	}
	
	@PostMapping(value="/{fullcourse}")
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> postBase(HttpServletRequest httpServletRequest, 
			Authentication authentication,	
			@PathVariable FullCourse fullcourse,
			@RequestBody Map<String,String> body 
			) {
		System.out.println("---------------------------------");
		String title=body.get("title");
		String description=body.get("description");
		if(description==null)description="";
		String longDescription=body.get("longDescription");
		if(longDescription==null)longDescription="";
		String price=body.get("price");
		String discount=body.get("discount");
		String categoryId=body.get("categoryId");
		System.out.println(String.format("Title: %s", title));
		System.out.println(String.format("Description: %s", description));
		System.out.println(String.format("longDescription: %s", longDescription));
		System.out.println(String.format("OriginPrice: %s", price));
		System.out.println(String.format("discount: %s", discount));
		System.out.println(String.format("categoryId: %s", categoryId));
		if(discount==null||!discount.matches("^[0-9]+$"))discount="0";
		if(categoryId==null||!categoryId.matches("^[0-9]+$"))return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Request 'categoryId'.", "Thiếu 'categoryId'"));
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null) {				
				
				fullcourse.setDescription(description);
				fullcourse.setOriginPrice(new BigDecimal(price));
				fullcourse.setDiscount(Integer.parseInt(discount));
				fullcourse.setTitle(title);
				fullcourse.setUpdateAt(new Date());
				fullcourse.setCategoryId(Integer.parseInt(categoryId));
				fullcourse.setLongDescription(longDescription);
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
	
	@PostMapping(value="/{fullcourse}/block")
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> blockCourse(HttpServletRequest httpServletRequest, 
			Authentication authentication,	
			@PathVariable FullCourse fullcourse
			) {
		System.out.println("---------------------------------");
		
		
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null) {				
				
				fullcourse.setActived(false);
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
	
	@PostMapping(value="/{fullcourse}/unblock")
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> unblockCourse(HttpServletRequest httpServletRequest, 
			Authentication authentication,	
			@PathVariable FullCourse fullcourse
			) {
		System.out.println("---------------------------------");
		
		
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null) {				
				
				fullcourse.setActived(true);
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
	
	@PostMapping(value="/{fullcourse}/learnings")
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> postLearning(HttpServletRequest httpServletRequest, 
			Authentication authentication,	
			@PathVariable FullCourse fullcourse,
			@RequestBody List<Learning> learnings 
			) {
		System.out.println("---------------------------------");
		System.out.println(String.format("Size: %s", learnings.size()));
		
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null) {				
				
				
				try {
//					FullCourse rs = courseDAO.merge(fullcourse);
//					rs.setBeforeResource(WebUtils.getUrl(httpServletRequest));
					courseDAO.updateLearnings(learnings, fullcourse);
					for (int i = learnings.size()-1; i >=0; i--) {
						if(learnings.get(i).getDeleted()) {
							learnings.remove(i);
						}
					}
					//fullcourse.setLearnings(learnings);
					return ResponseEntity.ok(fullcourse);
				} catch (Exception e) {
					e.printStackTrace();
					return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
				}
			}
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
	}
	
	
	@PostMapping(value="/new", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> postNewCourseBase(HttpServletRequest httpServletRequest, 
			@RequestPart(required=true) String title,
			@RequestPart(required=false) String description,
			@RequestPart(required=false) String longDescription,
			@RequestPart(required=true) String price,
			@RequestPart(required=true) String categoryId,
			@RequestPart(required=false) String discount,
			@RequestPart(required=true) MultipartFile imageThumbnail,
			Authentication authentication
			) {
		System.out.println("---------------------------------");
	
		System.out.println(String.format("Title: %s", title));
		System.out.println(String.format("Description: %s", description));
		System.out.println(String.format("longDescription: %s", longDescription));
		System.out.println(String.format("OriginPrice: %s", price));
		System.out.println(String.format("categoryId: %s", categoryId));
		System.out.println(String.format("discount: %s", discount));
		if(discount==null||!discount.matches("^[0-9]+$"))discount="0";
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null) {	
				ResourceImage newAvatar=null;
				try {
					newAvatar = resourceImageDAO.uploadImage(imageThumbnail, appUser, true);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
				
				FullCourse fullcourse= new FullCourse();
				if(newAvatar!=null)fullcourse.setImagePosterId(newAvatar.getId());
				//=resourceImageDAO.findById(Long.valueOf(2));
				fullcourse.setUserPosterId(appUser.getId());
				fullcourse.setUserPoster(appUser);
				//fullcourse.setImagePosterId(Long.valueOf(2));
				fullcourse.setCategoryId(Integer.valueOf(categoryId));
				fullcourse.setDescription(description);
				fullcourse.setLongDescription(longDescription);
				fullcourse.setOriginPrice(new BigDecimal(price));
				fullcourse.setDiscount(Integer.parseInt(discount));
				fullcourse.setTitle(title);
				fullcourse.setUpdateAt(new Date());
				try {
					FullCourse rs = courseDAO.persistCourse(fullcourse);
					rs.setImagePoster(newAvatar);
					
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
