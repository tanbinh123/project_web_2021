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
import vn.edu.topedu.entity.ImageAdminEntity;
import vn.edu.topedu.entity.NotificationEntity;
import vn.edu.topedu.entity.Payment;
import vn.edu.topedu.utils.WebUtils;
@Transactional
@Repository
public class ImageAdminDAO {
	@Autowired
	EntityManager entityManager;
	@SuppressWarnings("unchecked")
	public List<ImageAdminEntity> getEntitys(int actived) {

		String sql = "Select c from "+ImageAdminEntity.class.getName()+" c " + " where c.deleted=false ";
		if (actived < 2 && actived > -1) {
			sql += String.format("and c.actived = %d ", actived);
		}
		Query query = this.entityManager.createQuery(sql, ImageAdminEntity.class);
		
		return query.getResultList();

	}
	
	public ImageAdminEntity getEntity(Long id) {

		String sql = "Select c from "+ImageAdminEntity.class.getName()+" c " + " where c.id= :id ";
		try {
			Query query = this.entityManager.createQuery(sql, ImageAdminEntity.class);
			query.setParameter("id", id);
			return (ImageAdminEntity) query.getSingleResult();
			
		} catch (Exception e) {
			System.err.println(e.getMessage());
			return null;
		}
		

	}
	
	public ImageAdminEntity getEntity(String name) {

		String sql = "Select c from "+ImageAdminEntity.class.getName()+" c " + " where c.name= :name ";
		try {
			Query query = this.entityManager.createQuery(sql, ImageAdminEntity.class);
			query.setParameter("name", name);
			return (ImageAdminEntity) query.getSingleResult();
			
		} catch (Exception e) {
			System.err.println(e.getMessage());
			return null;
		}
		

	}
	
	
	public List<ImageAdminEntity> getData(Long userId, int _page, int _limit, String sort, String _search) throws NoResultException {
		--_page;
		if(_page<0)_page=0;
		if (sort == "" || sort == null)
			sort = "id:asc";

		String sql = "Select c from " + ImageAdminEntity.class.getName() + " c where userId=:userId and c.deleted=0 ";
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
		Query query = this.entityManager.createQuery(sql, ImageAdminEntity.class);
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
		

		String sql = "Select count(*)  from " + ImageAdminEntity.class.getName() + " c where userId=:userId and c.deleted=0 ";
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

	
	public ImageAdminEntity merge(ImageAdminEntity payment) {
		return this.entityManager.merge(payment);
	}
	
	public int deleteAllImageAdminDeleted() {
		int rs = entityManager.createNativeQuery("Delete from image_admin where deleted=1 ").executeUpdate();
		return rs;
		
	}
	
	public ImageAdminEntity insert(ImageAdminEntity rrp) {
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
