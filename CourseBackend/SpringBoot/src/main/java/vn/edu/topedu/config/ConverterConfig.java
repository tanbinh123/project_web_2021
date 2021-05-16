package vn.edu.topedu.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import vn.edu.topedu.convert.CatetoryToStringConverter;
import vn.edu.topedu.convert.CourseIdToFullCourseConverter;
import vn.edu.topedu.convert.DateToStringConverter;
import vn.edu.topedu.convert.StringToDateConverter;
import vn.edu.topedu.dao.CourseDAO;

@Configuration
public class ConverterConfig implements WebMvcConfigurer {
	@Autowired
	private CourseDAO courseDAO;

	@Override
	public void addFormatters(FormatterRegistry registry) {
		registry.addConverter(new CatetoryToStringConverter());		
		registry.addConverter(new DateToStringConverter());
		registry.addConverter(new StringToDateConverter());
		registry.addConverter(new CourseIdToFullCourseConverter(courseDAO));
	}

}