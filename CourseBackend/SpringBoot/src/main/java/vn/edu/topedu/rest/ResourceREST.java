package vn.edu.topedu.rest;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import vn.edu.topedu.response.model.MessageResponse;

@RestController
public class ResourceREST {
	
	@RequestMapping(value = "/resource/user", method = RequestMethod.GET)
	@PreAuthorize("hasRole('USER')")
	public ResponseEntity<?> user() {
		return ResponseEntity.ok(new MessageResponse("Content for user"));
	}
	
	@RequestMapping(value = "/resource/admin", method = RequestMethod.GET)
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<?> admin() {
		return ResponseEntity.ok(new MessageResponse("Content for admin"));
	}
	
	@RequestMapping(value = "/resource/user-or-admin", method = RequestMethod.GET)
	@PreAuthorize("hasRole('USER') or hasRole('ADMIN')")
	public ResponseEntity<?> userOrAdmin() {
		return ResponseEntity.ok(new MessageResponse("Content for user or admin"));
	}
}
