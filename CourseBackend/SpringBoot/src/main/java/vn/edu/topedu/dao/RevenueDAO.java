package vn.edu.topedu.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vn.edu.topedu.entity.OwerCourse;
import vn.edu.topedu.entity.Revenue;
import vn.edu.topedu.entity.course.Course;

@Repository
@Transactional
public class RevenueDAO {
	@Autowired
	EntityManager entityManager;

	public List<Revenue> getAll(int year/* , int month */) {

		String sql = "Select e from " + Revenue.class.getName() + " e " //
				+ " where e.deleted = false and e.year = :year ";

		Query query = this.entityManager.createQuery(sql, Revenue.class);
		query.setParameter("year", year);
		return query.getResultList();

	}
	
	public List<Revenue> getAll(int year , int month ) {

		String sql = "Select e from " + Revenue.class.getName() + " e " //
				+ " where e.deleted = false and (e.year - :year) < 1 and  (e.month - :month) < 6  ";

		Query query = this.entityManager.createQuery(sql, Revenue.class);
		query.setParameter("year", year);
		query.setParameter("month", month);
		return query.getResultList();

	}

	public List<Revenue> getAll() {

		String sql = "Select e from " + Revenue.class.getName() + " e " //
				+ " where e.deleted = false ";

		Query query = this.entityManager.createQuery(sql, Revenue.class);
		return query.getResultList();

	}
}
