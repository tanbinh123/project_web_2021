package vn.edu.topedu.json.ultis;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class JsonFactoryUltis {
	public static String covertToJsonString(Object object) {
		String message = null;
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			String jsonString;
			jsonString = objectMapper.writeValueAsString(object);
			return jsonString;
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			message = e.getMessage();

		}

		return "{isError:true,message:" + message + "}";

	}

}
