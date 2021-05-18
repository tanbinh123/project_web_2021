package vn.edu.topedu.utils;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;

public class WebUtils {
	public static String miliSecondToDuration(long miliSecond) {
		String dura = String.format("%d min, %d sec", TimeUnit.MILLISECONDS.toMinutes(miliSecond),
				TimeUnit.MILLISECONDS.toSeconds(miliSecond)
						- TimeUnit.MINUTES.toSeconds(TimeUnit.MILLISECONDS.toMinutes(miliSecond)));
		return dura;
	}

	public static String convertHashToString(String text) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("MD5");
		byte[] hashInBytes = md.digest(text.getBytes(StandardCharsets.UTF_8));
		StringBuilder sb = new StringBuilder();
		for (byte b : hashInBytes) {
			sb.append(String.format("%02x", b));
		}
		return sb.toString();
	}

	public static String sort(String key, String field,boolean started) {
		String format=(started)?" %s %s ":",%s %s ";
		
		switch (key) {
		case "asc":
			return String.format(format, field, "ASC");

		case "desc":
			return String.format(format, field,"DESC");

		default:
			System.out.println("Error sort");
			return "";
		}

	}
	/**
	 * 
	 * @param httpServletRequest
	 * @return scheme://servername:%port/
	 */
	public static String getUrl(HttpServletRequest httpServletRequest) {
		return String.format("%s://%s:%d/", httpServletRequest.getScheme(),httpServletRequest.getServerName(),httpServletRequest.getServerPort());
	}
	/**
	 * 
	 * @param httpServletRequest
	 * @param port 
	 * @return scheme://servername:%port/
	 */
	public static String getUrl(HttpServletRequest httpServletRequest, int port) {
		return String.format("%s://%s:%d/", httpServletRequest.getScheme(),httpServletRequest.getServerName(),port);
	}
	 public static String getIpAddress(HttpServletRequest request) {
	        String ipAdress;
	        try {
	            ipAdress = request.getHeader("X-FORWARDED-FOR");
	            if (ipAdress == null) {
	                ipAdress = request.getRemoteAddr();
	            }
	        } catch (Exception e) {
	            ipAdress = "Invalid IP:" + e.getMessage();
	        }
	        return ipAdress;
	    }
	 public static String Sha256(String message) {
	        String digest = null;
	        try {
	            MessageDigest md = MessageDigest.getInstance("SHA-256");
	            byte[] hash = md.digest(message.getBytes("UTF-8"));

	            // converting byte array to Hexadecimal String
	            StringBuilder sb = new StringBuilder(2 * hash.length);
	            for (byte b : hash) {
	                sb.append(String.format("%02x", b & 0xff));
	            }

	            digest = sb.toString();

	        } catch (UnsupportedEncodingException ex) {
	            digest = "";
	            // Logger.getLogger(StringReplace.class.getName()).log(Level.SEVERE,
	            // null, ex);
	        } catch (NoSuchAlgorithmException ex) {
	            // Logger.getLogger(StringReplace.class.getName()).log(Level.SEVERE,
	            // null, ex);
	            digest = "";
	        }
	        return digest;
	    }
	  public static String formatDate(Date dt) {
	    	SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	        String dateString = formatter.format(dt);
	        return dateString;
	    	
	    }

}
