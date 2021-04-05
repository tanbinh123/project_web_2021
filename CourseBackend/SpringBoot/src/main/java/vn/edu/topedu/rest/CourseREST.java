package vn.edu.topedu.rest;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import fileprocess.FileProcess;
import vn.edu.topedu.dao.CourseDAO;
import vn.edu.topedu.dao.OwerCourseDAO;
import vn.edu.topedu.dao.UserCourseDAO;
import vn.edu.topedu.entity.Course;
import vn.edu.topedu.entity.detailcourse.DetailCourseEntity;
import vn.edu.topedu.response.PageResponse;
import vn.edu.topedu.response.model.CourseResponse;


@RestController
@RequestMapping("/course")
public class CourseREST implements IMyHost {
	
	@Autowired
	private CourseDAO courseDAO;
	@Autowired
	private UserCourseDAO userCourseDAO;
	@Autowired
	private OwerCourseDAO owerCourseDAO;

	@PostMapping()
	public ResponseEntity<Object> createCourse(@RequestBody Course course) {
		if(courseDAO.insertCourse(course)!=0) {
			return ResponseEntity.ok().build();			
		};
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Thất bại tạo khóa học");
	}
	@PutMapping()
	public ResponseEntity<Course> updateCourse(@RequestBody Course course,ServerHttpRequest serverHttpRequest) {
		Course c=courseDAO.updateCourse(course);
		return ResponseEntity.ok(c);
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ResponseEntity<Object> list(HttpServletRequest serverHttpRequest
			, @RequestParam(defaultValue = "-1") int _page 
			, @RequestParam(defaultValue = "-1") int _limit 
			, @RequestParam(defaultValue = "id:asc") String _sort 
			) {
		_page=(_page<=0)?1:_page;
		List<Course> lstCourse = courseDAO.getListCourse(_page, _limit, _sort);
		
		for(Course c:lstCourse) {
			c.setBeforeResource(getUrlResource(serverHttpRequest));
			
		}
		PageResponse pageResponse=new PageResponse(lstCourse, _limit, _page, 170,_sort);
		return ResponseEntity.ok(pageResponse);
	}
	@GetMapping(value = "/{id}")
	public ResponseEntity<Object> getCourse(@PathVariable Integer id,HttpServletRequest serverHttpRequest) {
		DetailCourseEntity course = courseDAO.getCourse(id);
		course.setBeforeResource(getUrlResource(serverHttpRequest));
		return ResponseEntity.ok(course);
	}	
	@DeleteMapping("/{id}")
	public ResponseEntity<Object> deleteCourse(@PathVariable Integer id,ServerHttpRequest serverHttpRequest) {
		if(courseDAO.deleteCourse(id)) {
			
			return ResponseEntity.ok().build();
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Thất bại xóa khóa học");
	}

}
