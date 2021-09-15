package vn.edu.topedu.dao;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.edu.topedu.entity.ActiveAccount;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.Payment;
import vn.edu.topedu.entity.RequestResetPassword;
import vn.edu.topedu.entity.course.BaseCourse;
import vn.edu.topedu.utils.WebUtils;

@Repository
@Transactional
public class PaymentDAO {
	
	@Autowired
	private EntityManager entityManager;
	
	public Payment findById(Long id) {
		return this.entityManager.find(Payment.class, id);
	}
	public Payment merge(Payment payment) {
		return this.entityManager.merge(payment);
	}
	public Payment insert(Payment rrp) {
		try {
			entityManager.persist(rrp);
			entityManager.flush();
			return rrp;
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return null;
	}
	
	public List<Payment> getListEntitys(int _page, int _limit, String sort, String _search, BigDecimal price_gte, BigDecimal price_lt) {
		--_page;
		if(_page<0)_page=0;
		if (sort == "" || sort == null)
			sort = "id:asc";

		String sql = null;
		if (_search.length() == 0) {
			sql = "Select c from " + Payment.class.getName() + " c " //
					+ " where c.deleted=0 ";
		} else {
			sql = "Select c from " + Payment.class.getName() + " c " //
					+ " where c.deleted=0 and ((c.title like CONCAT('%',:search,'%')) or (c.description like CONCAT('%',:search,'%')) ) ";

		}
		
		
		if (!price_gte.equals(BigDecimal.valueOf(-1)))
			sql += String.format(" and c.price >= %s ", price_gte.toString());
		if (!price_lt.equals(BigDecimal.valueOf(-1)))
			sql += String.format(" and c.price < %s ", price_lt.toString());
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
			
			case "price":
				sqlSort += WebUtils.sort(_order, "c.price", started);
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
		Query query = this.entityManager.createQuery(sql, Payment.class);
		query.setFirstResult(_page * _limit);
		if (_search.length() != 0) {
			query.setParameter("search", _search);
		}
		if (_limit != -1) {
			query.setMaxResults(_limit);
		}
		return query.getResultList();
	}

	public long getCount(String _search,BigDecimal price_gte, BigDecimal price_lt) {
		String sql = null;
		if (_search == null || _search.length() == 0) {
			sql = "Select count(*) from " + Payment.class.getName() + " c " //
					+ " where c.deleted=0 ";

		} else {
			sql = "Select count(*) from " + Payment.class.getName() + " c " //
					+ " where c.deleted=0 and ((c.title like CONCAT('%',:search,'%')) or (c.description like CONCAT('%',:search,'%')) ) ";

		}

		
		if (!price_gte.equals(BigDecimal.valueOf(-1)))
			sql += String.format(" and c.price >= %s ", price_gte.toString());
		if (!price_lt.equals(BigDecimal.valueOf(-1)))
			sql += String.format(" and c.price < %s ", price_lt.toString());
		Query query = this.entityManager.createQuery(sql, Long.class);
		if (_search != null && _search.length() != 0) {
			query.setParameter("search", _search);
		}
		return (long) query.getSingleResult();
	}
	
	public List<Payment> getListEntitys(int _page, int _limit, String sort, String _search, BigDecimal price_gte, BigDecimal price_lt, AppUser appUser) {
		--_page;
		if(_page<0)_page=0;
		if (sort == "" || sort == null)
			sort = "id:asc";

		String sql = null;
		if (_search.length() == 0) {
			sql = "Select c from " + Payment.class.getName() + " c " //
					+ " where c.deleted=0  and c.appUser.id = :userId ";
		} else {
			sql = "Select c from " + Payment.class.getName() + " c " //
					+ " where c.deleted=0  and c.appUser.id = :userId and ((c.title like CONCAT('%',:search,'%')) or (c.description like CONCAT('%',:search,'%')) ) ";

		}
		
		
		if (!price_gte.equals(BigDecimal.valueOf(-1)))
			sql += String.format(" and c.price >= %s ", price_gte.toString());
		if (!price_lt.equals(BigDecimal.valueOf(-1)))
			sql += String.format(" and c.price < %s ", price_lt.toString());
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
			
			case "price":
				sqlSort += WebUtils.sort(_order, "c.price", started);
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
		Query query = this.entityManager.createQuery(sql, Payment.class);
		query.setFirstResult(_page * _limit);
		if (_search.length() != 0) {
			query.setParameter("search", _search);
		}
		if (_limit != -1) {
			query.setMaxResults(_limit);
		}
		query.setParameter("userId", appUser.getId());
		return query.getResultList();
	}

	public long getCount(String _search,BigDecimal price_gte, BigDecimal price_lt, AppUser appUser) {
		String sql = null;
		if (_search == null || _search.length() == 0) {
			sql = "Select count(*) from " + Payment.class.getName() + " c " //
					+ " where c.deleted=0 and c.appUser.id = :userId ";

		} else {
			sql = "Select count(*) from " + Payment.class.getName() + " c " //
					+ " where c.deleted=0 and c.appUser.id = :userId and ((c.title like CONCAT('%',:search,'%')) or (c.description like CONCAT('%',:search,'%')) ) ";

		}

		
		if (!price_gte.equals(BigDecimal.valueOf(-1)))
			sql += String.format(" and c.price >= %s ", price_gte.toString());
		if (!price_lt.equals(BigDecimal.valueOf(-1)))
			sql += String.format(" and c.price < %s ", price_lt.toString());
		Query query = this.entityManager.createQuery(sql, Long.class);
		if (_search != null && _search.length() != 0) {
			query.setParameter("search", _search);
		}
		query.setParameter("userId", appUser.getId());
		return (long) query.getSingleResult();
	}


}
