package vn.edu.topedu.entity;
 
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
 
@Entity
@Table(name = "Course")
public class Course extends AHasResource {
     
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;
 
    
    
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "poster", referencedColumnName = "id")
    @JsonIgnore
    private ResourceImage poster;
    
    
    @Column(name = "description", length = 255)
    private String description="";
    @Column(name = "title", length = 255, nullable = false)
    private String title="";
    @Column(name = "update_at", nullable = false)
    private Date updateAt=new Date();
    @Column(name = "price", length = 10, nullable = false)
    private int price=0;
    @Column(name = "bought", length = 10, nullable = false)
    private int bought=0;
    @Column(name = "rateStar", length = 10, nullable = false)
    private double rateStar=0;
    @JsonIgnore
    @Column(name = "Deleted", length = 1, nullable = false )
    private Boolean deleted =false;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "poster_id", nullable = false)
    @JsonIgnore
    private AppUser appUser;
    
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Boolean getDeleted() {
		return deleted;
	}
	public void setDeleted(Boolean deleted) {
		this.deleted = deleted;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
//	public byte getRateStar() {
//		return (byte)Math.round(rateStar);
//	}
	public double getRateStar() {
		return rateStar;
	}
	public void setRateStar(double rateStar) {
		this.rateStar = rateStar;
	}
	public Date getUpdateAt() {
		return updateAt;
	}
	public void setUpdateAt(Date updateAt) {
		this.updateAt = updateAt;
	}
	
	public String getThumbnail() {
		return this.beforeResource+this.poster.getPath();
	}
	
	
	public String getImgAvatar() {
		return this.beforeResource+appUser.getAvater();
	}
	
	public String getNameAuthor() {
		return appUser.getUsername();
	}
	
	
	
	
	
	
    
 
  
}