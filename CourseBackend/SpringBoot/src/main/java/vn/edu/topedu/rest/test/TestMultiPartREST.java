package vn.edu.topedu.rest.test;

import java.io.File;
import java.nio.channels.AsynchronousFileChannel;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.core.io.buffer.DataBufferUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.codec.multipart.FilePart;
import org.springframework.http.codec.multipart.Part;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import fileprocess.FileProcess;
//import reactor.core.publisher.Flux;
import vn.edu.topedu.request.UploadFileRequest;

@RestController
public class TestMultiPartREST {

	

	@PostMapping(value = "/test/upload/filepart", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	@ResponseBody
	public ResponseEntity<Object> testUploadFilePart(@RequestPart("name") String name,
			@RequestPart("file") FilePart file) {
		String pathContain= "test";
		try {
			System.out.println(String.format("Name: %s", name));
			System.out.println(String.format("File: %s", file.filename()));
			File p = FileProcess.getPath(pathContain, file.filename()).toFile();
			System.out.println(p.getAbsolutePath());
			p.getParentFile().mkdirs();
			//file.transferTo(p);
			return ResponseEntity.ok().build();
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
		}

	}

	@PostMapping(value = "/test/upload/object", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	@ResponseBody

	public ResponseEntity<Object> testUpload(@RequestBody UploadFileRequest uploadFileRequest) {

		try {
			System.out.println(String.format("Name: %s", uploadFileRequest.getName()));
			System.out.println(String.format("File: %s", uploadFileRequest.getFile().filename()));

			return ResponseEntity.ok().build();
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
		}

	}
	@PostMapping(value = "/test/upload/multivalue", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	@ResponseBody
	
	public ResponseEntity<Object> testUpload(@RequestBody MultiValueMap<String, Part> multiValueMap) {
		
		try {
			Part p=multiValueMap.getFirst("file");
//			System.out.println(String.format("Name: %s", String.valueOf(multiValueMap.getFirst("name"))));
//			System.out.println(String.format("File: %s", String.valueOf(p)));
			//Flux<DataBuffer> dataFlux = p.content();
			
			String pathContain="test";
			
			String contentDisposition = p.headers().getFirst("content-disposition");
			
			//System.out.println(contentDisposition);
			Matcher matcher= Pattern.compile("filename=\"(.*)\"").matcher(contentDisposition);
			String filename="";
			if(matcher.find()) {
				
				//System.out.println(matcher.group(1));
				filename=matcher.group(1);
				if(filename==null)filename=new Date().toString();
			}
			//Path file = Files.createTempFile("test", filename);
			Path file = FileProcess.getPath(pathContain, filename);
			file.toFile().delete();
			Files.createFile(file);
			//System.out.println(file.toAbsolutePath());
			//file.toFile().getParentFile().mkdirs();
			
//			Write file
//			AsynchronousFileChannel channel =  AsynchronousFileChannel.open(file, StandardOpenOption.WRITE);
//		        DataBufferUtils.write(dataFlux, channel,0)
//		        .doOnComplete(() -> {
//                    System.out.println("Save file: "+file.toAbsolutePath());
//                })
//            .subscribe();
			
		        
	        return ResponseEntity.ok().build();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
		}
		
	}

//	@PostMapping(value = "/test/upload/reactive", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
//	@ResponseBody

//	public ResponseEntity<Object> testUpload(@RequestBody Flux<Part> parts) {
//
//		try {
//
//			return ResponseEntity.ok().build();
//		} catch (Exception e) {
//			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
//		}
//
//	}

	

}
