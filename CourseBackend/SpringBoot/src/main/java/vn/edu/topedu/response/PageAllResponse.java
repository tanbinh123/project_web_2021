package vn.edu.topedu.response;

import java.util.List;

import vn.edu.topedu.entity.Course;

public class PageAllResponse {
	private List<Course> data;

	public PageAllResponse(List<Course> data) {
		super();
		this.data = data;
	}

	public List<Course> getData() {
		return data;
	}

	public void setData(List<Course> data) {
		this.data = data;
	}
	

}
