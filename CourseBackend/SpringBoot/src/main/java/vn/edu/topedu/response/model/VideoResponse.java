package vn.edu.topedu.response.model;

import vn.edu.topedu.json.JsonResponse;

public class VideoResponse  implements JsonResponse {
	private int id;
	private String poster;
	private String durations;//ms
	private String name;
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
	public String getDurations() {
		return durations;
	}
	public void setDurations(String durations) {
		this.durations = durations;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	

}
