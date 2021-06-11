package vn.edu.topedu.convert;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import vn.edu.topedu.dao.CourseDAO;
import vn.edu.topedu.entity.course.full.Lesson;

@Component
public class StringToLessonConverter implements Converter<String, Lesson> {
	private CourseDAO courseDAO;

	public StringToLessonConverter(CourseDAO courseDAO) {
		this.courseDAO = courseDAO;
	}

	@Override
	public Lesson convert(String source) {
		//System.err.println("courseDAO" + courseDAO);
		return courseDAO.getLesson(Long.valueOf(source));
	}

}
