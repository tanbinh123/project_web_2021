package com.example.demoinitial.jwt.security.model;


public class AuthResponse {
	
	private String token;

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

}
