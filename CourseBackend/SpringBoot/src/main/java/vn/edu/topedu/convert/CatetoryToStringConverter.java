package vn.edu.topedu.convert;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import vn.edu.topedu.entity.CategoryEntity;
@Component
public class CatetoryToStringConverter implements Converter<CategoryEntity, String> {

	@Override
	public String convert(CategoryEntity source) {
		return source.getName();
	}

}
