package vn.edu.topedu.convert;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import vn.edu.topedu.dao.CourseDAO;
import vn.edu.topedu.entity.CategoryEntity;
@Component
public class IntegerToCatetoryConverter implements Converter<Integer, CategoryEntity> {
	@Autowired
	private CourseDAO courseDAO;
	@Override
	public CategoryEntity convert(Integer source) {
		return courseDAO.findCatetoryById(source);
	}

}
