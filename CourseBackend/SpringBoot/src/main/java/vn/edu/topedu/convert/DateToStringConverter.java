package vn.edu.topedu.convert;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class DateToStringConverter implements Converter<Date, String> {
	static SimpleDateFormat simpleDateFormat= new SimpleDateFormat("dd-MM-yyyy");

	@Override
	public String convert(Date source) {
		return simpleDateFormat.format(source);
	}

}
