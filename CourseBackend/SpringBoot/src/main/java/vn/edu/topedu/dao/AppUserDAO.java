package vn.edu.topedu.dao;

import java.util.Arrays;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.edu.topedu.entity.AppRole;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.EvaluateEntity;
import vn.edu.topedu.entity.UserRole;
import vn.edu.topedu.entity.course.Course;
import vn.edu.topedu.utils.WebUtils;

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
	public AppRole findRoleById(Long roleId) {
		try {
			String sql = "Select e from " + AppRole.class.getName() + " e " //
					+ " Where e.id = :roleId ";

			Query query = entityManager.createQuery(sql, AppRole.class);
			query.setParameter("roleId", roleId);

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
	@Transactional
	public boolean register(AppUser user, AppRole appRole) {

		try {
			user = insertUser(user);
			UserRole userRole = new UserRole();
			userRole.setAppUser(user);
			userRole.setAppRole(appRole);
			user.setUserRoles(Arrays.asList(userRole));
			userRole = putUserRole(userRole);

			return true;
		} catch (Exception e) {
			// System.out.println(e.getMessage());
			System.out.println("Không insert user");
			return false;
		}

	}

	public AppUser insertUser(AppUser user) {

		try {
			entityManager.persist(user);
			entityManager.flush();
			return user;
		} catch (Exception e) {
			// System.out.println(e.getMessage());
			// System.out.println("Không insert user");
			return null;
		}

	}

	public UserRole putUserRole(UserRole user) {

		if (user.getId() == null) {
			try {
				entityManager.persist(user);
				entityManager.flush();
				return user;
			} catch (Exception e) {
//				System.out.println(e.getMessage());
//				System.out.println("Insert UserRole");
				return null;
			}

		} else {
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
			System.err.println(e.getMessage());
		}

		return false;

	}

	public List<Course> getCourseFromAccountPost(Long userId) {
		String sql = "Select c from " + Course.class.getName() + " c " //
				+ " where c.appUser.id = :userId ";

		Query query = this.entityManager.createQuery(sql, Course.class);
		query.setParameter("userId", userId);
		return query.getResultList();
	}
	
	
	public List<AppUser> getAppUsers( int _page, int _limit, String sort, String _search) throws NoResultException {
		--_page;
		if(_page<0)_page=0;
		if (sort == "" || sort == null)
			sort = "id:asc";

		String sql = "Select c from " + AppUser.class.getName() + " c where  c.deleted=0 ";
		if (_search!=null &&_search.length() != 0) {
					
			sql += " and ((c.userName like CONCAT('%',:search,'%')) or (c.fullname like CONCAT('%',:search,'%')) ) ";

		}
		
		sql += " group by c.id  order by  ";
		String sqlSort = "";
		sort = sort.toLowerCase();

		String[] a = sort.split(",");
		boolean started = true;
		for (String str : a) {
			int index = str.indexOf(':');
			String _order = str.substring(index + 1);
			String tmpSort = str.substring(0, index);
			switch (tmpSort) {
			case "id":
				sqlSort += WebUtils.sort(_order, "c.id", started);
				break;
			
			
			
			case "updateat":
				sqlSort += WebUtils.sort(_order, "c.updateAt", started);
				break;
			default:
				break;
			}
			started = false;
			sql += sqlSort;
			sqlSort = "";
		}
		System.out.println(sql);
		Query query = this.entityManager.createQuery(sql, AppUser.class);
		query.setFirstResult(_page * _limit);
		if (_search!=null &&_search.length() != 0) {
			query.setParameter("search", _search);
		}
		if (_limit != -1) {
			query.setMaxResults(_limit);
		}
		return query.getResultList();
	}
	
	public Long countAppUser(String _search) throws NoResultException {
		

		String sql = "Select count(c.id)  from " + AppUser.class.getName() + " c where  c.deleted=false ";
		if (_search!=null && _search.length() != 0) {
			sql += " and ((c.userName like CONCAT('%',:search,'%')) or (c.fullname like CONCAT('%',:search,'%')) ) ";		

		}
		
		//sql += " group by c.id   ";
		
		System.out.println(sql);
		Query query = this.entityManager.createQuery(sql);
		
		if (_search!=null &&  _search.length() != 0) {
			query.setParameter("search", _search);
		}
		
		return (Long) query.getSingleResult();
	}
	
	
	public List<AppRole> getAppRoles( int _page, int _limit, String sort, String _search) throws NoResultException {
		--_page;
		if(_page<0)_page=0;
		if (sort == "" || sort == null)
			sort = "id:asc";

		String sql = "Select c from " + AppRole.class.getName() + " c where  c.deleted=0 ";
		if (_search!=null &&_search.length() != 0) {
					
			//sql += " and ((c.userName like CONCAT('%',:search,'%')) or (c.fullname like CONCAT('%',:search,'%')) ) ";

		}
		
		sql += " group by c.id  order by  ";
		String sqlSort = "";
		sort = sort.toLowerCase();

		String[] a = sort.split(",");
		boolean started = true;
		for (String str : a) {
			int index = str.indexOf(':');
			String _order = str.substring(index + 1);
			String tmpSort = str.substring(0, index);
			switch (tmpSort) {
			case "id":
				sqlSort += WebUtils.sort(_order, "c.id", started);
				break;
			
			
			
			case "updateat":
				sqlSort += WebUtils.sort(_order, "c.updateAt", started);
				break;
			default:
				break;
			}
			started = false;
			sql += sqlSort;
			sqlSort = "";
		}
		System.out.println(sql);
		Query query = this.entityManager.createQuery(sql, AppRole.class);
		query.setFirstResult(_page * _limit);
		if (_search!=null &&_search.length() != 0) {
			query.setParameter("search", _search);
		}
		if (_limit != -1) {
			query.setMaxResults(_limit);
		}
		return query.getResultList();
	}
	
	public Long countAppRole(String _search) throws NoResultException {
		

		String sql = "Select count(c.id)  from " + AppRole.class.getName() + " c where  c.deleted=false ";
		if (_search!=null && _search.length() != 0) {
			//sql += " and ((c.userName like CONCAT('%',:search,'%')) or (c.fullname like CONCAT('%',:search,'%')) ) ";		

		}
		
		//sql += " group by c.id   ";
		
		System.out.println(sql);
		Query query = this.entityManager.createQuery(sql);
		
		if (_search!=null &&  _search.length() != 0) {
			query.setParameter("search", _search);
		}
		
		return (Long) query.getSingleResult();
	}



}