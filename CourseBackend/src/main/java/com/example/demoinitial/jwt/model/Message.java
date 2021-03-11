package com.example.demoinitial.jwt.model;


public class Message {
	
	private String content;

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * @param content
	 */
	public Message(String content) {
		super();
		this.content = content;
	}

	/**
	 * 
	 */
	public Message() {
		super();
	}
	
	
}
