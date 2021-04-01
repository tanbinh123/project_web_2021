package json.object;

import com.fasterxml.jackson.core.JsonProcessingException;

import json.ultis.JsonFactoryUltis;

public abstract class JsonResponse {
	public String toJsonString() {
		return JsonFactoryUltis.covertToJsonString(this);
	}
	

}
