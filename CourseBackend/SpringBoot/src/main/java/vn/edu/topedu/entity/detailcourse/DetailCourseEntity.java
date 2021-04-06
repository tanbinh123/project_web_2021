package vn.edu.topedu.entity.detailcourse;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import vn.edu.topedu.entity.AHasResource;

@Entity
@Table(name = "Course")
public class DetailCourseEntity extends AHasResource {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private Integer id;
	@Column(name = "poster", length = 255)
	@JsonIgnore
	private String poster = "image/avatar/momo.webp";
	@Column(name = "description", length = 255)
	private String description = "";
	@Column(name = "title", length = 255, nullable = false)
	private String title = "";
	@Column(name = "update_at", nullable = false)
	private Date updateAt = new Date();
	@Column(name = "price", length = 10, nullable = false)
	private int price = 0;
	
	@JsonIgnore
	@Column(name = "Deleted", length = 1, nullable = false)
	private Boolean deleted = false;
	@OneToMany(mappedBy = "course")
	private List<Learning> learning;
	@OneToMany(mappedBy = "course")
	private List<Part> parts;

	public List<Learning> getLearning() {
		return learning;
	}

	public void setLearning(List<Learning> learning) {
		this.learning = learning;
	}

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

	

	
	public Date getUpdateAt() {
		return updateAt;
	}

	public void setUpdateAt(Date updateAt) {
		this.updateAt = updateAt;
	}
	

//	public String getThumbnail() {
//		return this.beforeResource+this.poster;
//	}
//	
//	
//	public String getImgAvatar() {
//		return this.beforeResource+appUser.getAvater();
//	}
//	
//	public String getNameAuthor() {
//		return appUser.getUsername();
//	}

	public List<Part> getParts() {
		return parts;
	}

	public void setParts(List<Part> parts) {
		this.parts = parts;
	}


	
	

}