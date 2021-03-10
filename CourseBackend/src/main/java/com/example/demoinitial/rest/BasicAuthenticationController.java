package com.example.demoinitial.rest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import model.AuthenticationBean;

@RestController
public class BasicAuthenticationController {

    @GetMapping(path = "/basicauth")
    public AuthenticationBean helloWorldBean() {
        //throw new RuntimeException("Some Error has Happened! Contact Support at ***-***");
        return new AuthenticationBean("You are authenticated");
    }   
}
