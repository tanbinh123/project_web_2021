package vn.edu.topedu.humble;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Service;

import io.humble.video.Demuxer;

@Service
public class VideoInfo {
	public long getDuration(File input) throws InterruptedException, IOException {

		final Demuxer container = Demuxer.make();
		container.open(input.getAbsolutePath(), null, false, true, null, null);
		return container.getDuration();
	}

	public static void main(String[] args) throws InterruptedException, IOException {
		String[] inputs = { "",
				"D:\\Github\\CDW\\tmp\\project_web_2021\\CourseBackend\\SpringBoot\\static-file\\user\\admin\\video\\lambanh_52.mp4",
				"D:\\Github\\CDW\\tmp\\project_web_2021\\CourseBackend\\SpringBoot\\static-file\\user\\admin\\video\\videodemo_58.mp4" };

		for (String i : inputs) {
			File f = new File(i);
			if (!f.exists())
				continue;
			System.out.println(i);
//			System.out.println(getDuration(i));
			System.out.println(new VideoInfo().getDuration(f));
		}
	}

}
