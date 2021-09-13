package vn.edu.topedu.json;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.ser.std.StdSerializer;

public class CustomDateFullSerializer extends StdSerializer<Date> {

//	private static SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
	private static SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");

	public CustomDateFullSerializer() {
		this(null);
	}

	public CustomDateFullSerializer(Class<Date> t) {
		super(t);
	}

	@Override
	public void serialize(Date value, JsonGenerator gen, SerializerProvider arg2)
			throws IOException, JsonProcessingException {
		gen.writeString(formatter.format(value));
	}
}