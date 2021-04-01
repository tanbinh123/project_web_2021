package vn.edu.topedu.payment.paypal;



import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring5.SpringTemplateEngine;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;

import vn.edu.topedu.response.MessageResponse;

@Controller
public class PaymentController {
	
	public static final String URL_PAYPAL_SUCCESS = "pay/success";
	public static final String URL_PAYPAL_CANCEL = "pay/cancel";
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private PaypalService paypalService;
	
	
	
	@GetMapping("/pay")
	public ResponseEntity<Object> pay(ServerHttpRequest serverHttpRequest,@RequestParam("price") double price ){
		String cancelUrl = Utils.getBaseURL(serverHttpRequest) + "/" + URL_PAYPAL_CANCEL;
		String successUrl = Utils.getBaseURL(serverHttpRequest) + "/" + URL_PAYPAL_SUCCESS;
		try {
			Payment payment = paypalService.createPayment(
					price, 
					"USD", 
					PaypalPaymentMethod.paypal, 
					PaypalPaymentIntent.sale,
					"payment description", 
					cancelUrl, 
					successUrl);
			Map<String, String> mapLinks=new HashMap<>();
			for(Links links : payment.getLinks()){
				if(links.getRel().equals("approval_url")){
//					return "redirect:" + links.getHref();
				}
				mapLinks.put(links.getRel(), links.getHref());
			}
			return ResponseEntity.ok(mapLinks);
		} catch (PayPalRESTException e) {
			log.error(e.getMessage());
		}
//		return "redirect:/";
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.",""));
		
	}
	@Autowired
	private SpringTemplateEngine templateEngine;
	
	@GetMapping(URL_PAYPAL_CANCEL)
	@ResponseBody
	public String cancelPay(){
		Context context = new Context();
		Map<String, Object> props = new HashMap<>();
		context.setVariables(props);
		String html = templateEngine.process("cancel", context);
		
		return html;
	}

	@GetMapping(URL_PAYPAL_SUCCESS)
	@ResponseBody
	public String successPay(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId){
		try {
			Payment payment = paypalService.executePayment(paymentId, payerId);
			if(payment.getState().equals("approved")){
				Context context = new Context();
				Map<String, Object> props = new HashMap<>();
				context.setVariables(props);
				String html = templateEngine.process("success", context);			
				return html;
			}
		} catch (PayPalRESTException e) {
			log.error(e.getMessage());
		}
		Context context = new Context();
		Map<String, Object> props = new HashMap<>();
		context.setVariables(props);
		String html = templateEngine.process("index", context);			
		
		return html;
	}
	
//	@GetMapping(URL_PAYPAL_CANCEL)
//	@ResponseBody
//	public String cancelPay(){
//		
//		return "cancel";
//	}
//	@GetMapping(URL_PAYPAL_SUCCESS)
//	public String successPay(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId){
//		try {
//			Payment payment = paypalService.executePayment(paymentId, payerId);
//			if(payment.getState().equals("approved")){
//				return "success";
//			}
//		} catch (PayPalRESTException e) {
//			log.error(e.getMessage());
//		}
//		return "redirect:/";
//	}
	
}