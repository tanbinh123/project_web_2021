package vn.edu.topedu.rest;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

import vn.edu.topedu.dao.ActiveAccountDAO;
import vn.edu.topedu.dao.AppUserDAO;
import vn.edu.topedu.dao.PaymentDAO;
import vn.edu.topedu.dao.RequestResetPasswordDAO;
import vn.edu.topedu.email.EmailService;
import vn.edu.topedu.entity.ActiveAccount;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.Payment;
import vn.edu.topedu.entity.RequestResetPassword;
import vn.edu.topedu.jwt.security.PBKDF2Encoder;
import vn.edu.topedu.response.MessageResponse;
import vn.edu.topedu.utils.WebUtils;

@RestController
@RequestMapping("/payment")
public class PaymentREST {
	@Autowired
	private PaymentDAO paymentDAO;
	@Autowired
	private AppUserDAO appUserDAO;

	@PostMapping()
	@ResponseBody
	public ResponseEntity<Object> sendMailByEmail(HttpServletRequest httpServletRequest, Authentication authentication,
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
//				payment.setIpAddress("119.17.249.22");
				payment = paymentDAO.insert(payment);
				if (payment == null)
					return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
							.body(new MessageResponse("Can't create payment.", ""));
				;
				String url;
				try {
					url = payment.getUrl(String.valueOf(body.get("returnUrl")));
					payment=paymentDAO.merge(payment);
					PaymnetResponse paymnetResponse = new PaymnetResponse(url,payment.getId());
					return ResponseEntity.ok(paymnetResponse);
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
							.body(new MessageResponse("Can't gender url.", ""));
				}

			}
		}

		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", ""));
	}
	@GetMapping("/check/{id}")
	@ResponseBody
	public ResponseEntity<Object> api(HttpServletRequest httpServletRequest,
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
//	@PostMapping("/confirm")
//	@ResponseBody
//	public ResponseEntity<Object> check(
//			Authentication authentication,
//			@RequestBody ActiveConfirmRequest requestBody) {
//		 if (authentication != null) {
//			 System.out.println("Code: "+requestBody.code);
//			 ActiveAccount rrp = activeAccountDAO.getNewCode(authentication.getName());
//			if(rrp==null)return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Code not corect.",""));
//			String trueCode=rrp.getCode();
//			if(requestBody.code.equals(trueCode)) {
//				//System.out.println(rrp.getTime());
//				return ResponseEntity.ok(new MessageResponse("Code valid.","Xác minh thành công."));
//			
//			}
//			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Code not corect.",""));		
//					
//		 }
//	        
//		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.",""));		
//	}

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
