package vn.edu.topedu.json.object;

import vn.edu.topedu.json.ultis.JsonFactoryUltis;

public interface JsonResponse {
	public default String toJsonString() {
		return JsonFactoryUltis.covertToJsonString(this);
	}
	

}
