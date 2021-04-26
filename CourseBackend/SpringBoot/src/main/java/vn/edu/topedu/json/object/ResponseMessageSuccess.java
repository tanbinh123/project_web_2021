package vn.edu.topedu.json.object;

public class ResponseMessageSuccess implements JsonResponse {
	private boolean isSuccess;
	private String message;
	
	/**
	 * @param message
	 */
	public ResponseMessageSuccess() {
		super();
		this.isSuccess=true;
		this.message = "OK";
	}
	public boolean getIsSuccess() {
		return isSuccess;
	}
	public void setIsSuccess(boolean isSuccess) {
		this.isSuccess = isSuccess;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}
