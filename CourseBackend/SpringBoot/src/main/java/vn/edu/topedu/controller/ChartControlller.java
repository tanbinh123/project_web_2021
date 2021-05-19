package vn.edu.topedu.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChartControlller {
	@RequestMapping(value = "/admin/charts", method = RequestMethod.GET)
	public ModelAndView testMVC(Map<String, Object> model) {
		ModelAndView modelAndView = new ModelAndView("chart", model);
		return modelAndView;
	}

}
