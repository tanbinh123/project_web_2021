package vn.edu.topedu.xuggler;

import java.io.File;

import com.xuggle.xuggler.IContainer;

public class VideoInfo {
	//private static final String filename = "c:/myvideo.mp4";
	
	public static long getDuration(String filename) {
		IContainer container = IContainer.make();
		int result = container.open(filename, IContainer.Type.READ, null);
		long duration = container.getDuration();
		long fileSize = container.getFileSize();
		container.close();
		//container.
		return duration;
		//return 0;
		
	}
	public static void main(String[] args) {
		String[] inputs= {
				"D:\\Github\\CDW\\project_web_2021\\CourseBackend\\SpringBoot\\static-file\\user\\admin\\video\\lambanh_52.mp4"
				, "D:\\Github\\CDW\\project_web_2021\\CourseBackend\\SpringBoot\\static-file\\user\\admin\\video\\videodemo_58.mp4"
				};
		
		for(String i:inputs)
		{
			System.out.println(i);
			System.out.println(getDuration(i));
		}
	}

}
