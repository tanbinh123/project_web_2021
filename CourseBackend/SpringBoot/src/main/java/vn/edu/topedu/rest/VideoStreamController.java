package vn.edu.topedu.rest;



import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/video")
public class VideoStreamController {
//
//	private final IVideoStreamService videoStreamService;
//
//	public VideoStreamController(IVideoStreamService videoStreamService) {
//		this.videoStreamService = videoStreamService;
//	}
//
//	@GetMapping("/stream/{fileType}/{fileName}")
//	public Mono<ResponseEntity<byte[]>> streamVideo(
//			@RequestHeader(value = "Range", required = false) String httpRangeList,
//			@PathVariable("fileType") String fileType, @PathVariable("fileName") String fileName) {
//		return Mono.just(videoStreamService.prepareContent(fileName, fileType, httpRangeList));
//	}
//	@GetMapping("")
//	public List<VideoResponse> videos() {
//		Video video=new Video(1,"image/mp4.jpg", 5000,"demo");
//		List<VideoResponse> videos= Arrays.asList(video.toResponse()
//				);
//		return videos;
//	}
}