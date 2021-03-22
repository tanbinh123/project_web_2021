package vn.edu.topedu.request;

public class ForgetPasswordRequest{
	private String emailOrUsername;

	
	public ForgetPasswordRequest() {
		super();
	}
	

	
	public ForgetPasswordRequest(String emailOrUsername) {
		super();
		this.emailOrUsername = emailOrUsername;
	}


	public String getEmailOrUsername() {
		return emailOrUsername;
	}

	public void setEmailOrUsername(String emailOrUsername) {
		this.emailOrUsername = emailOrUsername;
	}

	@Override
	public String toString() {
		return "ForgetPasswordRequest [emailOrUsername=" + emailOrUsername + "]";
	}
	
	
}