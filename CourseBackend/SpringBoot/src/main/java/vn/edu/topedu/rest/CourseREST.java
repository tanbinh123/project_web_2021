package vn.edu.topedu.rest;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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

import vn.edu.topedu.dao.CourseDAO;
import vn.edu.topedu.entity.CategoryEntity;
import vn.edu.topedu.entity.course.Course;
import vn.edu.topedu.entity.previewcourse.PreviewCourseEntity;
import vn.edu.topedu.response.PageResponse;
import vn.edu.topedu.response.PageResponse.Pagination;


@RestController
@RequestMapping("/course")
public class CourseREST implements IMyHost {
	
	@Autowired
	private CourseDAO courseDAO;

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
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ResponseEntity<Object> list(HttpServletRequest serverHttpRequest
			, @RequestParam(defaultValue = "-1") int _page 
			, @RequestParam(defaultValue = "-1") int _limit 
			, @RequestParam(defaultValue = "id:asc") String _sort 
			, @RequestParam(defaultValue = "") String _search 
			, @RequestParam(defaultValue = "-1") int _category 
			) {
	
		
		_page=(_page<=0)?1:_page;
		List<Course> lstCourse = courseDAO.getListCourse(_page, _limit, _sort, _category, _search);
		long countRows=courseDAO.getCount(_category, _search);
		//System.out.println(countRows);
		for(Course c:lstCourse) {
			c.setBeforeResource(getUrl(serverHttpRequest));
			
		}
		final String sort= _sort;
		final int category= _category;
		@SuppressWarnings("rawtypes")
		PageResponse<Course> pageResponse=new PageResponse(lstCourse, _limit, _page, countRows,new Pagination() {
			private String _sort = sort;
			private int _category = category;
			public String get_sort() {
				return _sort;
			}
			@SuppressWarnings("unused")
			public int get_category() {
				return _category;
			}

		});
		return ResponseEntity.ok(pageResponse);
	}
	@GetMapping(value = "/{id}")
	public ResponseEntity<Object> getCourse(@PathVariable Long id,HttpServletRequest serverHttpRequest) {
		PreviewCourseEntity course = courseDAO.getPreviewCourse(id);
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
