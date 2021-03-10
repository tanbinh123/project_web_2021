package model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import fileprocess.FileProcess;
import response.VideoJson;

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
	public VideoJson toJsonObject(){
		VideoJson videoJson= new VideoJson();
		videoJson.setId(this.id);
		
		String dura=String.format("%d min, %d sec", 
			    TimeUnit.MILLISECONDS.toMinutes(this.durations),
			    TimeUnit.MILLISECONDS.toSeconds(this.durations) - 
			    TimeUnit.MINUTES.toSeconds(TimeUnit.MILLISECONDS.toMinutes(this.durations))
			);
		videoJson.setDurations(dura);
		videoJson.setName(this.name);
		videoJson.setPoster(FileProcess.encodeFileToBase64(this.poster));
		return videoJson;
	}
	
}
