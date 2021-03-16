package vn.edu.topedu.response;

import vn.edu.topedu.response.model.AccountResponse;

public class SignUpResponse {
	private String token;
	private AccountResponse user;

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	/**
	 * @param token
	 */
	public SignUpResponse(String token) {
		super();
		this.token = token;
	}

	/**
	 * 
	 */
	public SignUpResponse() {
		super();
	}

	public AccountResponse getUser() {
		return user;
	}

	public void setUser(AccountResponse user) {
		this.user = user;
	}

	

}
