package vn.edu.topedu.thymeleaf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.thymeleaf.spring5.SpringTemplateEngine;
import org.thymeleaf.templatemode.TemplateMode;
import org.thymeleaf.templateresolver.ClassLoaderTemplateResolver;
import org.thymeleaf.templateresolver.ITemplateResolver;

@Configuration
public class ThymeleafTemplateConfig {
	@Bean
	public SpringTemplateEngine springTemplateEngine() {
		final  SpringTemplateEngine templateEngine = new SpringTemplateEngine();
		templateEngine.addTemplateResolver(itemplateResolver());
		templateEngine.addTemplateResolver(imailResolver());
//		templateEngine.addTemplateResolver(iviewsResolver());
		return templateEngine;
	}
	@Bean
	public ITemplateResolver itemplateResolver() {
		final  ClassLoaderTemplateResolver templateResolver = new ClassLoaderTemplateResolver();
	    //Ensure the path is right or you work without the logic using the ClassLoaderTemplateResolver
		templateResolver.setOrder(Integer.valueOf(1));
		templateResolver.setPrefix("/templates/");
	    templateResolver.setSuffix(".html");
	    templateResolver.setTemplateMode(TemplateMode.HTML);
	    templateResolver.setCharacterEncoding("UTF-8");
	    templateResolver.setCheckExistence(true);
	    templateResolver.setCacheable(false);
	    return templateResolver;
	}
	@Bean
	public ITemplateResolver imailResolver() {
		final  ClassLoaderTemplateResolver templateResolver = new ClassLoaderTemplateResolver();
		//Ensure the path is right or you work without the logic using the ClassLoaderTemplateResolver
		templateResolver.setOrder(Integer.valueOf(2));
		templateResolver.setPrefix("/mail/");
		templateResolver.setSuffix(".html");
		templateResolver.setTemplateMode(TemplateMode.HTML);
		templateResolver.setCharacterEncoding("UTF-8");
		templateResolver.setCheckExistence(true);
		templateResolver.setCacheable(false);
		return templateResolver;
	}
	
//	@Bean
//	public ITemplateResolver iviewsResolver() {
//		final  ClassLoaderTemplateResolver templateResolver = new ClassLoaderTemplateResolver();
//		//Ensure the path is right or you work without the logic using the ClassLoaderTemplateResolver
//		templateResolver.setOrder(Integer.valueOf(2));
//		templateResolver.setPrefix("/views/");
//		templateResolver.setSuffix(".html");
//		templateResolver.setTemplateMode(TemplateMode.HTML);
//		templateResolver.setCharacterEncoding("UTF-8");
//		templateResolver.setCheckExistence(true);
//		templateResolver.setCacheable(false);
//		return templateResolver;
//	}


}
