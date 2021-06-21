package vn.edu.topedu.convert;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import vn.edu.topedu.dao.CourseDAO;
import vn.edu.topedu.entity.EvaluateEntity;

@Component
public class EvaluateIdToEvaluateConverter implements Converter<String, EvaluateEntity> {
	private CourseDAO courseDAO;

	public EvaluateIdToEvaluateConverter(CourseDAO courseDAO) {
		this.courseDAO = courseDAO;
	}

	@Override
	public EvaluateEntity convert(String source) {
		//System.err.println("courseDAO" + courseDAO);
		return courseDAO.getEvaluate(Long.valueOf(source));
	}

}
