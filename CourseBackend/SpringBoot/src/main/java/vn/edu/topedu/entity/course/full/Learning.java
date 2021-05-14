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
	private Integer id;
	@Column(name = "learning", nullable = false)
	private String learning;
	@ManyToOne
	@JoinColumn(name = "course_id")
	@JsonIgnore
	private PreviewCourseEntity course;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLearning() {
		return learning;
	}

	public void setLearning(String learning) {
		this.learning = learning;
	}

}
