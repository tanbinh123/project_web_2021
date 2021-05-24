package vn.edu.topedu.dao;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vn.edu.topedu.entity.CategoryEntity;
@Transactional
@Repository
public class CatogoryDAO {
	@Autowired
	EntityManager entityManager;
	@SuppressWarnings("unchecked")
	public List<CategoryEntity> getCategories(int actived) {

		String sql = "Select c from CategoryEntity c " + " where c.deleted=false ";
		if (actived < 2 && actived > -1) {
			sql += String.format("and c.actived = %d ", actived);
		}
		Query query = this.entityManager.createQuery(sql, CategoryEntity.class);
		
		return query.getResultList();

	}
	
	public BigDecimal getToltalDuration(int actived) {
		String sql = "Select SUM(c.durationLearned) from CategoryEntity c " + " where c.deleted=false ";
		if (actived < 2 && actived > -1) {
			sql += String.format("and c.actived = %d ", actived);
		}
		Query query = this.entityManager.createQuery(sql, BigDecimal.class);
		
		return (BigDecimal) query.getSingleResult();
	}
	public Long getToltalCourse(int actived) {
		String sql = "Select SUM(c.total) from CategoryEntity c " + " where c.deleted=false ";
		if (actived < 2 && actived > -1) {
			sql += String.format("and c.actived = %d ", actived);
		}
		Query query = this.entityManager.createQuery(sql, Long.class);
		
		return (Long) query.getSingleResult();
	}
	
	public BigDecimal getToltalMoney(int actived) {
		String sql = "Select SUM(c.totalMoney) from CategoryEntity c " + " where c.deleted=false ";
		if (actived < 2 && actived > -1) {
			sql += String.format("and c.actived = %d ", actived);
		}
		Query query = this.entityManager.createQuery(sql, BigDecimal.class);
		
		return (BigDecimal) query.getSingleResult();
	}

}
