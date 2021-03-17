package vn.edu.topedu.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.ResponseEntity.BodyBuilder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import fileprocess.FileProcess;
import vn.edu.topedu.consts.VariableConst;
import vn.edu.topedu.dao.AppUserDAO;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.jwt.security.JWTUtil;
import vn.edu.topedu.jwt.security.PBKDF2Encoder;
import vn.edu.topedu.request.AuthRequest;
import vn.edu.topedu.request.SignUpRequest;
import vn.edu.topedu.response.AuthResponse;
import vn.edu.topedu.response.SignUpResponse;
import vn.edu.topedu.response.model.AccountResponse;

@RestController
public class AuthenticationREST {

	@Autowired
	private JWTUtil jwtUtil;

	@Autowired
	private PBKDF2Encoder passwordEncoder;

	@Autowired
	private AppUserDAO appUserDAO;
	

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ResponseEntity<Object> login(@RequestBody AuthRequest ar) {
		AppUser user = appUserDAO.findUserAccount(ar.getUsername());
		if (passwordEncoder.encode(ar.getPassword()).equals(user.getEncrytedPassword())) {
			AuthResponse authResponse = new AuthResponse(jwtUtil.generateToken(user));
			AccountResponse account = new AccountResponse();
			account.setAvatar(VariableConst.SRC_IMAGE_BEFORE + FileProcess.encodeFileToBase64(user.getAvater()));
			account.setUsername(user.getUserName());
			authResponse.setUser(account);
			return ResponseEntity.ok(authResponse);
		} else {
			BodyBuilder rs = ResponseEntity.status(HttpStatus.UNAUTHORIZED);
			// rs.
			return rs.build();
		}

	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public ResponseEntity<Object> signup(@RequestBody SignUpRequest signUpRequest) {
		System.out.println(signUpRequest);
//		Test test = new Test();
//		test.setName(true);
//		testDAo.insertTest(test);
//		 return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
		AppUser person = new AppUser();
		person.setEmail(signUpRequest.getEmail());
		person.setUserName(signUpRequest.getUsername());
		person.setEncrytedPassword(passwordEncoder.encode(signUpRequest.getPassword()));
		boolean rs = false;
		try {
			rs = appUserDAO.insertUser(person);
		} catch (Exception e) {
			rs = false;
		}
		if (rs) {
			SignUpResponse authResponse = new SignUpResponse(jwtUtil.generateToken(person));
			AccountResponse account = new AccountResponse();
			account.setAvatar(VariableConst.SRC_IMAGE_BEFORE + FileProcess.encodeFileToBase64(person.getAvater()));
			account.setUsername(person.getUserName());
			authResponse.setUser(account);
			return ResponseEntity.ok(authResponse);
		}
		BodyBuilder rs2 = ResponseEntity.status(HttpStatus.BAD_REQUEST);
		rs2.body("Email or username is unvalid.");
		
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Email or username is unvalid.");
		
//		return new ResponseEntity("Eror", HttpStatus.BAD_REQUEST);

	}

}
