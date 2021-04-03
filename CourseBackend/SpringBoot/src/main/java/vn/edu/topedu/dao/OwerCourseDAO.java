package vn.edu.topedu.dao;

import java.util.Arrays;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import fileprocess.FileProcess;
import vn.edu.topedu.entity.Course;
import vn.edu.topedu.entity.OwerCourse;
import vn.edu.topedu.entity.UserCourse;
import vn.edu.topedu.entity.UserRole;
import vn.edu.topedu.response.model.CourseResponse;
import vn.edu.topedu.utils.WebUtils;

@Repository
@Transactional
public class OwerCourseDAO {

	@Autowired
	private EntityManager entityManager;

	public List<Course> getOwerCourse(Long userId) {
		String sql = "Select oc.course from " + OwerCourse.class.getName() + " oc " //
				+ " where oc.appUser.userId = :userId ";

		Query query = this.entityManager.createQuery(sql, Course.class);
		query.setParameter("userId", userId);
		return query.getResultList();
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
		//System.out.println(Arrays.toString(a));
		boolean started= true;
		for(String str:a) {	
			int index=str.indexOf(':');
//			System.out.println(str);
//			System.out.println(index);
			String _order= str.substring(index+1);
			String tmpSort= str.substring(0,index);
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
			started=false;
			sql += sqlSort;
			sqlSort="";
			
		}

		Query query = this.entityManager.createQuery(sql, CourseResponse.class);

		query.setFirstResult(_page * _limit);
		if(_limit!=-1) {
			
			query.setMaxResults(_limit);
			
		}
		return query.getResultList();
	}

}