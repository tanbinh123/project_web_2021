package vn.edu.topedu.convert;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import vn.edu.topedu.dao.CourseDAO;
import vn.edu.topedu.entity.course.full.FullCourse;
import vn.edu.topedu.entity.previewcourse.PreviewCourseEntity;

@Component
public class CourseIdToPreviewCourseConverter implements Converter<String, PreviewCourseEntity> {
	private CourseDAO courseDAO;

	public CourseIdToPreviewCourseConverter(CourseDAO courseDAO) {
		this.courseDAO = courseDAO;
	}

	@Override
	public PreviewCourseEntity convert(String source) {
		//System.err.println("courseDAO" + courseDAO);
		return courseDAO.getPreviewCourse(Long.valueOf(source));
	}

}
