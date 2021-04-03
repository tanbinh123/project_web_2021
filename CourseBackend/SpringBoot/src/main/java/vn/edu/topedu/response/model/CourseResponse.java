package vn.edu.topedu.response.model;

import java.util.Date;

import org.springframework.http.server.reactive.ServerHttpRequest;

public class CourseResponse {
	private int id;
	private String title;
    private String description;
    private String thumbnail;
    private String imgAvatar;
    private String nameAuthor;
    private double rateStar;
    private int price;
    private int bought;
    private Date updateAt;
    
	
	public CourseResponse(int id, String title, String description, String thumbnail, String imgAvatar,
			String nameAuthor, double rateStar, int price,int bought, Date updateAt) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.thumbnail = thumbnail;
		this.imgAvatar = imgAvatar;
		this.nameAuthor = nameAuthor;
		this.rateStar = rateStar;
		this.price=price;
		this.bought=bought;
		this.updateAt=updateAt;
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
	public void updateResource(String before) {
		this.imgAvatar=before+this.imgAvatar;
		this.thumbnail=before+this.thumbnail;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getBought() {
		return bought;
	}
	public void setBought(int bought) {
		this.bought = bought;
	}
	public Date getUpdateAt() {
		return updateAt;
	}
	public void setUpdateAt(Date updateAt) {
		this.updateAt = updateAt;
	}
	
	
	
    

}
