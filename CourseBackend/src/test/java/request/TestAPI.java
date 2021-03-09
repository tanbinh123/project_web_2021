package request;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;

public class TestAPI {
	public static void basicPost(String url) throws ClientProtocolException, IOException {
		CloseableHttpClient client = HttpClients.createDefault();
		HttpPost httpPost = new HttpPost(url);
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("username", "your_username"));
		params.add(new BasicNameValuePair("password", "your_password"));
		httpPost.setEntity(new UrlEncodedFormEntity(params));
		CloseableHttpResponse response = client.execute(httpPost);
		client.close();
	}

	public static void main(String[] args) throws ClientProtocolException, IOException {
		String url="http://localhost:8080/api/login";
		CloseableHttpClient client = HttpClients.createDefault();
		HttpPost httpPost = new HttpPost(url);
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("username", "hoang"));
		params.add(new BasicNameValuePair("password", "865bedd2fba8fe20b828ed07600c64a4"));
		httpPost.setEntity(new UrlEncodedFormEntity(params));
		CloseableHttpResponse response = client.execute(httpPost);
		client.close();

	}

}
