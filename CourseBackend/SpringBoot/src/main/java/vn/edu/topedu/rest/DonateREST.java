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
import vn.edu.topedu.entity.course.Course;
import vn.edu.topedu.entity.previewcourse.PreviewCourseEntity;
import vn.edu.topedu.response.MessageResponse;
import vn.edu.topedu.utils.WebUtils;

@RestController
@RequestMapping("/payment")
public class DonateREST {
	@Autowired
	private PaymentDAO paymentDAO;
	@Autowired
	private AppUserDAO appUserDAO;
	@Autowired
	private OwerCourseDAO owerCourseDAO;
	@Autowired
	private CourseDAO courseDAO;

	@PostMapping("/donate")
	@ResponseBody
	public ResponseEntity<Object> donate(HttpServletRequest httpServletRequest, Authentication authentication,
			@RequestBody Map<String, Object> body) {
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null) {
				Payment payment = new Payment();
				payment.setAppUser(appUser);
				payment.setAmount(Long.parseLong(String.valueOf(body.get("amount")+"00")));
				payment.setCurrCode("VND");
				payment.setIpAddress(WebUtils.getIpAddress(httpServletRequest));
				payment.setUrReturn(String.valueOf(body.get("returnUrl")));
				payment = paymentDAO.insert(payment);
				if (payment == null)
					return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
							.body(new MessageResponse("Can't create payment.", ""));
				;
				String url;
				try {
					url = payment.getUrl(WebUtils.getUrl(httpServletRequest)+"payment/check");
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
	@PostMapping("/donate/manyCurrCode")
	@ResponseBody
	public ResponseEntity<Object> donateManyCurrCode(HttpServletRequest httpServletRequest, Authentication authentication,
			@RequestBody Map<String, Object> body) {
		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null) {
				Payment payment = new Payment();
				payment.setAppUser(appUser);
				payment.setAmount(Long.parseLong(String.valueOf(body.get("amount"))));
				payment.setCurrCode(String.valueOf(body.get("currCode")));
				payment.setIpAddress(WebUtils.getIpAddress(httpServletRequest));
				payment.setUrReturn(String.valueOf(body.get("returnUrl")));
				payment = paymentDAO.insert(payment);
				if (payment == null)
					return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
							.body(new MessageResponse("Can't create payment.", ""));
				;
				String url;
				try {
					url = payment.getUrl(WebUtils.getUrl(httpServletRequest)+"payment/check");
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
	
	@GetMapping("/check/{id}")
	public void redirectAfterTransection(HttpServletResponse httpResponse,HttpServletRequest httpServletRequest,
			@PathVariable String id) {
		Payment payment = paymentDAO.findById(Long.parseLong(id));
		if (payment == null) {
			return;
		}
		
		try {
			String url;
			url = payment.querryFromVNPay();
			payment=paymentDAO.merge(payment);
			System.out.println(payment.getUrReturn()+"?"+payment.getParamsUrlStatus());
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
	@GetMapping("/api/check/{id}")
	public ResponseEntity<Object> apiCheck(HttpServletRequest httpServletRequest,
			@PathVariable String id) {
		Payment payment = paymentDAO.findById(Long.parseLong(id));
		if (payment == null)
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body(new MessageResponse("Can't create payment.", ""));
		;
		
		try {
			String url;
			url = payment.querryFromVNPay();
			payment=paymentDAO.merge(payment);
			return ResponseEntity.ok(payment);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body(new MessageResponse("Can't gender url.", ""));
		}
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
