package vn.edu.topedu.thymeleaf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.thymeleaf.spring5.SpringTemplateEngine;
import org.thymeleaf.spring5.view.ThymeleafViewResolver;
import org.thymeleaf.templatemode.TemplateMode;
import org.thymeleaf.templateresolver.ClassLoaderTemplateResolver;
import org.thymeleaf.templateresolver.ITemplateResolver;

@Configuration
public class ThymeleafTemplateConfig {
	@Bean
    public ViewResolver thymeleafViewResolver() {
 
        ThymeleafViewResolver viewResolver = new ThymeleafViewResolver();
 
        viewResolver.setTemplateEngine(springTemplateEngine());
        viewResolver.setCharacterEncoding("UTF-8");
        viewResolver.setOrder(0);
 
//        // Important!!
//        // th_page1.html, th_page2.html, ...
        viewResolver.setViewNames(new String[] { "th_*" });
 
        return viewResolver;
    }
	@Bean
	public SpringTemplateEngine springTemplateEngine() {
		final  SpringTemplateEngine templateEngine = new SpringTemplateEngine();
		templateEngine.addTemplateResolver(itemplateResolver());
		templateEngine.addTemplateResolver(imailResolver());
		//templateEngine.setEnableSpringELCompiler(true);
		return templateEngine;
	}
	@Bean
	public ITemplateResolver itemplateResolver() {
		final  ClassLoaderTemplateResolver templateResolver = new ClassLoaderTemplateResolver();
	    //Ensure the path is right or you work without the logic using the ClassLoaderTemplateResolver
		templateResolver.setOrder(Integer.valueOf(1));
		templateResolver.setPrefix("/templates/");
	    templateResolver.setSuffix(".html");
	    templateResolver.setSuffix(".jsp");
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
//		templateResolver.setSuffix(".html");
		templateResolver.setTemplateMode(TemplateMode.HTML);
		templateResolver.setCharacterEncoding("UTF-8");
		templateResolver.setCheckExistence(true);
		templateResolver.setCacheable(false);
		return templateResolver;
	}
	


}
