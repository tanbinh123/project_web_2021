package vn.edu.topedu.dao;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.edu.topedu.entity.AppRole;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.UserRole;

@Repository
@Transactional
public class AppUserDAO {

	@Autowired
	private EntityManager entityManager;

	public AppUser findById(Long id) {
		return this.entityManager.find(AppUser.class, id);
	}
	
	public AppRole findRoleByRoleName(String roleName) {
		try {
			String sql = "Select e from " + AppRole.class.getName() + " e " //
					+ " Where e.roleName = :roleName ";

			Query query = entityManager.createQuery(sql, AppRole.class);
			query.setParameter("roleName", roleName);

			return (AppRole) query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
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
	public AppUser findUserByEmail(String email) {
		try {
			String sql = "Select e from " + AppUser.class.getName() + " e " //
					+ " Where e.email = :email ";
			
			Query query = entityManager.createQuery(sql, AppUser.class);
			query.setParameter("email", email);
			
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
//	public boolean insertUser(AppUser person) {
//
//		int rs = entityManager
//				.createNativeQuery("INSERT INTO app_user ( user_name, Encryted_Password,email) VALUES (?,?,?)")
//				.setParameter(1, person.getUserName()).setParameter(2, person.getEncrytedPassword())
//				.setParameter(3, person.getEmail()).executeUpdate();
//		// System.out.println(rs);
//		if (rs == 1)
//			return true;
//		return false;
//	}

	public AppUser insertUser(AppUser user) {
		
		try {
			entityManager.persist(user);
			entityManager.flush();
			return user;
		} catch (Exception e) {
			//System.out.println(e.getMessage());
			System.out.println("Không insert user");
			return null;
		}
		
		
	}
	public UserRole putUserRole(UserRole user) {
		
		if(user.getId()==null) {
			try {
				entityManager.persist(user);
				entityManager.flush();
				return user;
			} catch (Exception e) {
//				System.out.println(e.getMessage());
//				System.out.println("Insert UserRole");
				return null;
			}
			
		}else {
			try {
				return entityManager.merge(user);
			} catch (Exception e) {
//				System.out.println(e.getMessage());
//				System.out.println("Insert UserRole");
				return null;
			}
		}
	}
	public AppUser updateAppUser(AppUser user) {
		
		try {
			return entityManager.merge(user);
		} catch (Exception e) {
//			System.out.println(e.getMessage());
			System.out.println("AppUserDAO: Can't update user");
			return null;
		}
	}
	public boolean updateUser(AppUser user) {
		
		
		try {
			entityManager.merge(user);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return false;
		
		
	}

}