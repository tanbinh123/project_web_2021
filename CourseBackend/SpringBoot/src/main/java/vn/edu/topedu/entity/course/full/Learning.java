package vn.edu.topedu.entity.course.full;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import vn.edu.topedu.entity.previewcourse.PreviewCourseEntity;

@Entity
@Table(name = "learning")
public class Learning {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	//@JsonIgnore
	private Long id;// = Long.valueOf(0);
	@Column(name = "learning", nullable = false)
	private String learning;
	@Column(name = "course_id", nullable = false)
	@JsonIgnore
	private Long courseId;
	@ManyToOne
	@JoinColumn(name = "course_id",insertable = false, updatable = false)
	@JsonIgnore
	private FullCourse course;
	
	@Column(name = "deleted", length = 1, nullable = false)
	private Boolean deleted = false;

	
	
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

	public String getLearning() {
		return learning;
	}
	

	public Long getCourseId() {
		return courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}

	public void setLearning(String learning) {
		this.learning = learning;
	}

	public FullCourse getCourse() {
		return course;
	}

	public void setCourse(FullCourse course) {
		this.course = course;
	}

	@Override
	public String toString() {
		return "Learning [id=" + id + ", learning=" + learning + ", courseId=" + courseId + ", course=" + course
				+ ", deleted=" + deleted + "]";
	}
	
	

}
