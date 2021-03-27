package vn.edu.topedu.rest;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import fileprocess.FileProcess;

@RestController
@RequestMapping("/resource")
public class ResourceController {
	@RequestMapping(value = "/image/{user}/{fileName}", produces = MediaType.IMAGE_PNG_VALUE)
	public @ResponseBody byte[] getFile(@PathVariable String fileName,@PathVariable String user) {
		try {
			Path path = FileProcess.getPathImage(user+"\\"+fileName);
			InputStream in = Files.newInputStream(path);
			byte[] targetArray = new byte[in.available()];
			in.read(targetArray);
			return targetArray;
		} catch (IOException e) {
			//e.printStackTrace();
			System.out.println("Image not found");
		}
		return new byte[0];
	}
	@RequestMapping(value = "/user/{username}/image/{fileName}", produces = MediaType.IMAGE_JPEG_VALUE)
	public @ResponseBody byte[] getFile2(@PathVariable String fileName,@PathVariable String username) {
		try {
			Path path = FileProcess.getPath("user\\"+username+"\\img",fileName);
			//System.out.println(path.toString());
			InputStream in = Files.newInputStream(path);
			byte[] targetArray = new byte[in.available()];
			in.read(targetArray);
			return targetArray;
		} catch (IOException e) {
			//e.printStackTrace();
			System.out.println("Image not found");
		}
		return new byte[0];
	}
}
