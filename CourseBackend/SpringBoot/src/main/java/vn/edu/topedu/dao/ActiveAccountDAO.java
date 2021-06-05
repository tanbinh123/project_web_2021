package vn.edu.topedu.dao;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.edu.topedu.entity.ActiveAccount;
import vn.edu.topedu.entity.RequestResetPassword;
import vn.edu.topedu.entity.course.Course;

@Repository
@Transactional
public class ActiveAccountDAO {
	
	@Autowired
	private EntityManager entityManager;
	
	public ActiveAccount getNewCode(String userName) {
		
		try {
			
			String sql = "Select rrp from " + ActiveAccount.class.getName() + " rrp " //
					+ " where rrp.alive=true and rrp.appUser.userName= :userName and TIMESTAMPDIFF(MINUTE, rrp.createTime,UTC_TIMESTAMP) < 10 group by rrp.createTime order by rrp.createTime desc ";
			Query query = this.entityManager.createQuery(sql, ActiveAccount.class);
			query.setParameter("userName", userName);
			
			query.setFirstResult(0); 
			query.setMaxResults(1);
			return (ActiveAccount) query.getSingleResult();
		} catch (NoResultException e) {
			System.out.println(e.getMessage());
			return null;
		}
		
	}
	public ActiveAccount insert(ActiveAccount rrp) {
		try {
			entityManager.persist(rrp);
			entityManager.flush();
			return rrp;
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return null;
	}
	
	public ActiveAccount merge(ActiveAccount activeAccount) {
		try {
			activeAccount = entityManager.merge(activeAccount);
			return activeAccount;
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		
	}


}
