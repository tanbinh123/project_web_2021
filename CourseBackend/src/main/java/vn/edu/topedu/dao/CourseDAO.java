package vn.edu.topedu.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.edu.topedu.entity.Course;

@Repository
@Transactional
public class CourseDAO {

	@Autowired
	private EntityManager entityManager;

	public List<Course> getListCourse(int pageIndex, int countsOnPage) {
		String sql = "Select c from " + Course.class.getName() + " c " //
				+ " where c.deleted=0 group by c.id order by c.id desc ";
		Query query = this.entityManager.createQuery(sql, Course.class);
		query.setFirstResult(pageIndex*countsOnPage);
		query.setMaxResults(countsOnPage);
		return query.getResultList();
	}

	public List<Course> getCourse(int id) {
		String sql = "Select c from " + Course.class.getName() + " c " //
				+ " where c.deleted=0 and c.id= :id group by c.id order by c.id desc ";
		Query query = this.entityManager.createQuery(sql, Course.class);
		query.setParameter("id", id);
		return query.getResultList();
	}
//	public List<Course> getCourse(int id) {
//		String sql = "Select c from " + Course.class.getName() + " c " //
//				+ " where c.deleted=0 and c.id= :id group by c.id order by c.id desc ";
//		Query query = this.entityManager.createQuery(sql, Course.class);
//		query.setParameter("id", id);
//		return query.getResultList();
//	}

	public int insertCourse(Course course) {
		try {
			entityManager.persist(course);
			entityManager.flush();
			return course.getId();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return 0;
	}

	public Course updateCourse(Course course) {
		return entityManager.merge(course);
	}
	
	public boolean deleteCourse(int id) {

		int rs = entityManager
				.createNativeQuery("UPDATE course set deleted=? where id=? and deleted=0")
				.setParameter(1, 1)
				.setParameter(2, id).executeUpdate();
		// System.out.println(rs);
		if (rs == 1)
			return true;
		return false;
	}

}