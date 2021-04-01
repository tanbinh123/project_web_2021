package request;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

public class HttpRequest {

	public static void get(String url) throws IOException {

		HttpURLConnection con = null;

		try {

			URL myurl = new URL(url);
			con = (HttpURLConnection) myurl.openConnection();

			con.setRequestMethod("GET");

			StringBuilder content;

			try (BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()))) {
				String line;
				content = new StringBuilder();
				while ((line = in.readLine()) != null) {
					content.append(line);
					content.append(System.lineSeparator());
				}
			}
			System.out.println(content.toString());

		} finally {
			if (con != null)
				con.disconnect();
		}
	}

	public static String requestGet(String url) throws IOException {
		HttpURLConnection con = null;
		String rs = null;
		try {
			URL myurl = new URL(url);
			con = (HttpURLConnection) myurl.openConnection();
			con.setRequestMethod("GET");
			StringBuilder content;
			try (BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()))) {
				String line;
				content = new StringBuilder();
				while ((line = in.readLine()) != null) {
					content.append(line);
					content.append(System.lineSeparator());
				}
			}
			rs = content.toString();
			//System.out.println(content.toString());
		} finally {
			if (con != null)
				con.disconnect();
		}
		return rs;
	}

	public static String requestPost(String url, String urlParameters) throws IOException {
		String rs = null;
		HttpURLConnection con = null;
		byte[] postData = urlParameters.getBytes(StandardCharsets.UTF_8);
		try {
			URL myurl = new URL(url);
			con = (HttpURLConnection) myurl.openConnection();
			con.setDoOutput(true);
			con.setRequestMethod("POST");
			con.setRequestProperty("User-Agent", "Java client");
			con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			try (DataOutputStream wr = new DataOutputStream(con.getOutputStream())) {
				wr.write(postData);
			}
			StringBuilder content;
			try (BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()))) {
				String line;
				content = new StringBuilder();
				while ((line = br.readLine()) != null) {
					content.append(line);
					content.append(System.lineSeparator());
				}
			}
			rs=content.toString();
			//System.out.println(content.toString());

		} finally {
			if (con != null)
				con.disconnect();
		}
		return rs;
	}
}
