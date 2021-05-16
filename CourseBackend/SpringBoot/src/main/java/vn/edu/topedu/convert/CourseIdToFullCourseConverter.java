package vn.edu.topedu.convert;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import vn.edu.topedu.dao.CourseDAO;
import vn.edu.topedu.entity.course.full.FullCourse;

@Component
public class CourseIdToFullCourseConverter implements Converter<String, FullCourse> {
	private CourseDAO courseDAO;

	public CourseIdToFullCourseConverter(CourseDAO courseDAO) {
		this.courseDAO = courseDAO;
	}

	@Override
	public FullCourse convert(String source) {
		System.err.println("courseDAO" + courseDAO);
		return courseDAO.getFullCourse(Long.valueOf(source));
	}

}
