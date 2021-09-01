package vn.edu.topedu.rest.admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import vn.edu.topedu.dao.AppUserDAO;
import vn.edu.topedu.dao.CourseDAO;
import vn.edu.topedu.dao.ImageAdminDAO;
import vn.edu.topedu.dao.ResourceImageDAO;
import vn.edu.topedu.dao.VideoDAO;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.ImageAdminEntity;
import vn.edu.topedu.entity.ResourceImage;
import vn.edu.topedu.entity.course.full.FullCourse;
import vn.edu.topedu.entity.course.full.Lesson;
import vn.edu.topedu.entity.course.full.Part;
import vn.edu.topedu.entity.course.full.VideoEntity;
import vn.edu.topedu.response.MessageResponse;
import vn.edu.topedu.service.charts.ChartsService;
import vn.edu.topedu.service.charts.ChartsService.PieChart;
import vn.edu.topedu.utils.WebUtils;

@RestController
@RequestMapping("/api/admin/chart")
public class ChartRest {

	@Autowired
	private CourseDAO courseDAO;

	@Autowired
	private AppUserDAO appUserDAO;

	@Autowired
	private ImageAdminDAO imageAdminDAO;
	@Autowired
	private ResourceImageDAO resourceImageDAO;
	@Autowired
	private VideoDAO videoDAO;

	@Autowired
	ChartsService chartsService;

	@GetMapping(value = "/list")
	@ResponseBody
	public ResponseEntity<Object> getAllImageAdmin(HttpServletRequest httpServletRequest) {
		System.out.println("---------------------------------");

		try {
			List<ImageAdminEntity> rs = imageAdminDAO.getEntitys(-1);
			for (ImageAdminEntity imageAdminEntity : rs) {

				imageAdminEntity.setBeforeResource(WebUtils.getUrl(httpServletRequest));
			}

			return ResponseEntity.ok(rs);
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.BAD_REQUEST)
					.body(new MessageResponse("Error.", "Lỗi không xác định"));
		}

	}

	@GetMapping(value = "/one")
	@ResponseBody
	public ResponseEntity<Object> getOne(HttpServletRequest httpServletRequest, @RequestParam String name) {
		System.out.println("---------------------------------");
		System.out.println(name);

		ImageAdminEntity rs = imageAdminDAO.getEntity(name);
		if (rs == null)
			return ResponseEntity.status(HttpStatus.BAD_REQUEST)
					.body(new MessageResponse("Not Image.", "Không có hình với name tồn tại"));
		rs.setBeforeResource(WebUtils.getUrl(httpServletRequest));

		return ResponseEntity.ok(rs);

	}

	@GetMapping
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> get(Authentication authentication,
			// @RequestParam String name,
			HttpServletRequest httpServletRequest) {
		System.out.println("---------------------------------");
		// System.out.println(name);

		if (authentication != null) {
			authentication.getName();
			AppUser appUser = appUserDAO.findUserAccount(authentication.getName());
			if (appUser != null) {
				List<PieChart> lst = new ArrayList<ChartsService.PieChart>();
				
				lst.add(chartsService.getPieChartCategoryMoney());
				lst.add(chartsService.getPieChartCategory());
				lst.add(chartsService.getPieChartCategoryDurationLearned());
				
				lst.add(chartsService.getChartMoneyMonth());
				lst.add(chartsService.getChartMoneyCategories());
				return ResponseEntity.ok(lst);
			}
		}
		
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new MessageResponse("Error.", "Lỗi không xác định"));

	}

}
