package vn.edu.topedu.rest.test;



import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import vn.edu.topedu.fileprocess.FileProcess;
import vn.edu.topedu.video.MyResourceHttpRequestHandler;

@RestController
@RequestMapping("/test")
public class TestVideoREST {
	@Autowired
	private MyResourceHttpRequestHandler handler;
	


	@GetMapping("/stream/{fileName}")
	public void byterange( HttpServletRequest request, HttpServletResponse response,@PathVariable("fileName") String fileName)
			throws ServletException, IOException {
		request.setAttribute(MyResourceHttpRequestHandler.ATTR_FILE, FileProcess.getPathVideo(fileName).toFile());
		handler.handleRequest(request, response);
	}
}