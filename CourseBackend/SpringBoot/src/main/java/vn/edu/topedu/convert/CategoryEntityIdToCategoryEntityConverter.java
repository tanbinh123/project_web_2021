package vn.edu.topedu.convert;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import vn.edu.topedu.dao.CourseDAO;
import vn.edu.topedu.entity.CategoryEntity;

@Component
public class CategoryEntityIdToCategoryEntityConverter implements Converter<String, CategoryEntity> {
	private CourseDAO courseDAO;

	public CategoryEntityIdToCategoryEntityConverter(CourseDAO courseDAO) {
		this.courseDAO = courseDAO;
	}

	@Override
	public CategoryEntity convert(String source) {
		//System.err.println("courseDAO" + courseDAO);
		return courseDAO.getCategoryEntity(Integer.valueOf(source));
	}

}
