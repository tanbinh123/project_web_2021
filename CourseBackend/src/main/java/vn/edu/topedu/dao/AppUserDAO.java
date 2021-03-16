package vn.edu.topedu.dao;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.edu.topedu.entity.AppUser;

@Repository
@Transactional
public class AppUserDAO {

	@Autowired
	private EntityManager entityManager;
	
	  public AppUser findById(Long id) { 
	        return this.entityManager.find(AppUser.class, id);
	    }
	 

	public AppUser findUserAccount(String userName) {
		try {
			String sql = "Select e from " + AppUser.class.getName() + " e " //
					+ " Where e.userName = :userName ";

			Query query = entityManager.createQuery(sql, AppUser.class);
			query.setParameter("userName", userName);

			return (AppUser) query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

//    public boolean insertUser(AppUser person) {
//        
//        
//        int rs=entityManager.createNativeQuery("INSERT INTO app_user ( user_name, Encryted_Password,email) VALUES (?,?,?)")
//        .setParameter(1, person.getUserName())
//        .setParameter(2, person.getEncrytedPassword())
//        .setParameter(3, person.getEmail())
//        .executeUpdate();
//        if(rs==1)return true; return false;
//    }
    public boolean insertUser(AppUser person) {
    	
    	
    	int rs=entityManager.createNativeQuery("INSERT INTO app_user ( user_name, Encryted_Password,email) VALUES (?,?,?)")
    			.setParameter(1, person.getUserName())
    			.setParameter(2, person.getEncrytedPassword())
    			.setParameter(3, person.getEmail())
    			.executeUpdate();
    	//System.out.println(rs);
    	if(rs==1)return true; return false;
    }
	
//	public void insertUser(AppUser user) {
//
//		
//		
//		entityManager.persist(user);
//		
//
//	}

}