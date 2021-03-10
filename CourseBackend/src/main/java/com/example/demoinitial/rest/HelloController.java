package com.example.demoinitial.rest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import model.Greeting;

@RestController
public class HelloController {
	@GetMapping(value="greeting")
	@ResponseBody
	public Greeting hello(){
		return new Greeting(1, "Hoang");
	}
}
