package vn.edu.topedu.dao;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.Test;

@Repository
@Transactional
public class TestDAO {
	
	@Autowired
	private EntityManager entityManager;
	@Transactional
	public void insertTest(Test user) {

		
		
		entityManager.persist(user);
		

	}
	public Test findById(Long id) {
		return this.entityManager.find(Test.class, id);
	}

}
