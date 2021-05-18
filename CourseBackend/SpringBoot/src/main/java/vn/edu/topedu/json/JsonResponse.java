package vn.edu.topedu.json;

public interface JsonResponse {
	public default String toJsonString() {
		return JsonFactoryUltis.covertToJsonString(this);
	}
	

}
