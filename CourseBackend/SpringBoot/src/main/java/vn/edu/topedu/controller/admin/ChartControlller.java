package vn.edu.topedu.controller.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import vn.edu.topedu.dao.CatogoryDAO;
import vn.edu.topedu.dao.CourseDAO;
import vn.edu.topedu.service.charts.ChartsService;
import vn.edu.topedu.service.charts.ChartsService.PieChart;

@Controller
public class ChartControlller {
	@Autowired
	private MessageSource messageSource;
	@Autowired
	CatogoryDAO catogoryDAO;
	@Autowired
	CourseDAO courseDAO;
	@Autowired
	ChartsService chartsService;
	
	@RequestMapping(value = "/admin/charts", method = RequestMethod.GET)
	public ModelAndView charts(Map<String, Object> model) {
		ModelAndView modelAndView = new ModelAndView("charts", model);
		return modelAndView;
	}
	
	@GetMapping(value = "/admin/charts/piechart")
	public ModelAndView piechart(Map<String, Object> model) {
		PieChart pieChart = chartsService.getPieChartCategory();
		model.put("pieChart",pieChart);
		ModelAndView modelAndView = new ModelAndView("charts/piechart", model);
		return modelAndView;
	}
	
	@GetMapping(value = "/admin/charts/piechart-duration-learned")
	public ModelAndView piechartDurationLearned(Map<String, Object> model) {
		PieChart pieChart = chartsService.getPieChartCategoryDurationLearned();
		model.put("pieChart",pieChart);
		ModelAndView modelAndView = new ModelAndView("charts/piechart", model);
		return modelAndView;
	}
	
	@GetMapping(value = "/admin/charts/piechart-category-money")
	public ModelAndView piechartCategoryMoney(Map<String, Object> model) {
		PieChart pieChart = chartsService.getPieChartCategoryMoney();
		model.put("pieChart",pieChart);
		ModelAndView modelAndView = new ModelAndView("charts/piechart", model);
		return modelAndView;
	}
	
//	@PostMapping(value = "/admin/charts/piechart")
//	public String postPiechart(Map<String, Object> model, @ModelAttribute PieChart pieChart) {
//		pieChart=chartsService.getPieChartCategory();
//		model.put("pieChart",pieChart);
//		//return "charts/piechart";
//		return "redirect:/admin/charts/piechart";
//	}
	
	@RequestMapping(value = "/admin/charts/chart", method = RequestMethod.GET)
	public ModelAndView testMVC(Map<String, Object> model) {
		ModelAndView modelAndView = new ModelAndView("charts/chart", model);
		return modelAndView;
	}
	
}
