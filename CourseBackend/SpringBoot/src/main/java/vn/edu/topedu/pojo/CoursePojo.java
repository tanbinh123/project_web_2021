package vn.edu.topedu.pojo;

import vn.edu.topedu.entity.course.Course;

public class CoursePojo extends Course {
	public static CoursePojo co(Course course) {
		CoursePojo a = new CoursePojo();
		a.setTitle(course.getTitle());
		a.setUpdateAt(course.getUpdateAt());
		a.setCreateAt(course.getCreateAt());
		a.setActived(course.getActived());
		a.setBought(course.getBought());
		return a;
	}

	

}
