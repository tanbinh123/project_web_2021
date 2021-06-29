package vn.edu.topedu.convert;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import vn.edu.topedu.dao.AppUserDAO;
import vn.edu.topedu.entity.AppRole;
import vn.edu.topedu.entity.AppUser;

@Component
public class RoleIdToAppRoleConverter implements Converter<String, AppRole> {
	private AppUserDAO courseDAO;

	public RoleIdToAppRoleConverter(AppUserDAO courseDAO) {
		this.courseDAO = courseDAO;
	}

	@Override
	public AppRole convert(String source) {
		//System.err.println("courseDAO" + courseDAO);
		return courseDAO.findRoleById(Long.valueOf(source));
	}

}
