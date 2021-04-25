package vn.edu.topedu.utils;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
	public static String getUrl(HttpServletRequest httpServletRequest) {
		return String.format("%s://%s:%d/", httpServletRequest.getScheme(),httpServletRequest.getServerName(),httpServletRequest.getServerPort());
	}

}
