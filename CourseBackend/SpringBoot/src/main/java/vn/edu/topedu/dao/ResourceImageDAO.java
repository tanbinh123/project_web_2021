package vn.edu.topedu.dao;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.edu.topedu.entity.ActiveAccount;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.Payment;
import vn.edu.topedu.entity.RequestResetPassword;
import vn.edu.topedu.entity.ResourceImage;
import vn.edu.topedu.entity.course.Course;

@Repository
@Transactional
public class ResourceImageDAO {
	
	@Autowired
	private EntityManager entityManager;
	
	public ResourceImage findById(Long id) {
		return this.entityManager.find(ResourceImage.class, id);
	}
	

}
