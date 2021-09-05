package vn.edu.topedu.controller.admin;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.ConversionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import vn.edu.topedu.dao.AppUserDAO;
import vn.edu.topedu.dao.CourseDAO;
import vn.edu.topedu.dao.ResourceImageDAO;
import vn.edu.topedu.entity.CategoryEntity;
import vn.edu.topedu.entity.ResourceImage;
import vn.edu.topedu.entity.course.Course;
import vn.edu.topedu.entity.course.full.FullCourse;
import vn.edu.topedu.entity.course.full.VideoEntity;
import vn.edu.topedu.jwt.security.PBKDF2Encoder;
import vn.edu.topedu.request.LoginFormRedirect;
import vn.edu.topedu.response.PageResponse;
import vn.edu.topedu.utils.WebUtils;

@Controller
public class CourseControlller {

	@Autowired
	CourseDAO courseDAO;
	@Autowired
	ResourceImageDAO resourceImageDAO;

	@Autowired
	ConversionService conversionService;

	@Autowired
	private PBKDF2Encoder passwordEncoder;

	@Autowired
	private AppUserDAO appUserDAO;

	@GetMapping("/admin/course/{fullcourse}")
	public String adminCourse(HttpServletRequest httpServletRequest, Map<String, Object> model,
			@PathVariable FullCourse fullcourse, HttpSession httpSession) {
		String username = (String) httpSession.getAttribute("username");
		if (username == null) {
			LoginFormRedirect authRequest = new LoginFormRedirect();
			authRequest.setUrlReturn("/admin/upload/image/multipartfile");
			model.put("formLogin", authRequest);
			return "login";
		}

		FullCourse c = fullcourse;
		System.err.println(c.getImagePoster().getImage());
		List<CategoryEntity> categories = courseDAO.getCategories(-1);
		List<ResourceImage> images = resourceImageDAO.getResourceImages();
		String bef = WebUtils.getUrl(httpServletRequest);
		c.setBeforeResource(bef);
		images.forEach(e -> {
			e.setBeforeResource(bef);
		});
		List<VideoEntity> videos = courseDAO.getVideos(-1);

		if (videos != null)
			videos.forEach(e -> {
				e.setBeforeResource(bef);
			});
		model.put("videos", videos);
		model.put("images", images);
		model.put("fullcourse", c);
		model.put("categories", categories);
//		LOG.info("Sending order for the request date {} ", c.getUpdateAt());
//		LOG.info("Sending order for the request date {} ", c.getCategory());
//		System.err.println(conversionService.convert(c.getUpdateAt(), String.class));
//		System.err.println(c.getUpdateAt());
		System.err.println(c.getImagePosterId());
		return "course";
	}

	@PostMapping("/admin/course/{idCourse}")
	public String adminCourse(HttpServletRequest httpServletRequest, @ModelAttribute FullCourse c,
			Map<String, Object> model, @PathVariable long idCourse, HttpSession httpSession) {

		String username = (String) httpSession.getAttribute("username");
		if (username == null) {
			LoginFormRedirect authRequest = new LoginFormRedirect();
			authRequest.setUrlReturn("/admin/course/"+idCourse);
			model.put("formLogin", authRequest);
			return "login";
		}
		System.err.println("POST");
		//System.err.println(c.getLearnings().size());
		
		c.setUpdateAt(new Date());
		try {
			c = courseDAO.updateFullCourse(c);
		} catch (Exception e1) {
			c = courseDAO.getFullCourse(idCourse);
		}
		List<CategoryEntity> categories = courseDAO.getCategories(-1);
		List<VideoEntity> videos = courseDAO.getVideos(-1);
		List<ResourceImage> images = resourceImageDAO.getResourceImages();
		String bef = WebUtils.getUrl(httpServletRequest);
		c.setBeforeResource(bef);
		images.forEach(e -> {
			e.setBeforeResource(bef);
		});
		if (videos != null)
			videos.forEach(e -> {
				e.setBeforeResource(bef);
			});
		model.put("videos", videos);
		model.put("fullcourse", c);
		model.put("images", images);
		model.put("categories", categories);
//		System.err.println(conversionService.convert(c.getUpdateAt(), String.class));
//		System.err.println(c.getUpdateAt());
		return "course";
	}

