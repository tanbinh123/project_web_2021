package com.example.demoinitial.rest;



import java.util.Arrays;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.http.server.reactive.ServerHttpResponse;

import org.springframework.web.bind.annotation.*;

import com.example.demoinitial.service.IVideoStreamService;


import model.Video;
import reactor.core.publisher.Mono;
import response.VideoJson;

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
	public List<VideoJson> videos() {
		Video video=new Video(1,"image/mp4.jpg", 5000,"demo");
		List<VideoJson> videos= Arrays.asList(video.toJsonObject()
				);
		return videos;
	}
}