package vn.edu.topedu.convert;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

import vn.edu.topedu.entity.CategoryEntity;

public class CatetoryToStringConverter implements Converter<CategoryEntity, String> {

	@Override
	public String convert(CategoryEntity source) {
		return source.getName();
	}

}
