package vn.edu.topedu.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
import vn.edu.topedu.response.AuthResponse;
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
	public ResponseEntity<AuthResponse> login(@RequestBody AuthRequest ar) {
		AppUser user = appUserDAO.findUserAccount(ar.getUsername());
		if (passwordEncoder.encode(ar.getPassword()).equals(user.getEncrytedPassword())) {
			AuthResponse authResponse = new AuthResponse(jwtUtil.generateToken(user));
			AccountResponse account = new AccountResponse();
			account.setAvatar(VariableConst.SRC_IMAGE_BEFORE + FileProcess.encodeFileToBase64(user.getAvater()));
			account.setUsername(user.getUserName());
			authResponse.setAccount(account);
			return ResponseEntity.ok(authResponse);
		} else {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
		}

	}

}
