package vn.edu.topedu.json;

public interface JsonResponse {
	public default String toJsonString() {
		return JsonFactoryUltis.covertToJsonString(this);
	}
	
	public default String toJsonStringFromObject(Object object) {
		return JsonFactoryUltis.covertToJsonString(object);
	}
	

}
