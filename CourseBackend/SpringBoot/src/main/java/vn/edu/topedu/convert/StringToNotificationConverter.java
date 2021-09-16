package vn.edu.topedu.convert;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import vn.edu.topedu.dao.CourseDAO;
import vn.edu.topedu.dao.NotificationDAO;
import vn.edu.topedu.entity.NotificationEntity;
import vn.edu.topedu.entity.course.full.FullCourse;
import vn.edu.topedu.entity.course.full.Part;

@Component
public class StringToNotificationConverter implements Converter<String, NotificationEntity> {
	private NotificationDAO notificationDAO;

	public StringToNotificationConverter(NotificationDAO notificationDAO) {
		this.notificationDAO = notificationDAO;
	}

	@Override
	public NotificationEntity convert(String source) {
		//System.err.println("courseDAO" + courseDAO);
		return notificationDAO.getEntity(Long.valueOf(source));
	}

}
