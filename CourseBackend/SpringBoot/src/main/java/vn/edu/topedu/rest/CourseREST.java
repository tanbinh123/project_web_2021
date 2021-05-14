package vn.edu.topedu.rest;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import vn.edu.topedu.consts.VariableConst;
import vn.edu.topedu.dao.CourseDAO;
import vn.edu.topedu.dao.OwerCourseDAO;
import vn.edu.topedu.dao.UserCourseDAO;
import vn.edu.topedu.entity.CategoryEntity;
import vn.edu.topedu.entity.Course;
import vn.edu.topedu.entity.detailcourse.DetailCourseEntity;
import vn.edu.topedu.fileprocess.FileProcess;
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
	public ResponseEntity<Course> updateCourse(@RequestBody Course course,HttpServletRequest httpServletRequest) {
		Course c=courseDAO.updateCourse(course);
		return ResponseEntity.ok(c);
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ResponseEntity<Object> list(HttpServletRequest serverHttpRequest
			, @RequestParam(defaultValue = "-1") int _page 
			, @RequestParam(defaultValue = "-1") int _limit 
			, @RequestParam(defaultValue = "id:asc") String _sort 
			, @RequestParam(defaultValue = "-1") int category 
			) {
		String _filter = "";
		if(category!=-1)
			_filter+=String.format("category=%d&", category);
		if(_filter.length()>0&&_filter.charAt(_filter.length()-1)=='&') {
			_filter=_filter.substring(0, _filter.length()-1);
		}
		
		_page=(_page<=0)?1:_page;
		List<Course> lstCourse = courseDAO.getListCourse(_page, _limit, _sort, category);
		long countRows=courseDAO.getCount(category);
		//System.out.println(countRows);
		for(Course c:lstCourse) {
			c.setBeforeResource(getUrl(serverHttpRequest));
			
		}
		PageResponse pageResponse=new PageResponse(lstCourse, _limit, _page, countRows,_sort, _filter);
		return ResponseEntity.ok(pageResponse);
	}
	@GetMapping(value = "/{id}")
	public ResponseEntity<Object> getCourse(@PathVariable Long id,HttpServletRequest serverHttpRequest) {
		DetailCourseEntity course = courseDAO.getDetailCourse(id);
		course.setBeforeResource(getUrl(serverHttpRequest));
		return ResponseEntity.ok(course);
	}	
	@DeleteMapping("/{id}")
	public ResponseEntity<Object> deleteCourse(@PathVariable Integer id,HttpServletRequest httpServletRequest) {
		if(courseDAO.deleteCourse(id)) {
			
			return ResponseEntity.ok().build();
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Thất bại xóa khóa học");
	}
	
	@GetMapping("/categories")
	@ResponseBody
	public ResponseEntity<Object> listCatogory(@RequestParam(defaultValue ="-1") int actived, HttpServletRequest httpServletRequest) {
		List<CategoryEntity> lstCategories = courseDAO.getCategories(actived);
		//System.err.println(lstCategories);
		return ResponseEntity.ok(lstCategories);
	}

}
