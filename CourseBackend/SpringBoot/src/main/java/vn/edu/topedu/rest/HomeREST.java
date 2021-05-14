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

	@Autowired
	private CourseDAO courseDAO;

	@GetMapping("/search")
	@ResponseBody
	public ResponseEntity<Object> sendMailByEmail(HttpServletRequest serverHttpRequest
			, @RequestParam(defaultValue = "-1") int _page 
			, @RequestParam(defaultValue = "-1") int _limit 
			, @RequestParam(defaultValue = "id:asc") String _sort
			, @RequestParam(defaultValue = "") String _search
			, @RequestParam(defaultValue = "-1") int category 
			) {
		String _filter = "";
		if(category!=-1)
			_filter+=String.format("category=%d&", category);
		if(_filter.length()>0&&_filter.charAt(_filter.length()-1)=='&') {
			_filter=_filter.substring(0, _filter.length()-1);
		}
		_page=(_page<=0)?1:_page;
		System.out.println(_search);
		List<Course> lstCourse = courseDAO.search(_page, _limit, _sort,_search, category);
		long countCourse = courseDAO.getCountSearch(_search, category);
		
		for(Course c:lstCourse) {
			c.setBeforeResource(WebUtils.getUrl(serverHttpRequest));
			
		}
		PageResponse pageResponse=new PageResponse(lstCourse, _limit, _page, countCourse,_sort,_filter);
		return ResponseEntity.ok(pageResponse);
		//return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(new MessageResponse("Server can't search.", "Server không thể tìm kiếm."));
	}

	
}
