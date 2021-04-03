package vn.edu.topedu.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
	@Column(name = "bought", length = 10, nullable = false)
	private int bought = 0;
	@Column(name = "rateStar", length = 10, nullable = false)
	private double rateStar = 0;
	@JsonIgnore
	@Column(name = "Deleted", length = 1, nullable = false)
	private Boolean deleted = false;
	@OneToMany(mappedBy = "course")

	private List<Learning> learning;

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

	public int getBought() {
		return bought;
	}

	public void setBought(int bought) {
		this.bought = bought;
	}

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

	@Entity
	@Table(name = "learning")
	public static class Learning {

		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name = "id", nullable = false)
		private Integer id;
		@Column(name = "learning", nullable = false)
		private String learning;
		@ManyToOne
		@JoinColumn(name = "course_id")
		@JsonIgnore
		private DetailCourseEntity course;

		public Integer getId() {
			return id;
		}

		public void setId(Integer id) {
			this.id = id;
		}

		public String getLearning() {
			return learning;
		}

		public void setLearning(String learning) {
			this.learning = learning;
		}

	}

}