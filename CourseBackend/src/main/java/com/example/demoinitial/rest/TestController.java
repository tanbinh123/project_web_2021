package com.example.demoinitial.rest;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.WebSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import json.object.JsonResponse;
import json.object.ResponseNull;
import model.Greeting;

@RestController
public class TestController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	@ResponseBody
	public Greeting greeting() {
		Greeting g = new Greeting(1, "Hoang");
		return g;
	}

	@RequestMapping(value = "/test", method = {RequestMethod.GET,RequestMethod.POST}, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String hello() {
		Greeting g = new Greeting(1, "Hoang");
		return g.toJsonString();
	}

	@RequestMapping(value = "/test/null", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String isNull() {

		return new ResponseNull().toJsonString();
	}

	@RequestMapping(value = "/test/session", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String testSession(WebSession session) {
		if (session != null)
			return new Greeting(1, "hoang").toJsonString();
		return new ResponseNull().toJsonString();
	}

	@RequestMapping(value = "/test/mapper", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String testMapper(WebSession session) throws JsonProcessingException {
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonString = objectMapper.writeValueAsString(new ResponseNull());
		return jsonString;
	}

}
