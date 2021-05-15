package vn.edu.topedu.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import vn.edu.topedu.convert.CatetoryToStringConverter;
import vn.edu.topedu.convert.DateToStringConverter;

@Configuration
public class ConverterConfig implements WebMvcConfigurer {

    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(new CatetoryToStringConverter());
        registry.addConverter(new DateToStringConverter());
    }
    
}