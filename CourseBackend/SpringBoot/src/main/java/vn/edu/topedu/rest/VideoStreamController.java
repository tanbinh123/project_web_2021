package vn.edu.topedu.rest;



import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import vn.edu.topedu.service.video.IVideoStreamService;

@RestController
@RequestMapping("/video")
public class VideoStreamController {
	
//	public byte[] readByteRange(String filename, long start, long end) throws IOException {
//
//	    FileInputStream inputStream = new FileInputStream(VIDEO_PATH + filename);
//	    ByteArrayOutputStream bufferedOutputStream = new ByteArrayOutputStream();
//	    byte[] data = new byte[1024];
//	    int nRead;
//	    while ((nRead = inputStream.read(data, 0, data.length)) != -1) {
//	        bufferedOutputStream.write(data, 0, nRead);
//	    }
//	    bufferedOutputStream.flush();
//	    byte[] result = new byte[(int) (end - start)];
//	    System.arraycopy(bufferedOutputStream.toByteArray(), (int) start, result, 0, (int) (end - start));
//	    return result;
//	}
//
	private final IVideoStreamService videoStreamService;

	public VideoStreamController(IVideoStreamService videoStreamService) {
		this.videoStreamService = videoStreamService;
	}

	@GetMapping("/stream/{fileType}/{fileName}")
	public ResponseEntity<byte[]> streamVideo(
			@RequestHeader(value = "Range", required = false) String httpRangeList,
			@PathVariable("fileType") String fileType, @PathVariable("fileName") String fileName) {
		return videoStreamService.prepareContent(fileName, fileType, httpRangeList);
	}
	
	@GetMapping("/user/{user}/video/{folder}/{fileType}/{fileName}")
	public ResponseEntity<byte[]> streamVideo2(
			@RequestHeader(value = "Range", required = false) String httpRangeList,
			@PathVariable("fileType") String fileType, 
			@PathVariable String fileName,
			@PathVariable String folder,
			@PathVariable String user) {
		String fullFileName ="user/"+user+"/video/"+folder+"/"+fileName;
		//System.out.println(fullFileName);
		return videoStreamService.prepareContent(fullFileName, fileType, httpRangeList);
	}
	
}