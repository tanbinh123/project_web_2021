package vn.edu.topedu.request;

public class ForgetPasswordByEmailRequest{
	private String email;

	
	public ForgetPasswordByEmailRequest() {
		super();
	}
	

	
	public ForgetPasswordByEmailRequest(String email) {
		super();
		this.email = email;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}


	

	
	
}