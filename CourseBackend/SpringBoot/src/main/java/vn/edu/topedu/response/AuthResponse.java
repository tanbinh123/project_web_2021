package vn.edu.topedu.response;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;

import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.course.Course;
import vn.edu.topedu.response.model.AccountResponse;
@JsonInclude(JsonInclude.Include.NON_NULL)
public class AuthResponse {
	private String token;
	private AccountResponse user;
	private List<Course> courses;
	private AppUser profile;

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

	
	  public List<Course> getCourses() { return courses; }
	  
	  public void setCourses(List<Course> courses) { this.courses = courses; }

	public AppUser getProfile() {
		return profile;
	}

	public void setProfile(AppUser profile) {
		this.profile = profile;
	}
	 
	

	


}
