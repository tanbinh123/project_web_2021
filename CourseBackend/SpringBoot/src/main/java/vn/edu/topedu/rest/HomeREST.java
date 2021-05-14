package vn.edu.topedu.rest;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import vn.edu.topedu.dao.CourseDAO;
import vn.edu.topedu.entity.course.Course;
import vn.edu.topedu.response.PageResponse;
import vn.edu.topedu.utils.WebUtils;

@RestController
@RequestMapping("/home")
public class HomeREST {

	

	
}
