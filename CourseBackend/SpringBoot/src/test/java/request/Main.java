package request;

import java.io.IOException;

public class Main {
	public static void main(String[] args) throws IOException {
		//System.out.println(HttpRequest.requestGet("http://192.168.0.111:8080/test"));
		System.out.println(HttpRequest.requestPost("http://192.168.0.111:8080/login","username=user&password=user"));
	}

}
