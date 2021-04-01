package vn.edu.topedu.payment.paypal;

import java.net.URI;


import org.springframework.http.server.reactive.ServerHttpRequest;

public class Utils {

	public static String getBaseURL(ServerHttpRequest serverHttpRequest) {
		URI uri = serverHttpRequest.getURI();
		String scheme = uri.getScheme();
	    String serverName = uri.getHost();
	    int serverPort = uri.getPort();
	    //String contextPath = uri.getContextPath();
	    StringBuffer url =  new StringBuffer();
	    url.append(scheme).append("://").append(serverName);
	    if ((serverPort != 80) && (serverPort != 443)) {
	        url.append(":").append(serverPort);
	    }
	    //url.append(contextPath);
	    if(url.toString().endsWith("/")){
	    	url.append("/");
	    }
	    return url.toString();
	}
	
}