package vn.edu.topedu.convert;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

import vn.edu.topedu.constants.ApplicationConstants;

public class StringToCurrencyConverter implements Converter<String, Date> {
	SimpleDateFormat simpleDateFormat= new SimpleDateFormat(ApplicationConstants.DATE_FORMAT);
	@Override
	public Date convert(String source) {
		try {
			return simpleDateFormat.parse(source);
		} catch (ParseException e) {
			System.err.println(e.getMessage());
		}
		return null;
	}

}
