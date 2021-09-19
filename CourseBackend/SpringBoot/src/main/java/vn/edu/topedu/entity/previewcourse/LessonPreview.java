package vn.edu.topedu.entity.previewcourse;

import java.math.BigDecimal;
import java.util.concurrent.TimeUnit;

import javax.persistence.CascadeType;
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

import vn.edu.topedu.entity.course.full.VideoEntity;

@Entity
@Table(name = "lesson")
public class LessonPreview  {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	//@JsonIgnore
	private Long id;
	@Column(name = "description", nullable = false)
	private String description;
	@OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "video_id", referencedColumnName = "id")
	@JsonIgnore
	private VideoEntity video;
	@ManyToOne
	@JoinColumn(name = "part_id")
	@JsonIgnore
	private PartReview part;
	
	@Column(name = "duration", nullable = false)
	private long duration;
	

	public long getDuration() {
		return duration;
	}

	public void setDuration(long duration) {
		this.duration = duration;
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

	public PartReview getPart() {
		return part;
	}

	public void setPart(PartReview part) {
		this.part = part;
	}

	public VideoEntity getVideo() {
		return video;
	}

	public void setVideo(VideoEntity video) {
		this.video = video;
	}
	
	public String getStrDuration() {
		 long seconds
        =this.duration/1000;
		 long minutes
        = TimeUnit.MILLISECONDS.toMinutes(seconds);

    // This method uses this formula seconds =
    // (milliseconds / 1000);
     seconds
        = (TimeUnit.MILLISECONDS.toSeconds(seconds)
           % 60);
		return String.format("%s min %s s", minutes, seconds);
	}
	

	
}
