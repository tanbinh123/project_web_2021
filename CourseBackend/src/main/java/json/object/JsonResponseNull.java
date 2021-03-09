package json.object;

public class JsonResponseNull  extends JsonResponse {
	private boolean isNull;
	

	public JsonResponseNull() {
		super();
		this.isNull = true;
	}

	public boolean isNull() {
		return isNull;
	}

	public void setNull(boolean isNull) {
		this.isNull = isNull;
	}
	
}
