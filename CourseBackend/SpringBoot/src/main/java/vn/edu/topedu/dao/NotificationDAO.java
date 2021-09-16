package vn.edu.topedu.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vn.edu.topedu.entity.CategoryEntity;
import vn.edu.topedu.entity.EvaluateEntity;
import vn.edu.topedu.entity.NotificationEntity;
import vn.edu.topedu.entity.Payment;
import vn.edu.topedu.entity.course.Course;
import vn.edu.topedu.entity.course.full.Part;
import vn.edu.topedu.utils.WebUtils;
@Transactional
@Repository
public class NotificationDAO {
	@Autowired
	EntityManager entityManager;
	@SuppressWarnings("unchecked")
	public List<NotificationEntity> getEntitys(int actived) {

		String sql = "Select c from "+NotificationEntity.class.getName()+" c " + " where c.deleted=false ";
		if (actived < 2 && actived > -1) {
			sql += String.format("and c.actived = %d ", actived);
		}
		Query query = this.entityManager.createQuery(sql, NotificationEntity.class);
		
		return query.getResultList();

	}
	
	
	public List<NotificationEntity> getData(Long userId, int _page, int _limit, String sort, String _search) throws NoResultException {
		--_page;
		if(_page<0)_page=0;
		if (sort == "" || sort == null)
			sort = "id:asc";

		String sql = "Select c from " + NotificationEntity.class.getName() + " c where ( userId=:userId or userId is null )  and c.deleted=0 ";
		if (_search.length() != 0) {
					
			sql += " and ((c.name like CONCAT('%',:search,'%')) or (c.content like CONCAT('%',:search,'%')) ) ";

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
		Query query = this.entityManager.createQuery(sql, NotificationEntity.class);
		query.setParameter("userId", userId);
		query.setFirstResult(_page * _limit);
		if (_search.length() != 0) {
			query.setParameter("search", _search);
		}
		if (_limit != -1) {
			query.setMaxResults(_limit);
		}
		return query.getResultList();
	}
	
	public Long countData(Long userId, String _search) throws NoResultException {
		

		String sql = "Select count(*)  from " + NotificationEntity.class.getName() + " c where ( userId=:userId or userId is null )  and c.deleted=0 ";
		if (_search.length() != 0) {
					
			sql += " and ((c.name like CONCAT('%',:search,'%')) or (c.content like CONCAT('%',:search,'%')) ) ";

		}
		
		sql += " group by c.id   ";
		
		System.out.println(sql);
		Query query = this.entityManager.createQuery(sql);
		query.setParameter("userId", userId);
		
		if (_search.length() != 0) {
			query.setParameter("search", _search);
		}
		
		return (Long) query.getSingleResult();
	}
	
	
	
	public List<NotificationEntity> getData( int _page, int _limit, String sort, String _search) throws NoResultException {
		--_page;
		if(_page<0)_page=0;
		if (sort == "" || sort == null)
			sort = "id:asc";

		String sql = "Select c from " + NotificationEntity.class.getName() + " c where  c.deleted=0 ";
		if (_search.length() != 0) {
					
			sql += " and ((c.name like CONCAT('%',:search,'%')) or (c.content like CONCAT('%',:search,'%')) ) ";

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
		Query query = this.entityManager.createQuery(sql, NotificationEntity.class);
		
		query.setFirstResult(_page * _limit);
		if (_search.length() != 0) {
			query.setParameter("search", _search);
		}
		if (_limit != -1) {
			query.setMaxResults(_limit);
		}
		return query.getResultList();
	}
	
	public Long countData( String _search) throws NoResultException {
		

		String sql = "Select count(*)  from " + NotificationEntity.class.getName() + " c where  c.deleted=0 ";
		if (_search.length() != 0) {
					
			sql += " and ((c.name like CONCAT('%',:search,'%')) or (c.content like CONCAT('%',:search,'%')) ) ";

		}
		
		sql += " group by c.id   ";
		
		System.out.println(sql);
		Query query = this.entityManager.createQuery(sql);
		
		
		if (_search.length() != 0) {
			query.setParameter("search", _search);
		}
		
		return (Long) query.getSingleResult();
	}
	public NotificationEntity insertEntity(NotificationEntity rrp) {
		try {
			entityManager.persist(rrp);
			entityManager.flush();
			return rrp;
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return null;
	}
	
	@Transactional
	public NotificationEntity mergePart(NotificationEntity p) {
		entityManager.merge(p);
		entityManager.flush();
		return  p;
	}
	
	public NotificationEntity getEntity(Long id) {
		try {
			
			String sql = "Select c from " + NotificationEntity.class.getName() + " c " //
					+ " where  c.id= :id ";
			Query query = this.entityManager.createQuery(sql, NotificationEntity.class);
			query.setParameter("id", id);
			return (NotificationEntity) query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}
	

}
