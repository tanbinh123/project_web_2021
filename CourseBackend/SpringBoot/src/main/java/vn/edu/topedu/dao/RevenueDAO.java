package vn.edu.topedu.dao;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vn.edu.topedu.dto.RevenueMonth;
import vn.edu.topedu.dto.RevenueYear;
import vn.edu.topedu.entity.NotificationEntity;
import vn.edu.topedu.entity.OwerCourse;
import vn.edu.topedu.entity.Revenue;
import vn.edu.topedu.entity.course.BaseCourse;
import vn.edu.topedu.utils.WebUtils;

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

	public List<Revenue> getAll(int year, int month) {

		String sql = "Select e from " + Revenue.class.getName() + " e " //
				+ " where e.deleted = false and (e.year - :year) < 1 and  (e.month - :month) < 6  ";

		Query query = this.entityManager.createQuery(sql, Revenue.class);
		query.setParameter("year", year);
		query.setParameter("month", month);
		return query.getResultList();

	}

	public List<Revenue> getAll(int year, int month, int day) {

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

	public List<Revenue> getEntitys(int deleted) {
		String sql = "Select e from " + Revenue.class.getName() + " e " //
				+ " where e.deleted = :deleted ";

		Query query = this.entityManager.createQuery(sql, Revenue.class);
		query.setParameter("deleted", deleted == 1);
		return query.getResultList();

	}

	public List<Revenue> getData(int _page, int _limit, String sort, String _search, int day, int month, int year)
			throws NoResultException {
		--_page;
		if (_page < 0)
			_page = 0;
		if (sort == "" || sort == null)
			sort = "id:asc";

		String sql = "Select c from " + Revenue.class.getName() + " c where  c.deleted=0 ";
		if (_search.length() != 0) {

			//sql += " and ((c.name like CONCAT('%',:search,'%')) or (c.content like CONCAT('%',:search,'%')) ) ";

		}
		if (year != -1)
			sql += " and c.year = :year ";
		if (month != -1)
			sql += " and c.month = :month ";
		if (day != -1)
			sql += " and c.day = :day ";

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
		Query query = this.entityManager.createQuery(sql, Revenue.class);
		if (month != -1)
			query.setParameter("month", month);
		if (year != -1)
			query.setParameter("year", year);
		if (day != -1)
			query.setParameter("day", day);
		query.setFirstResult(_page * _limit);
		if (_search.length() != 0) {
			query.setParameter("search", _search);
		}
		if (_limit != -1) {
			query.setMaxResults(_limit);
		}
		return query.getResultList();
	}

	public Long countData(int day, int month, int year, String _search) throws NoResultException {

		String sql = "Select count(*)  from " + Revenue.class.getName() + " c where  c.deleted=0 ";
		if (_search.length() != 0) {

			//sql += " and ((c.name like CONCAT('%',:search,'%')) or (c.content like CONCAT('%',:search,'%')) ) ";

		}
		if (year != -1)
			sql += " and c.year = :year ";
		if (month != -1)
			sql += " and c.month = :month ";
		if (day != -1)
			sql += " and c.day = :day ";
		//sql += " group by c.id   ";

		System.out.println(sql);
		Query query = this.entityManager.createQuery(sql);
		if (month != -1)
			query.setParameter("month", month);
		if (year != -1)
			query.setParameter("year", year);
		if (day != -1)
			query.setParameter("day", day);
		if (_search.length() != 0) {
			query.setParameter("search", _search);
		}

		return (Long) query.getSingleResult();
	}
	
	public List<Revenue> getRevenue10Day(int day, int month, int year)
			throws NoResultException {
		

		String sql = "Select c from " + Revenue.class.getName() + " c where  c.deleted=0 ";
		sql += " and c.year = :year ";
		sql += " and c.month = :month ";
		sql += " and c.day = :day ";
		sql += " group by c.id  order by c.createAt asc ";
		
		System.out.println(sql);
		Query query = this.entityManager.createQuery(sql, Revenue.class);
		if (month != -1)
			query.setParameter("month", month);
		if (year != -1)
			query.setParameter("year", year);
		if (day != -1)
			query.setParameter("day", day);
		
		query.setMaxResults(10);
		return query.getResultList();
	}
	
	public List<Revenue> getRevenueDay(int max)
			throws NoResultException {
		
		Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE, -max);
        Date before = cal.getTime();    
        Date now = new Date();
		String sql = "Select c from " + Revenue.class.getName() + " c where  c.deleted=0 ";
		sql += " and c.createAt >= :before ";
		sql += " and c.createAt <= :now ";
		
		sql += " group by c.id  order by c.createAt asc ";
		
		System.out.println(sql);
		Query query = this.entityManager.createQuery(sql, Revenue.class);
		query.setParameter("now", now);
		query.setParameter("before", before);
		
		query.setMaxResults(max);
		return query.getResultList();
	}
	public List<RevenueMonth> getRevenueMonth(int max)
			throws NoResultException {
		Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MONTH, -max);
        Date before = cal.getTime();    
        Date now = new Date();

		String sql = "Select new vn.edu.topedu.dto.RevenueMonth(c.year,c.month,sum(c.money),sum(c.courseSell),sum(c.courseUpload),sum(c.newMember)) from " + Revenue.class.getName() + " c where  c.deleted=0 ";
		sql += " and c.createAt >= :before ";
		sql += " and c.createAt <= :now ";
		
		sql += " group by c.year, c.month  order by c.createAt asc ";
		
		System.out.println(sql);
		Query query = this.entityManager.createQuery(sql, RevenueMonth.class);
		query.setParameter("now", now);
		query.setParameter("before", before);
		
		query.setMaxResults(max);
		return query.getResultList();
	}
	public List<RevenueYear> getRevenueYear( int max)
			throws NoResultException {
		
		Calendar cal = Calendar.getInstance();
        cal.add(Calendar.YEAR, -max);
        Date before = cal.getTime();    
        Date now = new Date();
		String sql = "Select new vn.edu.topedu.dto.RevenueYear(c.year,sum(c.money),sum(c.courseSell),sum(c.courseUpload),sum(c.newMember)) from " + Revenue.class.getName() + " c where  c.deleted=0 ";
		sql += " and c.createAt >= :before ";
		sql += " and c.createAt <= :now ";
		
		sql += " group by c.year  order by c.createAt asc ";
		
		System.out.println(sql);
		Query query = this.entityManager.createQuery(sql, RevenueYear.class);
		query.setParameter("now", now);
		query.setParameter("before", before);
		
		query.setMaxResults(max);
		return query.getResultList();
	}
}
