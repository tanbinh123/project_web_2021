package vn.edu.topedu.rest;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import vn.edu.topedu.dao.AppUserDAO;
import vn.edu.topedu.dao.CourseDAO;
import vn.edu.topedu.dao.OwerCourseDAO;
import vn.edu.topedu.dao.PaymentDAO;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.OwerCourse;
import vn.edu.topedu.entity.Payment;
import vn.edu.topedu.entity.TransactionState;
import vn.edu.topedu.entity.course.Course;
import vn.edu.topedu.entity.previewcourse.FullCourse;
import vn.edu.topedu.entity.previewcourse.PreviewCourseEntity;
import vn.edu.topedu.response.MessageResponse;
import vn.edu.topedu.utils.WebUtils;

@RestController
@RequestMapping("/payment")
public class PaymentREST {
	@Autowired
	private PaymentDAO paymentDAO;
	@Autowired
	private AppUserDAO appUserDAO;
	@Autowired
	private OwerCourseDAO owerCourseDAO;
	@Autowired
	private CourseDAO courseDAO;

	@PostMapping
	@ResponseBody
	public ResponseEntity<Object> buyCourse(HttpServletRequest httpServletRequest, Authentication authentication,
			@RequestBody Map<String, Object> body) {
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null) {
				OwerCourse owerCourse=null;
				Long idCourse=Long.parseLong(String.valueOf(body.get("idCourse")));
				try {
					owerCourse = owerCourseDAO.querryBought(appUser.getId(),idCourse );
					return ResponseEntity.ok(owerCourse);
					
				} catch (NoResultException noResultException) {
					owerCourse= new OwerCourse();
					System.err.println("Not found owerCourse");
				} 
				Course course= courseDAO.getCourse(idCourse);
				Payment payment = new Payment();
				payment.setAppUser(appUser);
				payment.setAmount(course.getPrice()*100);
				payment.setCurrCode("VND");
				payment.setIpAddress(WebUtils.getIpAddress(httpServletRequest));
				payment.setUrReturn(String.valueOf(body.get("returnUrl")));
				payment = paymentDAO.insert(payment);
				if (payment == null)
					return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
							.body(new MessageResponse("Can't create payment.", ""));
				;
				owerCourse.setAppUser(appUser);
				owerCourse.setCourse(course);
				owerCourse.setPayment(payment);
				owerCourse=owerCourseDAO.insertOwerCourse(owerCourse);
				String url;
				try {
					url = payment.getUrl(WebUtils.getUrl(httpServletRequest)+"payment/buycourse/check");
					payment=paymentDAO.merge(payment);
					PaymnetResponse paymnetResponse = new PaymnetResponse(url,payment.getId());
					return ResponseEntity.ok(paymnetResponse);
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
					return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
							.body(new MessageResponse("Can't gender url.", ""));
				}
				
			}
		}
		
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", ""));
	}
	@GetMapping("/buycourse/check/{id}")
	public void redirectAfterTransectionBuyCourse(HttpServletResponse httpResponse,HttpServletRequest httpServletRequest,
			@PathVariable String id) {
		long idPayment = Long.parseLong(id);
		Payment payment = null;
		payment=paymentDAO.findById(idPayment);
		if (payment == null) {
			return;
		}
		OwerCourse owerCourse = null;
		try {
			owerCourse=owerCourseDAO.querryByPayment(idPayment);
			
		} catch (NoResultException e) {
			return;
		}
		
		try {
			String url;
			url = payment.querryFromVNPay();
			payment=paymentDAO.merge(payment);
			//System.out.println(payment.getUrReturn()+"?"+payment.getParamsUrlStatus());
			if(payment.getTransactionStatus()==TransactionState.COMPLETE) {
				owerCourse.setSuccessed(true);
				owerCourseDAO.merge(owerCourse);
			}
			httpResponse.sendRedirect(payment.getUrReturn()+"?"+payment.getParamsUrlStatus());
			return ;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			httpResponse.sendRedirect(payment.getUrReturn());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@PostMapping("/access")
	@ResponseBody
	public ResponseEntity<Object> checkBought(HttpServletRequest httpServletRequest, Authentication authentication,
			@RequestBody Map<String, Object> body) {
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null) {
				OwerCourse owerCourse=null;
				Long idCourse=Long.parseLong(String.valueOf(body.get("idCourse")));
				try {
					owerCourse = owerCourseDAO.querryBought(appUser.getId(),idCourse );
					if(owerCourse!=null) {
						//owerCourseDAO.detach(owerCourse);
						FullCourse course = courseDAO.getFullCourse(idCourse);
						course.setBeforeResource(WebUtils.getUrl(httpServletRequest));
						return ResponseEntity.ok(course);
					}
					
					return ResponseEntity.ok(owerCourse);
					
				} catch (NoResultException noResultException) {
					System.err.println("Not found owerCourse");
				} 
				
				
			}
		}
		
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new Object() {
			String message="Bạn chưa mua khóa học này";
			public String getMessage() {
				return message;
			}

			public void setMessage(String message) {
				this.message = message;
			}
			
		});
	}

	public static class PaymnetResponse {
		private String url;
		private long paymentId;

		public PaymnetResponse(String url, long id) {
			super();
			this.url = url;
			this.paymentId=id;
		}

		public String getUrl() {
			return url;
		}

		public void setUrl(String url) {
			this.url = url;
		}

		public long getPaymentId() {
			return paymentId;
		}

		public void setPaymentId(long paymentId) {
			this.paymentId = paymentId;
		}
		

	}

}
