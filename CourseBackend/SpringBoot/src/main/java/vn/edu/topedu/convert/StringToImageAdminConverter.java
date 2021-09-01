package vn.edu.topedu.convert;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import vn.edu.topedu.dao.ImageAdminDAO;
import vn.edu.topedu.entity.ImageAdminEntity;

@Component
public class StringToImageAdminConverter implements Converter<String, ImageAdminEntity> {
	private ImageAdminDAO courseDAO;

	public StringToImageAdminConverter(ImageAdminDAO courseDAO) {
		this.courseDAO = courseDAO;
	}

	@Override
	public ImageAdminEntity convert(String source) {
		System.err.println("ImageAdminEntity: Id" + source);
		return courseDAO.getEntity(Long.valueOf(source));
	}

}
