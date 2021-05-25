package vn.edu.topedu.entity.course.full;

import java.math.BigDecimal;
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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import vn.edu.topedu.entity.AHasResource;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.BaseEntity;
import vn.edu.topedu.entity.CategoryEntity;
import vn.edu.topedu.entity.ResourceImage;

@Entity
@Table(name = "Course")
public class FullCourse extends BaseEntity {

	
	@Column(name = "demo_id", length = 20, nullable = false)
	@JsonIgnore
	private Long videoDemoId;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "demo_id", referencedColumnName = "id" ,insertable = false, updatable = false)
	private VideoEntity demo;

	@Column(name = "poster_id", nullable = false)
	@JsonIgnore
	private Long posterId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "poster_id", nullable = false, insertable = false, updatable = false)
	@JsonIgnore
	private AppUser appUser;
	
	
	
	@Column(name = "img_poster_id", nullable = false)
	@JsonIgnore
	private Long imgPosterId;
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "img_poster_id", referencedColumnName = "id", insertable = false, updatable = false)
	private ResourceImage poster;

	@Column(name = "description", length = 255)
	private String description = "";
	
	
	@Column(name = "title", length = 255, nullable = false)
	private String title = "";
	
	
	
	@Column(name = "price", length = 15, nullable = false)
	private BigDecimal price = new BigDecimal(0);

	@OneToMany(mappedBy = "course")
	private List<Learning> learnings;
	@OneToMany(mappedBy = "course")
	private List<Part> parts;

	@JsonIgnore
	@Column(name = "category_id", nullable = false)
	private Integer categoryId;
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "category_id", nullable = false, insertable = false, updatable = false)
	private CategoryEntity category;

	
	
	public Long getVideoDemoId() {
		return videoDemoId;
	}

	public void setVideoDemoId(Long videoDemoId) {
		this.videoDemoId = videoDemoId;
	}

	public Long getImgPosterId() {
		return imgPosterId;
	}

	public void setImgPosterId(Long imgPosterId) {
		this.imgPosterId = imgPosterId;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public CategoryEntity getCategory() {
		return category;
	}

	public void setCategory(CategoryEntity category) {
		this.category = category;
	}

	public List<Learning> getLearnings() {
		return learnings;
	}

	public FullCourse() {
		super();
	}

	public void setLearnings(List<Learning> learning) {
		this.learnings = learning;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
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
	
	public AppUser getAppUser() {
		return appUser;
	}

	public void setAppUser(AppUser appUser) {
		this.appUser = appUser;
	}
	
	

//	public int getPrice() {
//		return price;
//	}
//
//	public void setPrice(int price) {
//		this.price = price;
//	}


	public Long getPosterId() {
		return posterId;
	}

	public void setPosterId(Long posterId) {
		this.posterId = posterId;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}


	public VideoEntity getDemo() {
		return demo;
	}

	public void setDemo(VideoEntity demo) {
		this.demo = demo;
	}

	public List<Part> getParts() {
		return parts;
	}

	public void setParts(List<Part> parts) {
		this.parts = parts;
	}

	public ResourceImage getPoster() {
		return poster;
	}

	public void setPoster(ResourceImage poster) {
		this.poster = poster;
	}

	
	public void setBeforeResource(String beforeResource) {
		if (this.poster != null)
			this.poster.setBeforeResource(beforeResource);
		if (this.demo != null)
			this.demo.setBeforeResource(beforeResource);
		if (this.parts != null)
			this.parts.forEach(e -> {
				if (e.getLessons() != null)
					e.getLessons().forEach(x -> {
						if (x.getVideo() != null)
							x.getVideo().setBeforeResource(beforeResource);
					});
			});

	}


	
}