package vn.edu.topedu.entity.course.full;

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
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import vn.edu.topedu.entity.previewcourse.PreviewCourseEntity;

@Entity
@Table(name = "part")
public class Part {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	//@JsonIgnore
	private Long id;
	@Column(name = "title", nullable = false)
	private String title ="";
	
	@Column(name = "course_id", nullable = false)
	private Long courseId = Long.valueOf(0);
	@ManyToOne
	@JoinColumn(name = "course_id", insertable = false, updatable = false)
	@JsonIgnore
	private FullCourse course;
	
	@OneToMany( mappedBy = "part")
	private List<Lesson> lessons;

	
	@Column(name = "deleted", length = 1, nullable = false)
	private Boolean deleted = false;
	
	
	
	public Long getCourseId() {
		return courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}

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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public FullCourse getCourse() {
		return course;
	}

	public void setCourse(FullCourse course) {
		this.course = course;
	}

	public List<Lesson> getLessons() {
		return lessons;
	}

	public void setLessons(List<Lesson> lessons) {
		this.lessons = lessons;
	}

	
	

	

}