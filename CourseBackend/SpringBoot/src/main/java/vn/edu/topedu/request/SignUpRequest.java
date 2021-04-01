package vn.edu.topedu.request;



public class  SignUpRequest {
	private String username;	
	private String email;	
	private String password;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * 
	 */
	public SignUpRequest() {
		super();
	}

	/**
	 * @param username
	 * @param password
	 */
	public SignUpRequest(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	@Override
	public String toString() {
		return "SignUpRequest [username=" + username + ", email=" + email + ", password=" + password + "]";
	}
	
	

}
