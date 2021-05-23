package vn.edu.topedu.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
@Configuration
public class JspViewResolverConfig   {
	@Bean
	public ViewResolver jspViewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();

		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/WEB-INF/views/");
//		viewResolver.setPrefix("/views/");
		viewResolver.setSuffix(".jsp");
		viewResolver.setContentType("text/html");
		// Make sure > Thymeleaf order & FreeMarker order.
		viewResolver.setOrder(1000);

		return viewResolver;
	}

}
