package vn.edu.topedu.dao;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.OwerCourse;
import vn.edu.topedu.entity.Payment;
import vn.edu.topedu.entity.course.Course;
import vn.edu.topedu.response.model.CourseResponse;
import vn.edu.topedu.utils.WebUtils;

@Repository
@Transactional
public class OwerCourseDAO {

	@Autowired
	private EntityManager entityManager;

	public OwerCourse merge(OwerCourse payment) {
		OwerCourse oc = this.entityManager.merge(payment);
		this.entityManager.flush();
		deleteAllOwerCourseUnComplete(payment.getCourse().getId(), payment.getAppUser().getId());
		return oc;
	}

	public int deleteAllOwerCourseUnComplete(Long courseId, Long userId) {
		Query query = entityManager.createNativeQuery("Delete from ower_course where successed=0 and course_id = :courseId and user_id = :userId");
		query.setParameter("courseId", courseId);
		query.setParameter("userId", userId);
		int rs = query.executeUpdate();
		return rs;
	}

	public OwerCourse insertOwerCourse(OwerCourse user) {

		try {
			entityManager.persist(user);
			entityManager.flush();
			return user;
		} catch (Exception e) {
			// System.out.println(e.getMessage());
			System.out.println("Không insert owerCourse");
			return null;
		}

	}

	public List<Course> getOwerCourse(Long userId) {
		String sql = "Select oc.course from " + OwerCourse.class.getName() + " oc " //
				+ " where oc.appUser.userId = :userId ";

		Query query = this.entityManager.createQuery(sql, Course.class);
		query.setParameter("userId", userId);
		return query.getResultList();
	}

	public OwerCourse querryBought(Long appUserId, Long courseId) throws NoResultException {
		String sql = "Select oc from " + OwerCourse.class.getName() + " oc " //
				+ " where  oc.successed = true and oc.appUser.id = :appUserId and oc.course.id = :courseId  ";
//		String sql = "Select oc from " + OwerCourse.class.getName() + " oc " //
//				+ " where  oc.success = :success and oc.appUser.id = :appUserId and oc.course.id = :courseId  ";
		Query query = this.entityManager.createQuery(sql);
		// System.err.println("1.5");
		query.setParameter("appUserId", appUserId);
		query.setParameter("courseId", courseId);
//		query.setParameter("success", true);
		return (OwerCourse) query.getSingleResult();
	}

	public List<Course> querryAllBought(Long appUserId) throws NoResultException {
		String sql = "Select oc.course from " + OwerCourse.class.getName() + " oc " //
				+ " where  oc.successed = true and oc.appUser.id = :appUserId ";
//		String sql = "Select oc from " + OwerCourse.class.getName() + " oc " //
//				+ " where  oc.success = :success and oc.appUser.id = :appUserId and oc.course.id = :courseId  ";
		Query query = this.entityManager.createQuery(sql);
		// System.err.println("1.5");
		query.setParameter("appUserId", appUserId);
//		query.setParameter("success", true);
		return query.getResultList();
	}

	public OwerCourse querryByPayment(Long paymentId) throws NoResultException {
		String sql = "Select oc from " + OwerCourse.class.getName() + " oc " //
				+ " where oc.payment.id = :paymentId ";
		Query query = this.entityManager.createQuery(sql, OwerCourse.class);
		query.setParameter("paymentId", paymentId);
		return (OwerCourse) query.getSingleResult();
	}

	public CourseResponse getCourse(int id) {
		String sql = "Select new vn.edu.topedu.response.model.CourseResponse( "
				+ "oc.course.id,oc.course.title, oc.course.description, oc.course.poster,oc.appUser.avatar, oc.appUser.userName,oc.course.ratestar,oc.course.price ,oc.course.bought,oc.course.updateAt "
				+ ") from " + OwerCourse.class.getName() + " oc " //
				+ " where oc.course.deleted=0 and oc.course.id= :id group by oc.course.id order by oc.course.id desc ";
		Query query = this.entityManager.createQuery(sql, CourseResponse.class);
		query.setParameter("id", id);

		return (CourseResponse) query.getSingleResult();
	}

