package vn.edu.topedu.rest;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.WebSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import json.object.ResponseMessageSuccess;
import json.object.ResponseNull;

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

}
