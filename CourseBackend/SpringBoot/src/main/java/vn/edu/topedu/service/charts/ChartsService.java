package vn.edu.topedu.service.charts;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import vn.edu.topedu.dao.CatogoryDAO;
import vn.edu.topedu.dao.CourseDAO;
import vn.edu.topedu.dao.RevenueDAO;
import vn.edu.topedu.entity.CategoryEntity;
import vn.edu.topedu.entity.Revenue;
import vn.edu.topedu.json.JsonResponse;
import vn.edu.topedu.service.charts.ChartsService.PieChart.Data;

@Service
public class ChartsService {
	@Autowired
	private MessageSource messageSource;
	@Autowired
	private CatogoryDAO catogoryDAO;
	@Autowired
	private CourseDAO courseDAO;
	@Autowired
	private RevenueDAO revenueAO;

	public PieChart getPieChartCategory() {
		PieChart pieChart = new PieChart();
		String title = messageSource.getMessage("piechart", null, new Locale("vi", "VN"));
		pieChart.setTitle(title);
		List<CategoryEntity> categories = catogoryDAO.getCategories(-1);
		Long tolals = catogoryDAO.getToltalCourse(-1);
		List<Data> data = new ArrayList<PieChart.Data>();
		if (categories != null)
			categories.forEach(e -> {
				double rs = (double) e.getTotal() / (double) tolals.doubleValue() * 100;
				BigDecimal bigDecimal = new BigDecimal(Double.toString(rs));
				bigDecimal = bigDecimal.setScale(2, RoundingMode.HALF_UP);
				data.add(new Data(bigDecimal.doubleValue(), e.getName()));

			});
		pieChart.setDataPoints(data);
		System.err.println("Service Run");
		return pieChart;
	}

	public PieChart getPieChartCategoryMoney() {
		PieChart pieChart = new PieChart();
		String title = "Biểu đồ doanh thu the từng thể loại khóa học";
		pieChart.setTitle(title);
		List<CategoryEntity> categories = catogoryDAO.getCategories(-1);
		BigDecimal tolals = catogoryDAO.getToltalMoney(-1);
		List<Data> data = new ArrayList<PieChart.Data>();
		if (categories != null)
			categories.forEach(e -> {
				double rs = 0;
				try {
					rs = e.getTotalMoney().doubleValue() / tolals.doubleValue() * 100;
					// if(rs)
					BigDecimal bigDecimal = new BigDecimal(Double.toString(rs));
					bigDecimal = bigDecimal.setScale(2, RoundingMode.HALF_UP);
					data.add(new Data(bigDecimal.doubleValue(), e.getName()));

				} catch (Exception e2) {
					data.add(new Data(0, e.getName()));

				}

			});
		pieChart.setDataPoints(data);
		System.err.println("Service Run");
		return pieChart;
	}
	
	public PieChart getChartMoneyCategories() {
		PieChart pieChart = new PieChart();
		String title = "Biểu đồ doanh thu từng thể loại khóa học";
		pieChart.setTitle(title);
		List<CategoryEntity> categories = catogoryDAO.getCategories(-1);
		List<Data> data = new ArrayList<PieChart.Data>();
		if (categories != null)
			categories.forEach(e -> {
				data.add(new Data(e.getTotalMoney().doubleValue(), e.getName()));
			});
		pieChart.setDataPoints(data);
		System.err.println("Service Run");
		return pieChart;
	}
	
	public PieChart getChartMoneyMonth() {
		PieChart pieChart = new PieChart();
		String title = "Biểu đồ doanh thu từng tháng trong năm nay";
		pieChart.setTitle(title);
		List<Revenue> categories = revenueAO.getAll(Calendar.getInstance().get(Calendar.YEAR));
		List<Data> data = new ArrayList<PieChart.Data>();
		if (categories != null)
			categories.forEach(e -> {
				data.add(new Data(e.getMoney().doubleValue(),"Tháng "+ e.getMonth()+""));
			});
		pieChart.setDataPoints(data);
		System.err.println("Service Run");
		return pieChart;
	}

	public PieChart getPieChartCategoryDurationLearned() {
		PieChart pieChart = new PieChart();
		String title = "Biểu đồ thời gian học của học viên cho từng thể loại";
		pieChart.setTitle(title);
		List<CategoryEntity> categories = catogoryDAO.getCategories(-1);
		BigDecimal tolals = catogoryDAO.getToltalDuration(-1);
		List<Data> data = new ArrayList<PieChart.Data>();
		if (categories != null)
			categories.forEach(e -> {
				double rs = (double) e.getDurationLearned().doubleValue() / tolals.doubleValue() * 100;
				BigDecimal bigDecimal = new BigDecimal(Double.toString(rs));
				bigDecimal = bigDecimal.setScale(2, RoundingMode.HALF_UP);
				data.add(new Data(bigDecimal.doubleValue(), e.getName()));

			});
		pieChart.setDataPoints(data);
		System.err.println("Service Run");
		return pieChart;
	}

	public static class PieChart implements JsonResponse {
		private String title = "Name";
		private List<Data> dataPoints;

		public String toJsonStringFromDataPoints() {
			return toJsonStringFromObject(dataPoints);
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public static class Data {
			private double y;
			private String label;

			public Data() {
				super();
			}

			public Data(double y, String label) {
				super();
				this.y = y;
				this.label = label;
			}

			public double getY() {
				return y;
			}

			public void setY(double y) {
				this.y = y;
			}

			public String getLabel() {
				return label;
			}

			public void setLabel(String label) {
				this.label = label;
			}

		}

		public List<Data> getDataPoints() {
			return dataPoints;
		}

		public void setDataPoints(List<Data> dataPoints) {
			this.dataPoints = dataPoints;
		}

	}

}
