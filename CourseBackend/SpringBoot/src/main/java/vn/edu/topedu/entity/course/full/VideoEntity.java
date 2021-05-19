package vn.edu.topedu.entity.course.full;

import java.util.List;

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

import com.fasterxml.jackson.annotation.JsonIgnore;

import vn.edu.topedu.consts.VariableConst;
import vn.edu.topedu.entity.AHasResource;
import vn.edu.topedu.entity.previewcourse.PreviewCourseEntity;

@Entity
@Table(name = "video")
public class VideoEntity extends AHasResource {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private Long id;
	@Column(name = "video", nullable = false)
	@JsonIgnore
	private String video;

	@OneToMany(mappedBy = "demo")
	@JsonIgnore
	private List<PreviewCourseEntity> detailCourses;

	@Column(name = "actived")
	private Boolean actived;

	@Column(name = "deleted", length = 1, nullable = false)
	private Boolean deleted = false;

	// @OneToMany(mappedBy = "demo")
//	@JsonIgnore
//	private List<Course> courses;

	public Boolean getDeleted() {
		return deleted;
	}

	public void setDeleted(Boolean deleted) {
		this.deleted = deleted;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public Boolean getActived() {
		return actived;
	}

	public void setActived(Boolean actived) {
		this.actived = actived;
	}

	public String getUrlVideo() {
		return this.beforeResource + VariableConst.VIDEO_BEFORE + this.video;
	}
	
	@Override
//	@Mapping
	public void setBeforeResource(String beforeResource) {
		if(this.video!=null)
		if(!this.video.contains("http")
//				||!this.video.contains("HTTP")
				) {
			super.setBeforeResource(beforeResource);
		}
	}

	public List<PreviewCourseEntity> getDetailCourses() {
		return detailCourses;
	}

	public void setDetailCourses(List<PreviewCourseEntity> detailCourses) {
		this.detailCourses = detailCourses;
	}
//	public List<Course> getCourses() {
//		return courses;
//	}
//	public void setCourses(List<Course> courses) {
//		this.courses = courses;
//	}

}
