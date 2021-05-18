package vn.edu.topedu.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.ConversionService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import vn.edu.topedu.dao.CourseDAO;
import vn.edu.topedu.dao.ResourceImageDAO;
import vn.edu.topedu.entity.CategoryEntity;
import vn.edu.topedu.entity.ResourceImage;
import vn.edu.topedu.entity.course.Course;
import vn.edu.topedu.entity.course.full.FullCourse;
import vn.edu.topedu.entity.course.full.VideoEntity;
import vn.edu.topedu.fileprocess.FileProcess;
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
	@Autowired
	ConversionService conversionService;
	
//	private static final Logger LOG = LoggerFactory.getLogger(AdminControlller.class);
	
	@GetMapping("/admin/course/{fullcourse}")
	public String adminCourse(HttpServletRequest httpServletRequest,Map<String, Object> model, @PathVariable FullCourse fullcourse) {
		FullCourse c = fullcourse;
		List<CategoryEntity> categories = courseDAO.getCategories(-1);
		List<ResourceImage> images = resourceImageDAO.getResourceImages(Long.valueOf("2"));
		String bef=WebUtils.getUrl(httpServletRequest);
		c.setBeforeResource(bef);
		images.forEach(e->{
			e.setBeforeResource(bef);
		});
		List<VideoEntity> videos = courseDAO.getVideos(-1);
		
		if(videos!=null)
		videos.forEach(e->{
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
		return "course";
	}
	
	@PostMapping("/admin/course/{idCourse}")
	public String adminCourse(HttpServletRequest httpServletRequest,@ModelAttribute FullCourse c,Map<String, Object> model, @PathVariable long idCourse) {
		System.err.println("POST");
		c.setUpdateAt(new Date());
		c=courseDAO.updateFullCourse(c);
		List<CategoryEntity> categories = courseDAO.getCategories(-1);
		List<VideoEntity> videos = courseDAO.getVideos(-1);
		List<ResourceImage> images = resourceImageDAO.getResourceImages(Long.valueOf("2"));
		String bef=WebUtils.getUrl(httpServletRequest);
		c.setBeforeResource(bef);
		images.forEach(e->{
			e.setBeforeResource(bef);
		});
		if(videos!=null)
		videos.forEach(e->{
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
	public String list(HttpServletRequest httpServletRequest
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
			c.setBeforeResource(WebUtils.getUrl(httpServletRequest));
			
		}
		PageResponse pageResponse=new PageResponse(lstCourse, _limit, _page, countRows,_sort, _filter);
		model.put("pageResponse", pageResponse);
		String homeUrl = WebUtils.getUrl(httpServletRequest, 3000);
		model.put("homeUrl",homeUrl);
		return "courses";
	}
	
	@PostMapping(value = "/admin/upload/video/multipartfile", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	@ResponseBody
	public ResponseEntity<Object> testUploadFilePart(@RequestPart("name") String name,
			@RequestPart("file") MultipartFile file) {
		String pathContain = "test";
		try {
			System.out.println(String.format("Name: %s", name));
			System.out.println(String.format("File: %s", file.getOriginalFilename()));
			File p = FileProcess.getPath(pathContain, file.getOriginalFilename()).toFile();
			System.out.println(p.getAbsolutePath());
			p.getParentFile().mkdirs();
			InputStream initialStream = file.getInputStream();
			OutputStream outStream = new FileOutputStream(p);

			byte[] buffer = new byte[8 * 1024];
			int bytesRead;
			while ((bytesRead = initialStream.read(buffer)) != -1) {
				outStream.write(buffer, 0, bytesRead);
			}
			IOUtils.closeQuietly(initialStream);
			IOUtils.closeQuietly(outStream);
			return ResponseEntity.ok().build();
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
		}

	}
	
	@PostMapping(value = "/admin/upload/image/multipartfile", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	@ResponseBody
	public ResponseEntity<Object> testUploadImage(@RequestPart("name") String name,
			@RequestPart("file") MultipartFile file) {
		String pathContain = "test";
		try {
			System.out.println(String.format("Name: %s", name));
			System.out.println(String.format("File: %s", file.getOriginalFilename()));
			File p = FileProcess.getPath(pathContain, file.getOriginalFilename()).toFile();
			System.out.println(p.getAbsolutePath());
			p.getParentFile().mkdirs();
			InputStream initialStream = file.getInputStream();
			OutputStream outStream = new FileOutputStream(p);

			byte[] buffer = new byte[8 * 1024];
			int bytesRead;
			while ((bytesRead = initialStream.read(buffer)) != -1) {
				outStream.write(buffer, 0, bytesRead);
			}
			IOUtils.closeQuietly(initialStream);
			IOUtils.closeQuietly(outStream);
			return ResponseEntity.ok().build();
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
		}

	}

}
