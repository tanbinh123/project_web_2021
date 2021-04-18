package vn.edu.topedu.entity.detailcourse;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import vn.edu.topedu.consts.VariableConst;
import vn.edu.topedu.entity.AHasResource;

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
	@OneToOne(mappedBy = "demo")
	@JsonIgnore
	private DetailCourseEntity course;
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
	public DetailCourseEntity getCourse() {
		return course;
	}
	public void setCourse(DetailCourseEntity course) {
		this.course = course;
	}
	public String getUrlVideo() {
		return this.beforeResource+VariableConst.VIDEO_BEFORE+ this.video;
	}
	

}
