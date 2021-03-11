package vn.edu.topedu.rest;



import java.util.Arrays;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.http.server.reactive.ServerHttpResponse;

import org.springframework.web.bind.annotation.*;

import reactor.core.publisher.Mono;
import vn.edu.topedu.model.Video;
import vn.edu.topedu.response.model.CourseResponse;
import vn.edu.topedu.service.IVideoStreamService;

@RestController
@RequestMapping("/video")
public class VideoStreamController {

	private final IVideoStreamService videoStreamService;

	public VideoStreamController(IVideoStreamService videoStreamService) {
		this.videoStreamService = videoStreamService;
	}

	@GetMapping("/stream/{fileType}/{fileName}")
	public Mono<ResponseEntity<byte[]>> streamVideo(ServerHttpResponse serverHttpResponse,
			@RequestHeader(value = "Range", required = false) String httpRangeList,
			@PathVariable("fileType") String fileType, @PathVariable("fileName") String fileName) {
		return Mono.just(videoStreamService.prepareContent(fileName, fileType, httpRangeList));
	}
	@GetMapping("")
	public List<CourseResponse> videos() {
		Video video=new Video(1,"image/mp4.jpg", 5000,"demo");
		List<CourseResponse> videos= Arrays.asList(video.toResponse()
				);
		return videos;
	}
}