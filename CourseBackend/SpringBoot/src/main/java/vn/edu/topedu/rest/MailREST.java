package vn.edu.topedu.rest;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import vn.edu.topedu.email.EmailService;
import vn.edu.topedu.response.MessageResponse;
@RestController
public class MailREST {
	@Autowired
	private EmailService emailService;
	@PostMapping("/mail/simplemail")
	@ResponseBody
	public ResponseEntity<Object> sendSimpleMail(
			@RequestBody Map<String,Object> body) {
		String to= body.get("to").toString();
		String subject= body.get("subject").toString();
		String text= body.get("text").toString();
		boolean isBackground= (boolean) body.get("isBackground");	
		try {
			emailService.sendSimpleMessage(to, subject, text, isBackground);
			return ResponseEntity.ok().build();
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(new MessageResponse("Not send mail", ""));
		}
		
	}

}
