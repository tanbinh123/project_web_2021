package vn.edu.topedu.rest.test;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import vn.edu.topedu.fileprocess.FileProcess;

@RestController
public class TestMultiPartREST {

	@PostMapping(value = "/test/upload/multipartfile", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	@ResponseBody
	public ResponseEntity<Object> testUploadFilePart(@RequestPart("name") String name,
			@RequestPart("file") MultipartFile file) {
		String pathContain = "test";
		try {
			System.out.println(String.format("Name: %s", name));
			System.out.println(String.format("File: %s", file.getOriginalFilename()));
			File p = FileProcess.getPath(pathContain, file.getOriginalFilename()).toFile();
			System.out.println(p.getAbsolutePath());
			p.getParentFile().mkdirs();
			InputStream initialStream = file.getInputStream();
			OutputStream outStream = new FileOutputStream(p);

			byte[] buffer = new byte[8 * 1024];
			int bytesRead;
			while ((bytesRead = initialStream.read(buffer)) != -1) {
				outStream.write(buffer, 0, bytesRead);
			}
			IOUtils.closeQuietly(initialStream);
			IOUtils.closeQuietly(outStream);
			return ResponseEntity.ok().build();
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
		}

	}

}
