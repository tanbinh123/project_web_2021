package vn.edu.topedu.rest.admin;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

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
import vn.edu.topedu.dao.RevenueDAO;
import vn.edu.topedu.dao.VideoDAO;
import vn.edu.topedu.dto.RevenueMonth;
import vn.edu.topedu.dto.RevenueYear;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.ImageAdminEntity;
import vn.edu.topedu.entity.ResourceImage;
import vn.edu.topedu.entity.Revenue;
import vn.edu.topedu.entity.course.BaseCourse;
import vn.edu.topedu.entity.course.full.FullCourse;
import vn.edu.topedu.entity.course.full.Lesson;
import vn.edu.topedu.entity.course.full.Part;
import vn.edu.topedu.entity.course.full.VideoEntity;
import vn.edu.topedu.response.MessageResponse;
import vn.edu.topedu.response.PageResponse;
import vn.edu.topedu.response.PageResponse.Pagination;
import vn.edu.topedu.service.charts.ChartsService;
import vn.edu.topedu.service.charts.ChartsService.PieChart;
import vn.edu.topedu.utils.WebUtils;

@RestController
@RequestMapping("/api/admin/revenue")
public class RevenueRest {

	@Autowired
	private CourseDAO courseDAO;

	@Autowired
	private AppUserDAO appUserDAO;

	@Autowired
	private ImageAdminDAO imageAdminDAO;
	@Autowired
	private ResourceImageDAO resourceImageDAO;
	@Autowired
	private RevenueDAO revenueDAO;
	@Autowired
	private VideoDAO videoDAO;

	@Autowired
	ChartsService chartsService;

	@GetMapping(value = "/list")
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> getAllImageAdmin(HttpServletRequest httpServletRequest,
			@RequestParam(defaultValue = "1") int _page,
			@RequestParam(defaultValue = "10") int _limit,
			@RequestParam(defaultValue = "updateAt:desc") String _sort, 
			@RequestParam(defaultValue = "") String _search,
			@RequestParam(defaultValue = "-1") int month,
			@RequestParam(defaultValue = "-1") int day,
			@RequestParam(defaultValue = "-1") int year) {
		System.out.println("---------------------------------");

		try {
			//List<Revenue> rs = revenueDAO.getEntitys(-1);
			List<Revenue> rs = revenueDAO.getData(_page,_limit,_sort,_search,day,month,year );
			Long count = revenueDAO.countData(day,month,year, _search);	
			@SuppressWarnings({ "rawtypes", "unchecked" })
			PageResponse<BaseCourse> pageResponse = new PageResponse(rs, _limit, _page, count, new Pagination() {
				public String get_sort() {
					return _sort;
				}

			});
			
			return ResponseEntity.ok(pageResponse);
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
	
	
	@GetMapping(value = "/10day")
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> getDay(
			HttpServletRequest httpServletRequest	
			) {
		System.out.println("---------------------------------");

		try {
			
			List<Revenue> rs = revenueDAO.getRevenueDay(10);
			Map<String,Revenue> lst= new TreeMap<>();
			SimpleDateFormat s= new SimpleDateFormat("yyyy-MM-dd");
			for(int i=0;i<10;i++) {
				Calendar tmp = Calendar.getInstance();
				tmp.add(Calendar.DATE, i-10);				
				int year=tmp.get(Calendar.YEAR);
				int month=tmp.get(Calendar.MONTH);
				int day=tmp.get(Calendar.DAY_OF_MONTH);
				
				String key= s.format(tmp.getTime());
				System.out.println(key);
				Revenue a = new Revenue();
				a.setYear(year);
				a.setMonth(month+1);
				a.setDay(day);
				lst.put(key, a);
			}
			for(Revenue e:rs) {
				Calendar tmp = Calendar.getInstance();
				tmp.set(Calendar.YEAR, e.getYear());
				tmp.set(Calendar.MONTH, e.getMonth()-1);
				tmp.set(Calendar.DAY_OF_MONTH, e.getDay());
				String key= s.format(tmp.getTime());
				lst.put(key, e);
			}
			
			
			return ResponseEntity.ok(lst);
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.BAD_REQUEST)
					.body(new MessageResponse("Error.", "Lỗi không xác định"));
		}

	}
	
	@GetMapping(value = "/12month")
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> get12Month(
			HttpServletRequest httpServletRequest	
			) {
		System.out.println("---------------------------------");

		try {
			
//			int year = Calendar.getInstance().get(Calendar.YEAR);//+1900;
//			int month = Calendar.getInstance().get(Calendar.MONTH)+1;
//			int day = Calendar.getInstance().get(Calendar.DAY_OF_MONTH);
//			
			int max=12;
			
			//System.out.println(String.format("%d/%d/%d", day, month,year));
			List<RevenueMonth> rs = revenueDAO.getRevenueMonth(max);
			Map<String,RevenueMonth> lst= new TreeMap<>();
			SimpleDateFormat s= new SimpleDateFormat("yyyy-MM");
			for(int i=0;i<max;i++) {
				Calendar tmp = Calendar.getInstance();
				tmp.add(Calendar.MONTH, i-max);				
				int year=tmp.get(Calendar.YEAR);
				int month=tmp.get(Calendar.MONTH);
				
				
				String key= s.format(tmp.getTime());
				//System.out.println(key);
				RevenueMonth a = new RevenueMonth(year,month, BigDecimal.valueOf(0), BigDecimal.valueOf(0), BigDecimal.valueOf(0), BigDecimal.valueOf(0));
//				a.setYear(year);
//				a.setMonth(month);
				
				lst.put(key, a);
			}
			for(RevenueMonth e:rs) {
				Calendar tmp = Calendar.getInstance();
				tmp.set(Calendar.YEAR, e.getYear());
				tmp.set(Calendar.MONTH, e.getMonth()-1);
				
				String key= s.format(tmp.getTime());
				lst.put(key, e);
			}
			
			
			return ResponseEntity.ok(lst);
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.BAD_REQUEST)
					.body(new MessageResponse("Error.", "Lỗi không xác định"));
		}

	}
	
	@GetMapping(value = "/10year")
	@ResponseBody
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Object> get10year(
			HttpServletRequest httpServletRequest	
			) {
		System.out.println("---------------------------------");

		try {
			int max=10;
			
			//System.out.println(String.format("%d/%d/%d", day, month,year));
			List<RevenueYear> rs = revenueDAO.getRevenueYear(max);
			Map<String,RevenueYear> lst= new TreeMap<>();
			SimpleDateFormat s= new SimpleDateFormat("yyyy");
			for(int i=0;i<max;i++) {
				Calendar tmp = Calendar.getInstance();
				tmp.add(Calendar.YEAR, i-max);				
				int year=tmp.get(Calendar.YEAR);
				int month=tmp.get(Calendar.MONTH);
				
				
				String key= s.format(tmp.getTime());
				//System.out.println(key);
				RevenueYear a = new RevenueYear(year, BigDecimal.valueOf(0), BigDecimal.valueOf(0), BigDecimal.valueOf(0), BigDecimal.valueOf(0));
//				a.setYear(year);
//				a.setMonth(month);
				
				lst.put(key, a);
			}
			for(RevenueYear e:rs) {
				Calendar tmp = Calendar.getInstance();
				tmp.set(Calendar.YEAR, e.getYear());
			//	tmp.set(Calendar.MONTH, e.getMonth()-1);
				
				String key= s.format(tmp.getTime());
				lst.put(key, e);
			}
			
			
			return ResponseEntity.ok(lst);
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.BAD_REQUEST)
					.body(new MessageResponse("Error.", "Lỗi không xác định"));
		}

	}


}
