package vn.edu.topedu.response;

import vn.edu.topedu.response.model.AccountResponse;

public class AuthResponse {
	private String token;
	private AccountResponse account;

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

	public AccountResponse getAccount() {
		return account;
	}

	public void setAccount(AccountResponse account) {
		this.account = account;
	}

}
