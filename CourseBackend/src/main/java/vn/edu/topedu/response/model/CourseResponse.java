package vn.edu.topedu.response.model;

public class CourseResponse {
	private int id;
	private String title;
    private String description;
    private String thumbnail;
    private String imgAvatar;
    private String nameAuthor;
    private double rateStar;
    
	
	public CourseResponse(int id, String title, String description, String thumbnail, String imgAvatar,
			String nameAuthor, double rateStar) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.thumbnail = thumbnail;
		this.imgAvatar = imgAvatar;
		this.nameAuthor = nameAuthor;
		this.rateStar = rateStar;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getImgAvatar() {
		return imgAvatar;
	}
	public void setImgAvatar(String imgAvatar) {
		this.imgAvatar = imgAvatar;
	}
	public String getNameAuthor() {
		return nameAuthor;
	}
	public void setNameAuthor(String nameAuthor) {
		this.nameAuthor = nameAuthor;
	}
	public double getRateStar() {
		return rateStar;
	}
	public void setRateStar(double rateStar) {
		this.rateStar = rateStar;
	}
	
	
    

}
