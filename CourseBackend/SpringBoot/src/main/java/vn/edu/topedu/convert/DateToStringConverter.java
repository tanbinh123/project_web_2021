package vn.edu.topedu.convert;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import vn.edu.topedu.constants.ApplicationConstants;
//@Component
public class DateToStringConverter implements Converter<Date, String> {
//	static SimpleDateFormat simpleDateFormat= new SimpleDateFormat("dd-MM-yyyy");
	SimpleDateFormat simpleDateFormat= new SimpleDateFormat(ApplicationConstants.DATE_FORMAT);

	@Override
	public String convert(Date source) {
		return simpleDateFormat.format(source);
	}

}
