package vn.edu.topedu.xuggler;

import java.io.File;
import java.io.FileInputStream;
import java.io.RandomAccessFile;
import java.nio.channels.ByteChannel;

import org.springframework.stereotype.Service;

import com.xuggle.xuggler.IContainer;
import com.xuggle.xuggler.IContainerFormat;

@Service
public class VideoInfo {
	//private static final String filename = "c:/myvideo.mp4";
	
	public synchronized static long getDuration(String filename) {
		try {
			
			IContainer container = IContainer.make();
			
			int result = container.open(filename, IContainer.Type.READ, null);
			
			System.err.println(String.format("result: %s", result));
			if(result<0)return 0;
			long duration = container.getDuration();
			long fileSize = container.getFileSize();
			container.close();
			//container.
			return duration;
		} catch (Exception e) {
			System.err.println(e.getMessage());
			// TODO: handle exception
		}
		return 0;
		
	}
	public static long getDuration(File file) {
		try {
			
			IContainer container = IContainer.make();
			
			RandomAccessFile raf= new RandomAccessFile(file, "r");
			//FSDataInputStream  s= fs.open(file.getPath());
			CStore a= new CStore(raf);
			// HDFSProtocolHandler a=new HDFSProtocolHandler(file.getAbsolutePath());
			int result = container.open(a, IContainer.Type.READ, null);
//			
			System.err.println(String.format("result: %s", result));
			if(result<0)return 0;
			long duration = container.getDuration();
			long fileSize = container.getFileSize();
			//container.close();
			//container.
			return duration;
//			return 0;
		} catch (Exception e) {
			System.err.println(e.getMessage());
			// TODO: handle exception
		}
		return 0;
		
	}
	public static void main(String[] args) {
		String[] inputs= {
				""
				,"D:\\Github\\CDW\\tmp\\project_web_2021\\CourseBackend\\SpringBoot\\static-file\\user\\admin\\video\\lambanh_52.mp4"
				, "D:\\Github\\CDW\\tmp\\project_web_2021\\CourseBackend\\SpringBoot\\static-file\\user\\admin\\video\\videodemo_58.mp4"
				};
		
		for(String i:inputs)
		{
			File f = new File(i);
			if(!f.exists())continue;
			System.out.println(i);
			System.out.println(getDuration(i));
//			System.out.println(getDuration(f));
		}
	}

}
