package vn.edu.topedu.sendrequest;

import java.util.Scanner;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;


public class HttpGetUltis {
 
   public static String sendGetRequest(String url) throws Exception{
	  StringBuilder stringBuilder= new  StringBuilder();
      CloseableHttpClient httpclient = HttpClients.createDefault();
      HttpGet httpget = new HttpGet(url);
      //System.out.println("Request Type: "+httpget.getMethod());
      HttpResponse httpresponse = httpclient.execute(httpget);
      Scanner sc = new Scanner(httpresponse.getEntity().getContent());
      //System.out.println(httpresponse.getStatusLine());
      while(sc.hasNext()) {
    	  stringBuilder.append(sc.nextLine());
      }
      return stringBuilder.toString();
   }
} 