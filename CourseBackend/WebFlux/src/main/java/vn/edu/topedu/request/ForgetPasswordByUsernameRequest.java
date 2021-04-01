package vn.edu.topedu.request;

public class ForgetPasswordByUsernameRequest{
	private String username;

	
	public ForgetPasswordByUsernameRequest() {
		super();
	}
	

	
	public ForgetPasswordByUsernameRequest(String username) {
		super();
		this.username = username;
	}



	public String getUsername() {
		return username;
	}



	public void setUsername(String username) {
		this.username = username;
	}



	
	
}