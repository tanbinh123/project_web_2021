package json.object;

public class JsonResponseMessageError extends JsonResponse {
	private boolean isError;

	public boolean isError() {
		return isError;
	}

	public void setError(boolean isError) {
		this.isError = isError;
	}

}
