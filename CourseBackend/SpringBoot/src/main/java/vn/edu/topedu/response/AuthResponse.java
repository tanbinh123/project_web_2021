package vn.edu.topedu.response;

import java.util.List;

import vn.edu.topedu.entity.Course;
import vn.edu.topedu.response.model.AccountResponse;

public class AuthResponse {
	private String token;
	private AccountResponse user;
	private List<Course> courses;

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	/**
	 * @param token
	 */
	public AuthResponse(String token) {
		super();
		this.token = token;
	}

	/**
	 * 
	 */
	public AuthResponse() {
		super();
	}

	public AccountResponse getUser() {
		return user;
	}

	public void setUser(AccountResponse user) {
		this.user = user;
	}

	public List<Course> getCourses() {
		return courses;
	}

	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}
	

	


}
