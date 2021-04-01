package request;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class JavaGetRequest {
	 private static HttpURLConnection con;

	    public static void main(String[] args) throws IOException {

	        String url = "http://192.168.0.111:8080/test/session";

	        try {

	        	URL myurl = new URL(url);
	            con = (HttpURLConnection) myurl.openConnection();

	            con.setRequestMethod("GET");

	            StringBuilder content;

	            try (BufferedReader in = new BufferedReader(
	                    new InputStreamReader(con.getInputStream()))) {

	                String line;
	                content = new StringBuilder();

	                while ((line = in.readLine()) != null) {

	                    content.append(line);
	                    content.append(System.lineSeparator());
	                }
	            }

	            System.out.println(content.toString());

	        } finally {

	            con.disconnect();
	        }
	    }
}
