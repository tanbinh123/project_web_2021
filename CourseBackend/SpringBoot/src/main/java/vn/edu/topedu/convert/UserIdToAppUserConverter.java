package vn.edu.topedu.convert;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import vn.edu.topedu.dao.AppUserDAO;
import vn.edu.topedu.entity.AppUser;

@Component
public class UserIdToAppUserConverter implements Converter<String, AppUser> {
	private AppUserDAO courseDAO;

	public UserIdToAppUserConverter(AppUserDAO courseDAO) {
		this.courseDAO = courseDAO;
	}

	@Override
	public AppUser convert(String source) {
		//System.err.println("courseDAO" + courseDAO);
		return courseDAO.findById(Long.valueOf(source));
	}

}