	public List<CourseResponse> getListCourse(int _page, int _limit, String sort/* , String sort2 */) {
		--_page;
		String sql = "Select new vn.edu.topedu.response.model.CourseResponse( "
				+ "oc.course.id,oc.course.title, oc.course.description, oc.course.poster,oc.appUser.avatar, oc.appUser.userName,oc.course.ratestar,oc.course.price,oc.course.bought,oc.course.updateAt "
				+ ") from " + OwerCourse.class.getName() + " oc " //
				+ " where oc.course.deleted=0 group by oc.course.id  order by  ";
		String sqlSort = "";
		sort = sort.toLowerCase();

		String[] a = sort.split(",");
		// System.out.println(Arrays.toString(a));
		boolean started = true;
		for (String str : a) {
			int index = str.indexOf(':');
//			System.out.println(str);
//			System.out.println(index);
			String _order = str.substring(index + 1);
			String tmpSort = str.substring(0, index);
//			System.out.println(String.format("%s%s", _order, tmpSort));
			switch (tmpSort) {
			case "id":
				sqlSort += WebUtils.sort(_order, "oc.course.id", started);
				break;

			case "bought":
				sqlSort += WebUtils.sort(_order, "oc.course.bought", started);
				break;

			case "ratestar":
				sqlSort += WebUtils.sort(_order, "oc.course.ratestar", started);
				break;
			case "price":
				sqlSort += WebUtils.sort(_order, "oc.course.price", started);
				break;
			case "updateat":
				sqlSort += WebUtils.sort(_order, "oc.course.updateAt", started);
				break;

			default:
				break;
			}
			started = false;
			sql += sqlSort;
			sqlSort = "";

		}

		Query query = this.entityManager.createQuery(sql, CourseResponse.class);

		query.setFirstResult(_page * _limit);
		if (_limit != -1) {

			query.setMaxResults(_limit);

		}
		return query.getResultList();
	}

	public void detach(OwerCourse owerCourse) {
		this.entityManager.detach(owerCourse.getCourse());

	}
	
	
	public List<OwerCourse> getListEntitys(int _page, int _limit, String sort, String _search, BigDecimal price_gte, BigDecimal price_lt) {
		--_page;
		if(_page<0)_page=0;
		if (sort == "" || sort == null)
			sort = "id:asc";

		String sql = null;
		if (_search.length() == 0) {
			sql = "Select c from " + OwerCourse.class.getName() + " c " //
					+ " where c.deleted=0 ";
		} else {
			sql = "Select c from " + OwerCourse.class.getName() + " c " //
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
		Query query = this.entityManager.createQuery(sql, OwerCourse.class);
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
			sql = "Select count(*) from " + OwerCourse.class.getName() + " c " //
					+ " where c.deleted=0 ";

		} else {
			sql = "Select count(*) from " + OwerCourse.class.getName() + " c " //
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
	
	public List<OwerCourse> getListEntitys(int _page, int _limit, String sort, String _search, BigDecimal price_gte, BigDecimal price_lt, AppUser appUser) {
		--_page;
		if(_page<0)_page=0;
		if (sort == "" || sort == null)
			sort = "id:asc";

		String sql = null;
		if (_search.length() == 0) {
			sql = "Select c from " + OwerCourse.class.getName() + " c " //
					+ " where c.deleted=0  and c.appUser.id = :userId ";
		} else {
			sql = "Select c from " + OwerCourse.class.getName() + " c " //
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
		Query query = this.entityManager.createQuery(sql, OwerCourse.class);
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
			sql = "Select count(*) from " + OwerCourse.class.getName() + " c " //
					+ " where c.deleted=0 and c.appUser.id = :userId ";

		} else {
			sql = "Select count(*) from " + OwerCourse.class.getName() + " c " //
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