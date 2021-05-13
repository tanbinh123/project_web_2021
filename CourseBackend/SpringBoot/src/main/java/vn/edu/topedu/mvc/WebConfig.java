package vn.edu.topedu.mvc;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import vn.edu.topedu.convert.DateToStringConverter;

//@EnableWebMvc
@Configuration
public class WebConfig implements WebMvcConfigurer {

	/*
	 * @Override public void addViewControllers(ViewControllerRegistry registry) {
	 * registry.addViewController("/").setViewName("index"); }
	 */

	/*
	 * @Bean public ViewResolver viewResolver() { InternalResourceViewResolver bean
	 * = new InternalResourceViewResolver(); bean.setViewClass(JstlView.class);
	 * bean.setPrefix("/WEB-INF/view/"); bean.setSuffix(".jsp");
	 * 
	 * return bean; }
	 */
	
	@Override
  public void addFormatters(FormatterRegistry registry) {
      registry.addConverter(new DateToStringConverter());
  }
}