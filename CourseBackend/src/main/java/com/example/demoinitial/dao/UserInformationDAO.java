package com.example.demoinitial.dao;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import com.example.demoinitial.entity.UserInformation;

@Repository
@Transactional
public class UserInformationDAO {
	@Autowired
    private EntityManager entityManager;
	
 
    public UserInformation findUserInformation(Long id) {
    	
        try {
        	
            String sql = "Select ui from " + UserInformation.class.getName() + " ui " //
                    + " Where ui.appUser.userId = :user_id ";
 
            Query query = entityManager.createQuery(sql, UserInformation.class);
            query.setParameter("user_id", id);
 
            return (UserInformation) query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
}
