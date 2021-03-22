package vn.edu.topedu.rest.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import vn.edu.topedu.email.EmailService;

@RestController
public class TestMailREST {

	@Autowired
	EmailService emailService;

	@GetMapping("/test/sendmail/simplemail")
	@ResponseBody
	public ResponseEntity<Object> sendSimpleMail() {
		String to = "tanhoang99.999@gmail.com";
		String subject = "subject";
		String text = "<p style=\"color:red;\">Hello</p>";
		try {
			emailService.sendSimpleMessage(to, subject, text, false);// Test simple mail
			return ResponseEntity.ok().build();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
		}

	}

	@GetMapping("/test/sendmail/thymleaf")
	@ResponseBody
	public ResponseEntity<Object> sendThymleafMail() {
		String to = "tanhoang99.999@gmail.com";
		String subject = "subject";

		try {

			emailService.sendMessageWithAttachment(to, subject, null, false);// Test thymleaf mail
			return ResponseEntity.ok().build();
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
		}

	}


	@GetMapping("/test/sendmail/htmlmail")
	@ResponseBody
	public ResponseEntity<Object> testSendMail() {
		String to = "tanhoang99.999@gmail.com";
		String subject = "subject";
		String text = "<p style=\"color:red;\">Hello</p>";
		try {
			emailService.sendMessageWithAttachment(to, subject,text,null,true, false);//Test mail html
			return ResponseEntity.ok().build();
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
		}

	}

}
