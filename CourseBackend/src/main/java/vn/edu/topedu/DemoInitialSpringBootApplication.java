package vn.edu.topedu;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication

public class DemoInitialSpringBootApplication {
	public static void main(String[] args) {
		SpringApplication.run(DemoInitialSpringBootApplication.class, args);
	}

//	@Bean
//    public CommonsMultipartResolver commonsMultipartResolver() {
//        final CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();
//        commonsMultipartResolver.setMaxUploadSize(-1);
//        return commonsMultipartResolver;
//    }
//
//    @Bean
//    public FilterRegistrationBean multipartFilterRegistrationBean() {
//        final MultipartFilter multipartFilter = new MultipartFilter();
//        final FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean(multipartFilter);
//        filterRegistrationBean.addInitParameter("multipartResolverBeanName", "commonsMultipartResolver");
//        return filterRegistrationBean;
//    }
}