package vn.edu.topedu;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class Main {

	public static void main(String[] args) {
		SpringApplication.run(Main.class, args);
	}

	@RequestMapping(value = "/")
	@ResponseBody
	public ResponseEntity<Object> hello() {
		System.out.println("Hello");
		return ResponseEntity.ok("Hello World from Spring Boot Started Web");
	}

}