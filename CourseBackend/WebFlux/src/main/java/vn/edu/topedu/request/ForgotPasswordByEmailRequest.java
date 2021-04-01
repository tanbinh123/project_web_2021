package vn.edu.topedu.request;

public class ForgotPasswordByEmailRequest{
	private String email;

	
	public ForgotPasswordByEmailRequest() {
		super();
	}
	

	
	public ForgotPasswordByEmailRequest(String email) {
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