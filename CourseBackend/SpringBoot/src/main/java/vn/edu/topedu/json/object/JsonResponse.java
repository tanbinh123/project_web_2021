package vn.edu.topedu.json.object;

import com.fasterxml.jackson.core.JsonProcessingException;

import vn.edu.topedu.json.ultis.JsonFactoryUltis;

public abstract class JsonResponse {
	public String toJsonString() {
		return JsonFactoryUltis.covertToJsonString(this);
	}
	

}
