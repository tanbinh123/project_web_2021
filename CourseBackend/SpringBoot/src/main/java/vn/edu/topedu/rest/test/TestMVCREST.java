package vn.edu.topedu.rest.test;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class TestMVCREST {
	@RequestMapping(value = "/test/mvc", method = RequestMethod.GET)
	public ModelAndView testMVC()  {
		ModelAndView modelAndView= new ModelAndView("views/index.html");
		return modelAndView;
	}


	

	
}
