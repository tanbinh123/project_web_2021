package vn.edu.topedu.convert;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import vn.edu.topedu.dao.CourseDAO;
import vn.edu.topedu.entity.course.full.FullCourse;
import vn.edu.topedu.entity.course.full.Part;

@Component
public class StringToPartConverter implements Converter<String, Part> {
	private CourseDAO courseDAO;

	public StringToPartConverter(CourseDAO courseDAO) {
		this.courseDAO = courseDAO;
	}

	@Override
	public Part convert(String source) {
		//System.err.println("courseDAO" + courseDAO);
		return courseDAO.getPart(Long.valueOf(source));
	}

}
