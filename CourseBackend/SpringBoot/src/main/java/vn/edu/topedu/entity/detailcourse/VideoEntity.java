package vn.edu.topedu.entity.detailcourse;

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
import vn.edu.topedu.entity.Course;

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
	private List<DetailCourseEntity> detailCourses;
	
//	@OneToMany(mappedBy = "demo")
//	@JsonIgnore
//	private List<Course> courses;
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
	
	
	public String getUrlVideo() {
		return this.beforeResource+VariableConst.VIDEO_BEFORE+ this.video;
	}
	public List<DetailCourseEntity> getDetailCourses() {
		return detailCourses;
	}
	public void setDetailCourses(List<DetailCourseEntity> detailCourses) {
		this.detailCourses = detailCourses;
	}
//	public List<Course> getCourses() {
//		return courses;
//	}
//	public void setCourses(List<Course> courses) {
//		this.courses = courses;
//	}
	
	

}
