package vn.edu.topedu.utils;

import java.util.concurrent.TimeUnit;

public class WebUtils {
	public static String miliSecondToDuration(long miliSecond) {
		String dura=String.format("%d min, %d sec", 
			    TimeUnit.MILLISECONDS.toMinutes(miliSecond),
			    TimeUnit.MILLISECONDS.toSeconds(miliSecond) - 
			    TimeUnit.MINUTES.toSeconds(TimeUnit.MILLISECONDS.toMinutes(miliSecond))
			);
		return dura;
	}

}
