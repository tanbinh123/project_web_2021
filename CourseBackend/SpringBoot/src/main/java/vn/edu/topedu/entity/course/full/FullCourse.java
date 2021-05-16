package vn.edu.topedu.entity.course.full;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import vn.edu.topedu.entity.AHasResource;
import vn.edu.topedu.entity.CategoryEntity;
import vn.edu.topedu.entity.OwerCourse;
import vn.edu.topedu.entity.ResourceImage;

@Entity
@Table(name = "Course")
public class FullCourse extends AHasResource {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private Long id;

	@JsonIgnore
	@Column(name = "img_poster_id", nullable = false)
	private Long imgPosterId;
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "img_poster_id", referencedColumnName = "id", insertable = false, updatable = false)
	// @Transient
	private ResourceImage poster;

	@Column(name = "description", length = 255)
	private String description = "";
	@Column(name = "title", length = 255, nullable = false)
	private String title = "";
	@ManyToOne(cascade = CascadeType.ALL)
//	@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
	@JoinColumn(name = "demo_id", referencedColumnName = "id")
	private VideoEntity demo;
	@Column(name = "update_at", nullable = false)
	private Date updateAt = new Date();
	@Column(name = "price", length = 15, nullable = false)
	private BigDecimal price = new BigDecimal(0);

	@JsonIgnore
	@Column(name = "Deleted", length = 1, nullable = false)
	private Boolean deleted = false;
	@OneToMany(mappedBy = "course")
	private List<Learning> learnings;
	@OneToMany(mappedBy = "course")
	private List<Part> parts;

	@JsonIgnore
	@Column(name = "category_id", nullable = false)
	private Integer categoryId;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "category_id", nullable = false, insertable = false, updatable = false)
	private CategoryEntity category;

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

//	public int getPrice() {
//		return price;
//	}
//
//	public void setPrice(int price) {
//		this.price = price;
//	}

	public Date getUpdateAt() {
		return updateAt;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public void setUpdateAt(Date updateAt) {
		this.updateAt = updateAt;
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

	@Override
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

		super.setBeforeResource(beforeResource);
	}

}