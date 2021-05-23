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
	public List<ResourceImage> getResourceImages(int _limit,int _page) {
		_page--;
		String sql = "Select e from "+ResourceImage.class.getName()+" e " + " where e.deleted=false ";
		Query query = this.entityManager.createQuery(sql, ResourceImage.class);
		query.setFirstResult(_page * _limit);
		if (_limit != -1) {
			query.setMaxResults(_limit);
		}
		
		return query.getResultList();
	}
	public long getCountResourceImages() {
		String sql = "Select count(e.id) from "+ResourceImage.class.getName()+" e " + " where e.deleted=false ";
		Query query = this.entityManager.createQuery(sql, Long.class);
		return (long) query.getSingleResult();
	}
	public List<ResourceImage> getResourceImages(String  userName) {
		String sql = "Select e from "+ResourceImage.class.getName()+" e " + " where e.deleted=false and e.appUser.userName =:userName ";
		Query query = this.entityManager.createQuery(sql, ResourceImage.class);
		 query.setParameter("userName", userName);
		return query.getResultList();
	}
	
	public ResourceImage save(ResourceImage image) {
		if(image.getId()!=null) {
			return entityManager.merge(image);
		}else {
			entityManager.persist(image);
			entityManager.flush();
			return image;
		}
	}

	public ResourceImage deleteImage(long id) {
		ResourceImage deleted = findById(id);
		deleted.setDeleted(true);
		entityManager.merge(deleted);
		entityManager.flush();
		return deleted;
		
	}

}