	@GetMapping(value = "/admin/courses")
	public String list(HttpServletRequest httpServletRequest, @RequestParam(defaultValue = "-1") int _page,
			@RequestParam(defaultValue = "10") int _limit,
			@RequestParam(defaultValue = "updateAt:desc") String _sort,
			@RequestParam(defaultValue = "") String _search,
			@RequestParam(defaultValue = "-1") BigDecimal price_gte,
			@RequestParam(defaultValue = "-1") BigDecimal price_lt,
			@RequestParam(defaultValue = "-1") int category,
			Map<String, Object> model) {
		String _filter = "";
		if (category != -1)
			_filter += String.format("category=%d&", category);
		if (_search.length() != 0)
			_filter += String.format("_search=%s&", _search);
		if (_filter.length() > 0 && _filter.charAt(_filter.length() - 1) == '&') {
			_filter = _filter.substring(0, _filter.length() - 1);
		}

		_page = (_page <= 0) ? 1 : _page;
		List<Course> lstCourse = courseDAO.getListCourse(_page, _limit, _sort, category, _search,price_gte,price_lt);
		long countRows = courseDAO.getCount(category, _search,price_gte,price_lt);
		for (Course c : lstCourse) {
			c.setBeforeResource(WebUtils.getUrl(httpServletRequest));

		}
		PageResponse<Course> pageResponse = new PageResponse(lstCourse, _limit, _page, countRows, null);
		model.put("pageResponse", pageResponse);

		return "courses";
	}

	@GetMapping("/admin/upload/course")
	public String uploadCourse(HttpServletRequest httpServletRequest, Map<String, Object> model,
			HttpSession httpSession) {
		String username = (String) httpSession.getAttribute("username");
		if (username == null) {
			LoginFormRedirect authRequest = new LoginFormRedirect();
			authRequest.setUrlReturn("/admin/upload/image/multipartfile");
			model.put("formLogin", authRequest);
			return "login";
		}

		FullCourse c = new FullCourse();
		// System.err.println(c.getPoster().getImage());
		List<CategoryEntity> categories = courseDAO.getCategories(-1);
		List<ResourceImage> images = resourceImageDAO.getResourceImages();
		String bef = WebUtils.getUrl(httpServletRequest);
		c.setBeforeResource(bef);
		images.forEach(e -> {
			e.setBeforeResource(bef);
		});
		List<VideoEntity> videos = courseDAO.getVideos(-1);

		if (videos != null)
			videos.forEach(e -> {
				e.setBeforeResource(bef);
			});
		model.put("videos", videos);
		model.put("images", images);
		model.put("fullcourse", c);
		model.put("categories", categories);
		return "upload/course";
	}

	@PostMapping("/admin/upload/course")
	public String uploadCourse(HttpServletRequest httpServletRequest, @ModelAttribute FullCourse c,
			Map<String, Object> model, HttpSession httpSession) {
		Long tmpImagePosterId= c.getImagePosterId();
		Long tmpVideoDemoId= c.getVideoDemoId();
		String username = (String) httpSession.getAttribute("username");
		if (username == null) {
			LoginFormRedirect authRequest = new LoginFormRedirect();
			authRequest.setUrlReturn("/admin/upload/image/multipartfile");
			model.put("formLogin", authRequest);
			return "login";
		}
		
		System.err.println("POST");
		c.setUpdateAt(new Date());
		try {
			c.setUserPoster(appUserDAO.findUserAccount(username));
			c.setUserPosterId(c.getUserPoster().getId());
			c = courseDAO.persistFullCourse(c);
		} catch (Exception e1) {
			System.err.println(e1.getMessage());
			List<CategoryEntity> categories = courseDAO.getCategories(-1);
			List<VideoEntity> videos = courseDAO.getVideos(-1);
			List<ResourceImage> images = resourceImageDAO.getResourceImages();
			c.setImagePosterId(tmpImagePosterId);
			c.setVideoDemoId(tmpVideoDemoId);
			
			String bef = WebUtils.getUrl(httpServletRequest);
			c.setBeforeResource(bef);
			images.forEach(e -> {
				e.setBeforeResource(bef);
			});
			if (videos != null)
				videos.forEach(e -> {
					e.setBeforeResource(bef);
				});
			model.put("videos", videos);
			model.put("fullcourse", c);
			model.put("images", images);
			model.put("categories", categories);
			return "upload/course";
		}
		return "redirect:/admin";
	}

}
