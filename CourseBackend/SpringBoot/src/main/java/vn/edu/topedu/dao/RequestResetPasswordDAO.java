package vn.edu.topedu.dao;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.edu.topedu.entity.Course;
import vn.edu.topedu.entity.RequestResetPassword;

@Repository
@Transactional
public class RequestResetPasswordDAO {
	
	@Autowired
	private EntityManager entityManager;
	public RequestResetPassword getCourse(Long userId) {
		
		try {
		
			String sql = "Select rrp from " + RequestResetPassword.class.getName() + " rrp " //
					+ " where rrp.appUser.userId= :userId group by rrp.time order by rrp.time desc ";
			Query query = this.entityManager.createQuery(sql, RequestResetPassword.class);
			query.setParameter("userId", userId);
			
			query.setFirstResult(0); 
			query.setMaxResults(1);
			return (RequestResetPassword) query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
		
	}
	public RequestResetPassword getCourse(String userName) {
		
		try {
			
			String sql = "Select rrp from " + RequestResetPassword.class.getName() + " rrp " //
					+ " where rrp.appUser.userName= :userName group by rrp.time order by rrp.time desc ";
			Query query = this.entityManager.createQuery(sql, RequestResetPassword.class);
			query.setParameter("userName", userName);
			
			query.setFirstResult(0); 
			query.setMaxResults(1);
			return (RequestResetPassword) query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
		
	}
	public int insert(RequestResetPassword rrp) {
		try {
			entityManager.persist(rrp);
			entityManager.flush();
			return rrp.getId();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return 0;
	}


}
