package vn.edu.topedu;

import java.awt.Desktop;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.event.EventListener;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import vn.edu.topedu.dao.CourseDAO;
import vn.edu.topedu.dao.ResourceImageDAO;
import vn.edu.topedu.dao.VideoDAO;
import vn.edu.topedu.entity.course.full.VideoEntity;
import vn.edu.topedu.fileprocess.FileProcess;
import vn.edu.topedu.xuggler.VideoInfo;

@SpringBootApplication
@RestController
public class Main extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(Main.class, args);

	}

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(Main.class);
	}

	@RequestMapping(value = "/")
	@ResponseBody
	public ResponseEntity<Object> hello() {
		System.out.println("Hello");
		return ResponseEntity.ok("Hello World from Spring Boot Started Web");
	}

	@Value("${server.port}")
	private int port;
	@Autowired
	ResourceImageDAO resourceImageDAO;
	@Autowired
	CourseDAO courseDAO;
	@Autowired
	VideoDAO videoDAO;
	@Autowired
	VideoInfo videoService;

	@EventListener({ ApplicationReadyEvent.class })
	void applicationReadyEvent() {
		System.out.println("Application started ... launching browser now");
		System.out.println("http://localhost:" + port + "/admin");
		if (videoDAO != null) {
			try {
				videoDAO.deleteAllNoLink();
				System.err.println("Delete All Video Not Link");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (resourceImageDAO != null) {
			try {
				resourceImageDAO.deleteAllNoLink();
				System.err.println("Delete All Image Not Link");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (courseDAO != null) {
			try {
				courseDAO.deleteAllCategoryNoCourse();
				System.err.println("Delete All Category No Course");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

//		
//		new Thread(new Runnable() {
//
//			@Override
//			public void run() {
//				String[] inputs = {
//						
//						"D:\\Github\\CDW\\tmp\\project_web_2021\\CourseBackend\\SpringBoot\\static-file\\user\\admin\\video\\lambanh_52.mp4",
//						"D:\\Github\\CDW\\\\tmp\\project_web_2021\\CourseBackend\\SpringBoot\\static-file\\user\\admin\\video\\videodemo_58.mp4" };
//		//
//				for (String i : inputs) {
//					// VideoEntity c=lstCourse.get(0);
//					try {
//						File f = new File(i);
//						if (f.exists()) {
//							String ajp = f.getAbsolutePath();
//							
//							System.err.println(i);
//							
//							long a = videoService.getDuration(ajp);
//							System.err.println(a);
//							//fis.close();
//							// Thread.sleep(100);
//
//						}
//					} catch (Exception e) {
//						// TODO: handle exception
//					}
//				}
//
//			}
//		}).start();
	}

	public static void browse(String url) {
		if (Desktop.isDesktopSupported()) {
			Desktop desktop = Desktop.getDesktop();
			try {
				desktop.browse(new URI(url));
			} catch (IOException | URISyntaxException e) {
				e.printStackTrace();
			}
		} else {
			Runtime runtime = Runtime.getRuntime();
			try {
				runtime.exec("rundll32 url.dll,FileProtocolHandler " + url);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}