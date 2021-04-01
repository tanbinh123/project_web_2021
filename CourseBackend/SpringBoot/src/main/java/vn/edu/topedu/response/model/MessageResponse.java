package vn.edu.topedu.response.model;


public class MessageResponse {
	
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
	public MessageResponse(String content) {
		super();
		this.content = content;
	}

	/**
	 * 
	 */
	public MessageResponse() {
		super();
	}
	
	
}
