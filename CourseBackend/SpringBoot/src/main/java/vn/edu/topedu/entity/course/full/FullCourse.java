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
import vn.edu.topedu.entity.course.BaseCourse;
import vn.edu.topedu.utils.WebUtils;

@Entity
@Table(name = "Course")
@DynamicUpdate
@JsonInclude(JsonInclude.Include.NON_NULL)
public class FullCourse extends BaseCourse {

	
	@Column(name = "demo_id", length = 20, nullable = false)
	//@JsonIgnore
	private Long videoDemoId;
	
	@ManyToOne(cascade = CascadeType.REFRESH)
	@JoinColumn(name = "demo_id", referencedColumnName = "id" ,insertable = false, updatable = false)
	private VideoEntity demo;

	
	
	
	
	
	
	
	
	
	
	

	@OneToMany(mappedBy = "course", cascade= {CascadeType.ALL})
	private List<Learning> learnings;
	@OneToMany(mappedBy = "course")
	private List<Part> parts;
	
	@OneToMany(mappedBy = "fullCourse", fetch = FetchType.LAZY)
	@JsonIgnore
	private List<EvaluateEntity> evaluates;

	
	


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

	public Boolean getDeleted() {
		return deleted;
	}

	public void setDeleted(Boolean deleted) {
		this.deleted = deleted;
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

	
	public void setBeforeResource(String beforeResource) {
		super.setBeforeResource(beforeResource);
		if (this.parts != null)
			this.parts.forEach(e -> {
				if (e.getLessons() != null)
					e.getLessons().forEach(x -> {
						if (x.getVideo() != null)
							x.getVideo().setBeforeResource(beforeResource);
					});
			});
//		if(this.evaluates!=null)
//		for(EvaluateEntity e: this.getEvaluates()) {						
//			e.getUserPoster().getAvatar().setBeforeResource(beforeResource);
//		}

	}
	
	public boolean getIsFull() {
		return true;
	}
	public void setBeforeResource(HttpServletRequest httpServletRequest) {
		super.setBeforeResource(httpServletRequest);
		String beforeResource = WebUtils.getUrl(httpServletRequest);
		
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