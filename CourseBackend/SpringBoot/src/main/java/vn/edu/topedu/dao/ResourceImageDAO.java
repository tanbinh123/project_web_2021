package vn.edu.topedu.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.edu.topedu.entity.ActiveAccount;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.CategoryEntity;
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

	public List<ResourceImage> getResourceImages(Long userId) {

		String sql = "Select e from "+ResourceImage.class.getName()+" e " + " where e.deleted=false and e.appUser.id =:userId ";
		
		Query query = this.entityManager.createQuery(sql, ResourceImage.class);
		 query.setParameter("userId", userId);
		return query.getResultList();

	}

}
