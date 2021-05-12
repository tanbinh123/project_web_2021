package vn.edu.topedu.rest.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.WebSession;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import vn.edu.topedu.dao.OwerCourseDAO;
import vn.edu.topedu.dao.TestDAO;
import vn.edu.topedu.json.object.ResponseMessageSuccess;
import vn.edu.topedu.json.object.ResponseNull;
import vn.edu.topedu.response.MessageResponse;

@RestController
public class TestREST {
	@Autowired
	TestDAO testDAO;
	@Autowired
	OwerCourseDAO owerCourseDAO;
	@RequestMapping(value = "/test/bug", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<Object> testBug() {

//		return ResponseEntity.ok(owerCourseDAO.querry2((long) 2, (long) 171));
		return ResponseEntity.ok(owerCourseDAO.querryByPayment((long) 31));
	}
	@RequestMapping(value = "/test/null", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String isNull() {

		return new ResponseNull().toJsonString();
	}
	@RequestMapping(value = "/test/returnurl", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<Object> testReturnUrl() {
		
		return ResponseEntity.ok(new MessageResponse("Hello", "Xin chào"));
	}

	@RequestMapping(value = "/test", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String test() {

		return new ResponseMessageSuccess().toJsonString();
	}
	@RequestMapping(value = "/test/error", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity tesError() {
		
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(new MessageResponse("Error", "Lỗi"));
//		return ResponseEntity.ok(new MessageResponse("Error", "Lỗi"));
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
	



	

	
}
