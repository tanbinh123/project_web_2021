package vn.edu.topedu.request;



public class  LoginFormRedirect {
	private String username;	
	private String password;
	private String urlReturn;
	
	
	public String getUrlReturn() {
		return urlReturn;
	}
	public void setUrlReturn(String urlReturn) {
		this.urlReturn = urlReturn;
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
	public LoginFormRedirect() {
		super();
	}

	/**
	 * @param username
	 * @param password
	 */
	public LoginFormRedirect(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	
	

}
