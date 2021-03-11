package com.example.demoinitial.jwt.rest;


import com.example.demoinitial.dao.AppUserDAO;
import com.example.demoinitial.entity.AppUser;
import com.example.demoinitial.jwt.security.JWTUtil;
import com.example.demoinitial.jwt.security.PBKDF2Encoder;
import com.example.demoinitial.jwt.security.model.AuthRequest;
import com.example.demoinitial.jwt.security.model.AuthResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;

@RestController
public class AuthenticationREST {

	@Autowired
	private JWTUtil jwtUtil;

	@Autowired
	private PBKDF2Encoder passwordEncoder;

	

	@Autowired
	private AppUserDAO appUserDAO;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ResponseEntity<AuthResponse> login(@RequestBody AuthRequest ar) {
		AppUser user = appUserDAO.findUserAccount(ar.getUsername());
		System.out.println(user.getEncrytedPassword());
		System.out.println(passwordEncoder.encode(ar.getPassword()));
		if (passwordEncoder.encode(ar.getPassword()).equals(user.getEncrytedPassword())) {
			return ResponseEntity.ok(new AuthResponse(jwtUtil.generateToken(user)));
		} else {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
		}

	}

}
