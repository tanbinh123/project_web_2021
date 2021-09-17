package vn.edu.topedu.rest.admin;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import vn.edu.topedu.dao.VideoDAO;
import vn.edu.topedu.entity.Payment;
import vn.edu.topedu.entity.course.Course;
import vn.edu.topedu.entity.course.full.VideoEntity;
import vn.edu.topedu.fileprocess.FileProcess;
import vn.edu.topedu.response.PageResponse;
import vn.edu.topedu.response.PageResponse.Pagination;
import vn.edu.topedu.utils.WebUtils;
import vn.edu.topedu.xuggler.VideoInfo;

@RestController
@RequestMapping("/video")
public class VideoREST {
	@Autowired
	private VideoDAO videoDAO;
	@SuppressWarnings("unchecked")
	@PreAuthorize("hasRole('ADMIN')")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ResponseEntity<Object> list(HttpServletRequest httpServletRequest, 
			Authentication authentication,
			@RequestParam(defaultValue = "-1") int _page, 
			@RequestParam(defaultValue = "-1") int _limit,
			@RequestParam(defaultValue = "id:asc") String _sort,		
			@RequestParam(defaultValue = "") String _search) {

		_page = (_page <= 0) ? 1 : _page;
		List<VideoEntity> lstCourse = videoDAO.getListEntitys(_page, _limit, _sort, _search);
		long countRows = videoDAO.getCount(_search);
		// System.out.println(countRows);
		for (VideoEntity c : lstCourse) {
			String bf = WebUtils.getUrl(httpServletRequest);
			c.setBeforeResource(bf);
			new Thread(new Runnable() {
				
				@Override
				public void run() {
					// TODO Auto-generated method stub
					try {
						
						String ajp=FileProcess.getPath(c.absPath()).toFile().getAbsolutePath();
						long a = VideoInfo.getDuration(ajp);
						System.err.println(ajp);
						System.err.println(a);
					} catch (Exception e) {
						// TODO: handle exception
					}
					
				}
			}).start();
			//System.err.println(c.);

		}
		final String sort = _sort;
		@SuppressWarnings("rawtypes")
		PageResponse<Course> pageResponse = new PageResponse(lstCourse, _limit, _page, countRows, new Pagination() {
			private String _sort = sort;

			public String get_sort() {
				return _sort;
			}

		});
		return ResponseEntity.ok(pageResponse);
	}

}
