package vn.edu.topedu.json.object;

public class ResponseMessageError implements JsonResponse {
	private boolean isError;
	private String message;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public boolean isError() {
		return isError;
	}

	public void setError(boolean isError) {
		this.isError = isError;
	}

}
