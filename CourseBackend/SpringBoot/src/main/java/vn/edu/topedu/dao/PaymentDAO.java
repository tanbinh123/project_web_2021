package vn.edu.topedu.dao;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.edu.topedu.entity.ActiveAccount;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.Course;
import vn.edu.topedu.entity.Payment;
import vn.edu.topedu.entity.RequestResetPassword;

@Repository
@Transactional
public class PaymentDAO {
	
	@Autowired
	private EntityManager entityManager;
	
	public Payment findById(Long id) {
		return this.entityManager.find(Payment.class, id);
	}
	public Payment merge(Payment payment) {
		return this.entityManager.merge(payment);
	}
	public Payment insert(Payment rrp) {
		try {
			entityManager.persist(rrp);
			entityManager.flush();
			return rrp;
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return null;
	}


}
