package vn.edu.topedu.xuggler;

import com.xuggle.xuggler.IContainer;

public class VideoInfo {
	//private static final String filename = "c:/myvideo.mp4";
	
	public static long getDuration(String filename) {
		IContainer container = IContainer.make();
		int result = container.open(filename, IContainer.Type.READ, null);
		long duration = container.getDuration();
		long fileSize = container.getFileSize();
		return duration;
		
	}
	public static void main(String[] args) {
		String input="D:\\Github\\CDW\\project_web_2021\\CourseBackend\\SpringBoot\\static-file\\user\\admin\\video\\lambanh_52.mp4";
		System.out.println(getDuration(input));
	}

}
