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
	
	public RequestResetPassword getNewCode(String userName) {
		
		try {
			
			String sql = "Select rrp from " + RequestResetPassword.class.getName() + " rrp " //
					+ " where rrp.appUser.userName= :userName and TIMESTAMPDIFF(MINUTE, rrp.time,UTC_TIMESTAMP) < 20 and rrp.alive = true group by rrp.time order by rrp.time desc ";
			Query query = this.entityManager.createQuery(sql, RequestResetPassword.class);
			query.setParameter("userName", userName);
			
			query.setFirstResult(0); 
			query.setMaxResults(1);
			return (RequestResetPassword) query.getSingleResult();
		} catch (NoResultException e) {
			System.out.println(e.getMessage());
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
	public RequestResetPassword merge(RequestResetPassword rrp) {
		try {
			rrp = entityManager.merge(rrp);
			return rrp;
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		
	}


}
