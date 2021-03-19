package vn.edu.topedu.dao;
 
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import vn.edu.topedu.entity.Course;
import vn.edu.topedu.entity.UserCourse;
import vn.edu.topedu.entity.UserRole;
 
@Repository
@Transactional
public class UserCourseDAO {
 
    @Autowired
    private EntityManager entityManager;
 
    public List<Course> getOwerCourse(Long userId) {
        String sql = "Select uc.course from " + 
        		UserCourse.class.getName() + " uc " //
                + " where uc.appUser.userId = :userId ";
 
        Query query = this.entityManager.createQuery(sql, Course.class);
        query.setParameter("userId", userId);
        return query.getResultList();
    }
   
 
}