package vn.edu.topedu.json.object;

public class ResponseNull  implements JsonResponse {
	private boolean isNull;
	public ResponseNull() {
		super();
		this.isNull = true;
	}
	public boolean getIsNull() {
		return isNull;
	}

	public void setIsNull(boolean isNull) {
		this.isNull = isNull;
	}
	
}
