package vn.edu.topedu.entity.course.full;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
	private Boolean actived =true;
	

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
		return this.beforeResource + VariableConst.VIDEO_BEFORE + this.absPath();
	}

	@Override
//	@Mapping
	public void setBeforeResource(String beforeResource) {
		if (this.video != null)
			if (!this.video.contains("http")
//				||!this.video.contains("HTTP")
			) {
				super.setBeforeResource(beforeResource);
				//if(this.demo!=null)this.de
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
	@JsonIgnore
	public String absPath() {
		String filename = this.video;
		System.err.println(filename);
		Matcher m = Pattern.compile("^(.+)(_\\d*)\\.(mp4)$").matcher(filename);
		if (m.find()) {
			String name = m.group(1) + "_" + this.getId();
			String extend = m.group(3);

			System.err.println(String.format("Name: %s", name));
			System.err.println(String.format("Extend: %s", extend));
			filename = name + "." + extend;
			return filename;

		}
		m = Pattern.compile("^(.+)\\.(mp4)$").matcher(filename);
		if (m.find()) {
			String name = m.group(1) + "_" + this.getId();
			String extend = m.group(2);

//				System.err.println(String.format("Name: %s", name));
//				System.err.println(String.format("Extend: %s", extend));
			filename = name + "." + extend;
			return filename;
		}

		m = Pattern.compile("^(.+)(_\\d*)$").matcher(filename);
		if (m.find()) {
			String name = m.group(1) + "_" + this.getId();
			filename = name;

			return filename;
		}

		m = Pattern.compile("^(.+)$").matcher(filename);
		if (m.find()) {
			String name = m.group(1) + "_" + this.getId();
			//System.err.println(String.format("Name: %s", name));
//			System.err.println(String.format("Extend: %s", extend));
			filename = name;

			return filename;
		}
		return filename;
	}
}
