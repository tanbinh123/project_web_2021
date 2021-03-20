package vn.edu.topedu.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.WebSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import json.object.ResponseMessageSuccess;
import json.object.ResponseNull;
import vn.edu.topedu.email.EmailService;

@RestController
public class TestREST {

	@RequestMapping(value = "/test/null", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String isNull() {

		return new ResponseNull().toJsonString();
	}
	@RequestMapping(value = "/test", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String test() {

		return new ResponseMessageSuccess().toJsonString();
	}
	@RequestMapping(value = "/test/ok/ok", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String ok() {

		return new ResponseMessageSuccess().toJsonString();
	}

	@RequestMapping(value = "/test/session", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String testSession(WebSession session) {
		if (session != null)
			return new ResponseMessageSuccess().toJsonString();
		return new ResponseNull().toJsonString();
	}

	@RequestMapping(value = "/test/mapper", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String testMapper(WebSession session) throws JsonProcessingException {
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonString = objectMapper.writeValueAsString(new ResponseMessageSuccess());
		return jsonString;
	}
	//@RequestMapping(value = "/test/simplemail", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	@GetMapping("/test/simplemail")
	@ResponseBody
	public ResponseEntity<Object> testSendMail() {
		String to="tanhoang99.999@gmail.com";
		String subject="subject";
		String text="<p style=\"color:red;\">Hello</p>";
		try {
			//emailService.sendSimpleMessage(to, subject,text, false);//Test simple mail not html
			emailService.sendMessageWithAttachment(to, subject,null, false);//Test thymleaf mail
//			emailService.sendMessageWithAttachment(to, subject,text,null,true, false);//Test mail html
			return ResponseEntity.ok().build();
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
		}
		
	}
	@Autowired
	EmailService emailService;

}
