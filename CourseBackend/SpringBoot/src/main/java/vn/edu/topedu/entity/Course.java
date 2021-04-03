package vn.edu.topedu.entity;
 
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
 
@Entity

@Table(name = "Course")
public class Course extends AHasResource {
     
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;
 
    @Column(name = "poster", length = 255, nullable = false)
    @JsonIgnore
    private String poster="image/avatar/momo.webp";
    @Column(name = "description", length = 255, nullable = false)
    private String description="";
    @Column(name = "title", length = 255, nullable = false)
    private String title="";
    @Column(name = "update_at", nullable = false)
    private Date updateAt=new Date();
    @Column(name = "price", length = 10, nullable = false)
    private int price=0;
    @Column(name = "bought", length = 10, nullable = false)
    private int bought=0;
    @Column(name = "ratestar", length = 10, nullable = false)
    private double ratestar=0;
    
    @Column(name = "Deleted", length = 1, nullable = false )
    private Boolean deleted =false;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
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
	public double getRatestar() {
		return ratestar;
	}
	public void setRatestar(double ratestar) {
		this.ratestar = ratestar;
	}
	public Date getUpdateAt() {
		return updateAt;
	}
	public void setUpdateAt(Date updateAt) {
		this.updateAt = updateAt;
	}
	
	public String getThumbnail() {
		return this.beforeResource+this.poster;
	}
	
	
	
	
	
	
    
 
  
}