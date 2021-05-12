package vn.edu.topedu.rest.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import vn.edu.topedu.dao.TestDAO;

@RestController
public class TestMySQLREST {
	@Autowired
	TestDAO testDAO;
	@RequestMapping(value = "/test/mysql", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<Object> testMysql() {
		
		return ResponseEntity.ok(testDAO.findById((long) 1));
	}



	

	
}
