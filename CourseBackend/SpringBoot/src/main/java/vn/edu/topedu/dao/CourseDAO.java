package vn.edu.topedu.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.edu.topedu.entity.Course;
import vn.edu.topedu.entity.detailcourse.DetailCourseEntity;
import vn.edu.topedu.utils.WebUtils;

@Repository
@Transactional
public class CourseDAO {
	@Autowired
	private EntityManager entityManager;
	
	public List<Course> getListCourse(int _page, int _limit, String sort) {
		--_page;
		String sql = "Select c from " + Course.class.getName() + " c " //
				+ " where c.deleted=0 group by c.id  order by  ";
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
			case "bought":
				sqlSort += WebUtils.sort(_order, "c.bought", started);
				break;
			case "ratestar":
				sqlSort += WebUtils.sort(_order, "c.rateStar", started);
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
		Query query = this.entityManager.createQuery(sql, Course.class);
		query.setFirstResult(_page * _limit);
		if (_limit != -1) {
			query.setMaxResults(_limit);
		}
		return query.getResultList();
	}
	public long getCount() {
		String sql = "Select count(*) from " + Course.class.getName() + " c " //
				+ " where c.deleted=0 ";
		Query query = this.entityManager.createQuery(sql, Long.class);
		return (long) query.getSingleResult();
	}
	public long getCountSearch(String search) {
		String sql = "Select count(*) from " + Course.class.getName() + " c " //
				+ " where c.deleted=0 and (c.title like CONCAT('%',:search,'%')) ";
		Query query = this.entityManager.createQuery(sql, Long.class);
		query.setParameter("search", search);
		return (long) query.getSingleResult();
	}
	
	public List<Course> search(int _page, int _limit, String sort, String search) {
		--_page;
		String sql = "Select c from " + Course.class.getName() + " c " //
				+ " where c.deleted=0 and (c.title like CONCAT('%',:search,'%')) group by c.id  order by  ";
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

			case "bought":
				sqlSort += WebUtils.sort(_order, "c.bought", started);
				break;

			case "ratestar":
				sqlSort += WebUtils.sort(_order, "c.rateStar", started);
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
		Query query = this.entityManager.createQuery(sql, Course.class);
		query.setParameter("search", search);
		query.setFirstResult(_page * _limit);
		if (_limit != -1) {

			query.setMaxResults(_limit);

		}
		return query.getResultList();

	}

	public DetailCourseEntity getDetailCourse(Long idCourse) {
		String sql = "Select c from " + DetailCourseEntity.class.getName() + " c " //
				+ " where c.deleted=0 and c.id= :id ";
		Query query = this.entityManager.createQuery(sql, DetailCourseEntity.class);
		query.setParameter("id", idCourse);
		return (DetailCourseEntity) query.getSingleResult();
	}
	public Course getCourse(Long idCourse) {
		String sql = "Select c from " + Course.class.getName() + " c " //
				+ " where c.deleted=0 and c.id= :id ";
		Query query = this.entityManager.createQuery(sql, Course.class);
		query.setParameter("id", idCourse);
		return (Course) query.getSingleResult();
	}
//	public List<Course> getCourse(int id) {
//		String sql = "Select c from " + Course.class.getName() + " c " //
//				+ " where c.deleted=0 and c.id= :id group by c.id order by c.id desc ";
//		Query query = this.entityManager.createQuery(sql, Course.class);
//		query.setParameter("id", id);
//		return query.getResultList();
//	}

	public Long insertCourse(Course course) {
		try {
			entityManager.persist(course);
			entityManager.flush();
			return course.getId();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return Long.parseLong(String.valueOf(0));
	}

	public Course updateCourse(Course course) {
		return entityManager.merge(course);
	}

	public boolean deleteCourse(int id) {

		int rs = entityManager.createNativeQuery("UPDATE course set deleted=? where id=? and deleted=0")
				.setParameter(1, 1).setParameter(2, id).executeUpdate();
		// System.out.println(rs);
		if (rs == 1)
			return true;
		return false;
	}

}