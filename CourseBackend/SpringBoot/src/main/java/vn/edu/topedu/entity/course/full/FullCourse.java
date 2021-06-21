package vn.edu.topedu.entity.course.full;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.annotations.DynamicUpdate;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;

import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.BaseEntity;
import vn.edu.topedu.entity.CategoryEntity;
import vn.edu.topedu.entity.EvaluateEntity;
import vn.edu.topedu.entity.ResourceImage;
import vn.edu.topedu.utils.WebUtils;

@Entity
@Table(name = "Course")
@DynamicUpdate
@JsonInclude(JsonInclude.Include.NON_NULL)
public class FullCourse extends BaseEntity {

	
	@Column(name = "demo_id", length = 20, nullable = false)
	@JsonIgnore
	private Long videoDemoId;
	
	@ManyToOne(cascade = CascadeType.REFRESH)
	@JoinColumn(name = "demo_id", referencedColumnName = "id" ,insertable = false, updatable = false)
	private VideoEntity demo;

	@Column(name = "user_poster_id", nullable = false)
	@JsonIgnore
	private Long userPosterId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_poster_id", nullable = false, insertable = false, updatable = false)
	@JsonIgnore
	private AppUser userPoster;
	
	
	
	@Column(name = "img_poster_id", nullable = false)
	@JsonIgnore
	private Long imagePosterId;
	
	@ManyToOne(cascade = CascadeType.REFRESH)
	@JoinColumn(name = "img_poster_id", referencedColumnName = "id", insertable = false, updatable = false)
	private ResourceImage imagePoster;

	@Column(name = "description", length = 255)
	private String description = "";
	
	
	@Column(name = "title", length = 255, nullable = false)
	private String title = "";
	
	
	
	@Column(name = "price", length = 15, nullable = false)
	private BigDecimal price = new BigDecimal(0);

	@OneToMany(mappedBy = "course", cascade= {CascadeType.REFRESH})
	private List<Learning> learnings;
	@OneToMany(mappedBy = "course")
	private List<Part> parts;
	
	@OneToMany(mappedBy = "fullCourse", fetch = FetchType.EAGER)
	private List<EvaluateEntity> evaluates;

	@JsonIgnore
	@Column(name = "category_id", nullable = false)
	private Integer categoryId;
	@ManyToOne
	@JoinColumn(name = "category_id", nullable = false, insertable = false, updatable = false)
	private CategoryEntity category;

	@Column(name = "actived", length = 1, nullable = false)
	protected Boolean actived = true;
	
	
	
	public List<EvaluateEntity> getEvaluates() {
		return evaluates;
	}

	public void setEvaluates(List<EvaluateEntity> evaluates) {
		this.evaluates = evaluates;
	}

	public Boolean getActived() {
		return actived;
	}

	public void setActived(Boolean actived) {
		this.actived = actived;
	}

	public Long getVideoDemoId() {
		return videoDemoId;
	}

	public void setVideoDemoId(Long videoDemoId) {
		this.videoDemoId = videoDemoId;
	}

	

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	
	public AppUser getUserPoster() {
		return userPoster;
	}

	public void setUserPoster(AppUser userPoster) {
		this.userPoster = userPoster;
	}

	public Long getImagePosterId() {
		return imagePosterId;
	}

	public void setImagePosterId(Long imagePosterId) {
		this.imagePosterId = imagePosterId;
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

	public void setLearnings(List<Learning> learnings) {
		this.learnings = learnings;
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
	
	
	
	



	public Long getUserPosterId() {
		return userPosterId;
	}

	public void setUserPosterId(Long posterId) {
		this.userPosterId = posterId;
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

	public ResourceImage getImagePoster() {
		return imagePoster;
	}

	public void setImagePoster(ResourceImage poster) {
		this.imagePoster = poster;
	}

	
	public void setBeforeResource(String beforeResource) {
		if (this.imagePoster != null)
			this.imagePoster.setBeforeResource(beforeResource);
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
		
		for(EvaluateEntity e: this.getEvaluates()) {						
			e.getUserPoster().getAvatar().setBeforeResource(beforeResource);
		}

	}
	
	
	public void setBeforeResource(HttpServletRequest httpServletRequest) {
		String beforeResource = WebUtils.getUrl(httpServletRequest);
		if (this.imagePoster != null)
			this.imagePoster.setBeforeResource(beforeResource);
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