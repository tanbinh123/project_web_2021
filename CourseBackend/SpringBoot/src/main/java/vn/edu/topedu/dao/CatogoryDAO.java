package vn.edu.topedu.dao;

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
	public List<CategoryEntity> getCategories(int actived) {

		String sql = "Select c from CategoryEntity c " + " where c.deleted=false ";
		if (actived < 2 && actived > -1) {
			sql += String.format("and c.actived = %d ", actived);
		}
		Query query = this.entityManager.createQuery(sql, CategoryEntity.class);
		// query.setParameter("id", idCourse);
		return query.getResultList();

	}

}
