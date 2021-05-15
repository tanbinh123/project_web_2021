package vn.edu.topedu.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import vn.edu.topedu.dao.CourseDAO;
import vn.edu.topedu.dao.ResourceImageDAO;
import vn.edu.topedu.entity.CategoryEntity;
import vn.edu.topedu.entity.ResourceImage;
import vn.edu.topedu.entity.course.Course;
import vn.edu.topedu.entity.course.full.FullCourse;
import vn.edu.topedu.json.object.JsonResponse;
import vn.edu.topedu.json.object.ResponseMessageSuccess;
import vn.edu.topedu.response.PageResponse;
import vn.edu.topedu.utils.WebUtils;

@Controller
public class AdminControlller {
	@RequestMapping(value = "/admin/index", method = RequestMethod.GET)
	public ModelAndView testMVC(Map<String, Object> model) {
		model.put("message", "HowToDoInJava Reader !!");
		ModelAndView modelAndView = new ModelAndView("index", model);
		return modelAndView;
	}

	@RequestMapping(value = "/admin/html", method = RequestMethod.GET)
	public ModelAndView testHTML() {
		ModelAndView modelAndView = new ModelAndView("th_views/index.html");
		return modelAndView;
	}

	@RequestMapping(value = "/admin/html2", method = RequestMethod.GET)
	public ModelAndView testHTML2() {
		ModelAndView modelAndView = new ModelAndView("th_index.html");
		return modelAndView;
	}

	@RequestMapping("/admin/next")
	public String next(Map<String, Object> model) {
		model.put("message", "You are in new page !!");
		return "next";
	}

	@Autowired
	CourseDAO courseDAO;
	@Autowired
	ResourceImageDAO resourceImageDAO;
	

	@GetMapping("/admin/course/{idCourse}")
	public String adminCourse(HttpServletRequest serverHttpRequest,Map<String, Object> model, @PathVariable long idCourse) {
		FullCourse c = courseDAO.getFullCourse(idCourse);
		List<CategoryEntity> categories = courseDAO.getCategories(-1);
		List<ResourceImage> images = resourceImageDAO.getResourceImages(Long.valueOf("2"));
		String bef=WebUtils.getUrl(serverHttpRequest);
		c.setBeforeResource(bef);
		images.forEach(e->{
			e.setBeforeResource(bef);
		});
		model.put("fullcourse", c);
		model.put("categories", categories);
		model.put("images", images);
		//System.out.println(images.size());
		return "course";
	}

	
	
	@GetMapping(value = "/admin/courses")
	public String list(HttpServletRequest serverHttpRequest
			, @RequestParam(defaultValue = "-1") int _page 
			, @RequestParam(defaultValue = "10") int _limit 
			, @RequestParam(defaultValue = "id:asc") String _sort 
			, @RequestParam(defaultValue = "") String _search 
			, @RequestParam(defaultValue = "-1") int category 
			,Map<String, Object> model
			) {
		String _filter = "";
		if(category!=-1)
			_filter+=String.format("category=%d&", category);
		if(_search.length()!=0)
			_filter+=String.format("_search=%s&", _search);
		if(_filter.length()>0&&_filter.charAt(_filter.length()-1)=='&') {
			_filter=_filter.substring(0, _filter.length()-1);
		}
		
		_page=(_page<=0)?1:_page;
		List<Course> lstCourse = courseDAO.getListCourse(_page, _limit, _sort, category, _search);
		long countRows=courseDAO.getCount(category, _search);
		for(Course c:lstCourse) {
			c.setBeforeResource(WebUtils.getUrl(serverHttpRequest));
			
		}
		PageResponse pageResponse=new PageResponse(lstCourse, _limit, _page, countRows,_sort, _filter);
		model.put("pageResponse", pageResponse);
		return "courses";
	}

}
