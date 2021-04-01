package vn.edu.topedu.model;

import fileprocess.FileProcess;
import vn.edu.topedu.response.model.VideoResponse;
import vn.edu.topedu.utils.WebUtils;

public class Video {
	private int id;
	private String poster;
	private long durations;//ms
	private String name;
	
	public Video() {
		super();
	}
	public Video(int id, String poster, long durations, String name) {
		super();
		this.id = id;
		this.poster = poster;
		this.durations = durations;
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public long getDurations() {
		return durations;
	}
	public void setDurations(long durations) {
		this.durations = durations;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public VideoResponse toResponse(){
		VideoResponse course= new VideoResponse();
		course.setId(this.id);
		course.setDurations(WebUtils.miliSecondToDuration(this.durations));
		course.setName(this.name);
		course.setPoster(FileProcess.encodeFileToBase64(this.poster));
		return course;
	}
	
}
