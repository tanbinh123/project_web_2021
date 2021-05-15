package vn.edu.topedu.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminControlller {
	@RequestMapping(value = "/admin/index", method = RequestMethod.GET)
	public ModelAndView testMVC(Map<String, Object> model)  {
		model.put("message", "HowToDoInJava Reader !!");
		ModelAndView modelAndView= new ModelAndView("index",model);
		return modelAndView;
	}
	@RequestMapping(value = "/admin/html", method = RequestMethod.GET)
	public ModelAndView testHTML()  {
		ModelAndView modelAndView= new ModelAndView("th_views/index.html");
		return modelAndView;
	}
	@RequestMapping(value = "/admin/html2", method = RequestMethod.GET)
	public ModelAndView testHTML2()  {
		ModelAndView modelAndView= new ModelAndView("th_index.html");
		return modelAndView;
	}
	
	

	
	@RequestMapping("/admin/next")
	public String next(Map<String, Object> model) {
		model.put("message", "You are in new page !!");
		return "next";
	}

	

	
}
