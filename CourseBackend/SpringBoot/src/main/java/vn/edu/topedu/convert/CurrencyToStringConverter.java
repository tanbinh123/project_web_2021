package vn.edu.topedu.convert;

import java.text.DecimalFormat;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
//@Component
public class CurrencyToStringConverter implements Converter<String, String> {
	DecimalFormat df = new DecimalFormat("###,###,###");
	@Override
	public String convert(String source) {
		return df.format(source) +" VNĐ";
	}

}
