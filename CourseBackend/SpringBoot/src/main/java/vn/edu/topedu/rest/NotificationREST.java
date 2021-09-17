package vn.edu.topedu.rest;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import vn.edu.topedu.dao.AppUserDAO;
import vn.edu.topedu.dao.NotificationDAO;
import vn.edu.topedu.email.EmailService;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.NotificationEntity;
import vn.edu.topedu.entity.course.BaseCourse;
import vn.edu.topedu.response.MessageResponse;
import vn.edu.topedu.response.PageResponse;
import vn.edu.topedu.response.PageResponse.Pagination;
import vn.edu.topedu.utils.WebUtils;
@RestController
@RequestMapping("/notification")
public class NotificationREST {
	@Autowired
	private AppUserDAO appUserDAO;
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private NotificationDAO notificationDAO;
	
	
	@GetMapping(value="list")
	@ResponseBody
	@PreAuthorize("hasRole('USER')")
	public ResponseEntity<Object> list(
			HttpServletRequest httpServletRequest, 
			Authentication authentication	,
			@RequestParam(defaultValue = "1") int _page,
			@RequestParam(defaultValue = "10") int _limit,
			@RequestParam(defaultValue = "updateAt:desc") String _sort, 
			@RequestParam(defaultValue = "") String _search
			) {
		System.out.println("---------------------------------");
		
		
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null) {		
				
				try {
					List<NotificationEntity> rs = notificationDAO.getData(appUser.getId(),_page,_limit,_sort,_search);					
					Long count = notificationDAO.countData(appUser.getId(),_search);					
					for(NotificationEntity e: rs) {						
						//e.getUserPoster().getAvatar().setBeforeResource(WebUtils.getUrl(httpServletRequest));
						e.setBeforeResource(WebUtils.getUrl(httpServletRequest));
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
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
	}
	
	@GetMapping(value="/admin/list")
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> adminList(
			HttpServletRequest httpServletRequest, 
			Authentication authentication	,
			@RequestParam(defaultValue = "1") int _page,
			@RequestParam(defaultValue = "10") int _limit,
			@RequestParam(defaultValue = "updateAt:desc") String _sort, 
			@RequestParam(defaultValue = "") String _search
			) {
		System.out.println("---------------------------------");
		
		
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null) {		
				
				try {
					List<NotificationEntity> rs = notificationDAO.getData(_page,_limit,_sort,_search);					
					Long count = notificationDAO.countData(_search);					
					for(NotificationEntity e: rs) {						
						//e.getUserPoster().getAvatar().setBeforeResource(WebUtils.getUrl(httpServletRequest));
						e.setBeforeResource(WebUtils.getUrl(httpServletRequest));
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
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
	}
	
	@PostMapping(value="/new")
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> postNotif(
			HttpServletRequest httpServletRequest, 
			Authentication authentication	,
			@RequestBody Map<String,String> body
			
			) {
		System.out.println("---------------------------------");
		
		
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null ) {		
				String content=body.get("content");
				if(content==null)
					return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Request field 'content'.", "Thiếu trường 'content'"));
				String subject=body.get("subject");
				if(subject==null)
					return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Request field 'subject'.", "Thiếu trường 'subject'"));
				
				
				NotificationEntity no= new NotificationEntity();
				no.setContent(content);
				no.setName(subject);
				no.setUserSentId(appUser.getId());
				no=notificationDAO.insertEntity(no);
				if(no!=null) {
					no.setAppUserSent(appUser);
					
					//send mail
					String[] to = (String[]) appUserDAO.getAllEmailActive().toArray();
					
					String subjectEmail= "TopEdu: Notification";					 
					String text=  subject+System.getProperty("line.separator")+ content;
					 //System.out.println(text);
					boolean isBackground= true;	
					try {
						 emailService.sendSimpleMessageMultiRecipients(to, subjectEmail, text, isBackground);
						 //return ResponseEntity.ok(new MessageResponse("Send Mail Success.","Gửi mail thành công."));
						 
					 } catch (Exception e) {
						 e.printStackTrace();
						 //return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(new MessageResponse("Not send mail",""));
					 }
					
					
					return ResponseEntity.status(HttpStatus.OK).body(no);
				}
				
			}
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
	}
	
	@PostMapping(value="/one/new")
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> postNotifOne(
			HttpServletRequest httpServletRequest, 
			Authentication authentication	,
			@RequestBody Map<String,String> body
			
			) {
		System.out.println("---------------------------------");
		
		
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null ) {		
				String content=body.get("content");
				if(content==null)
					return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Request field 'content'.", "Thiếu trường 'content'"));
				String idUser=body.get("userId");
				if(idUser==null)
					return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Request field 'idUser'.", "Thiếu trường 'idUser'"));
				
				AppUser user = appUserDAO.findById(Long.valueOf(idUser));
				if(user==null) {
					return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("User not found.", "KHông tìn thấy người dùng"));
				}
				String subject=body.get("subject");
				if(subject==null)
					return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Request field 'subject'.", "Thiếu trường 'subject'"));
				
				NotificationEntity no= new NotificationEntity();
				no.setContent(content);
				no.setName(subject);
				
				no.setUserSentId(appUser.getId());
				no.setUserId(Long.valueOf(idUser));
				no=notificationDAO.insertEntity(no);
				if(no!=null) {
					no.setAppUserSent(appUser);
					
					
					String to= user.getEmail();
					String subjectEmail= "TopEdu: Notification";					 
					String text=  subject+System.getProperty("line.separator")+ content;
					 //System.out.println(text);
					boolean isBackground= true;	
					try {
						 emailService.sendSimpleMessage(to, subjectEmail, text, isBackground);
						 //return ResponseEntity.ok(new MessageResponse("Send Mail Success.","Gửi mail thành công."));
						 
					 } catch (Exception e) {
						 e.printStackTrace();
						 //return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(new MessageResponse("Not send mail",""));
					 }
					 
					
					
					
					
					
					return ResponseEntity.status(HttpStatus.OK).body(no);
				}
				
			}
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
	}
	
	@DeleteMapping(value="/delete/{notification}")
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> deleteNotification(
			HttpServletRequest httpServletRequest, 
			Authentication authentication	,
			@PathVariable NotificationEntity notification
			
			) {
		System.out.println("---------------------------------");
		
		
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null ) {		
				
				notification.setDeleted(true);
				notification.setUpdateAt(new Date());
				notification=notificationDAO.mergePart(notification);
				if(notification!=null) {
					
					return ResponseEntity.status(HttpStatus.OK).body(notification);
				}
				
			}
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
	}
	
	@PutMapping(value="update/{notification}")
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> updateNotification(
			HttpServletRequest httpServletRequest, 
			Authentication authentication	,
			@PathVariable NotificationEntity notification,
			@RequestBody Map<String,String> body
			
			) {
		System.out.println("---------------------------------");
		
		
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null ) {		
				String content=body.get("content");
				if(content==null)
					return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Request field 'content'.", "Thiếu trường 'content'"));
				
				
				String subject=body.get("subject");
				if(subject==null)
					return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Request field 'subject'.", "Thiếu trường 'subject'"));
				
				
				notification.setContent(content);
				notification.setName(subject);			
				
				
				notification=notificationDAO.mergePart(notification);
				if(notification!=null) {
					notification.setAppUserSent(appUser);
					return ResponseEntity.status(HttpStatus.OK).body(notification);
				}
				
			}
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));
	}
	
}
