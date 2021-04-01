package vn.edu.topedu;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.adapter.AbstractReactiveWebInitializer;

@SpringBootApplication
@RestController
public class Main extends AbstractReactiveWebInitializer  {
	

	public static void main(String[] args) {
		SpringApplication.run(Main.class, args);
	}

	@RequestMapping(value = "/")
	@ResponseBody
	public String hello() {
		return "Hello World from Spring Reactive";
	}

	@Override
	protected Class<?>[] getConfigClasses() {
		// TODO Auto-generated method stub
		return null;
	}

}