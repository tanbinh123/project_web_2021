package vn.edu.topedu.entity.previewcourse;

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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.servlet.http.HttpServletRequest;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import vn.edu.topedu.entity.AHasPoster;
import vn.edu.topedu.entity.AHasResource;
import vn.edu.topedu.entity.EvaluateEntity;
import vn.edu.topedu.entity.OwerCourse;
import vn.edu.topedu.entity.ResourceImage;
import vn.edu.topedu.entity.course.BaseCourse;
import vn.edu.topedu.entity.course.full.Learning;
import vn.edu.topedu.entity.course.full.Part;
import vn.edu.topedu.entity.course.full.VideoEntity;
import vn.edu.topedu.utils.WebUtils;

@Entity
@Table(name = "Course")
public class PreviewCourseEntity extends BaseCourse {




	
	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "demo_id", referencedColumnName = "id")
	private VideoEntity demo;
	

	@OneToMany(mappedBy = "course")
	private List<Learning> learnings;
	
	
	@OneToMany(mappedBy = "course")
	private List<PartReview> parts;
//	@OneToMany(mappedBy = "detailCourseEntity")
//	@JsonIgnore
//	private List<OwerCourse> owerCourse;
	
	

	public List<Learning> getLearnings() {
		return learnings;
	}

	public boolean getIsFull() {
		return false;
	}

	public PreviewCourseEntity() {
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

	public List<PartReview> getParts() {
		return parts;
	}

	public void setParts(List<PartReview> parts) {
		this.parts = parts;
	}

	

	public void setBeforeResource(String bf) {
		super.setBeforeResource(bf);
		
		if (this.demo != null)
			this.demo.setBeforeResource(bf);
		
	}
	public void setBeforeResource(HttpServletRequest httpServletRequest) {
		super.setBeforeResource(httpServletRequest);
		String bf = WebUtils.getUrl(httpServletRequest);
		
		if (this.demo != null)
			this.demo.setBeforeResource(bf);
	
	}

}