package vn.edu.topedu.entity.course.full;

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

@Entity
@Table(name = "lesson")
public class Lesson  {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	//@JsonIgnore
	private Long id;
	@Column(name = "description", nullable = false)
	private String description;
	@OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "video_id", referencedColumnName = "id", insertable = false, updatable = false)
	private VideoEntity video;
	@ManyToOne
	@JoinColumn(name = "part_id", insertable = false, updatable = false)
	@JsonIgnore
	private Part part;
	
	@Column(name = "part_id", nullable = false)
	private Long partId;
	
	@Column(name = "video_id", nullable = false)
	private Long videoId;
	
	@Column(name = "duration", nullable = false)
	private long duration;
	
	
	@Column(name = "deleted", length = 1, nullable = false)
	private Boolean deleted = false;

	
	
	public long getDuration() {
		return duration;
	}

	public void setDuration(long duration) {
		this.duration = duration;
	}

	public Long getVideoId() {
		return videoId;
	}

	public void setVideoId(Long videoId) {
		this.videoId = videoId;
	}

	public Boolean getDeleted() {
		return deleted;
	}

	public Long getPartId() {
		return partId;
	}

	public void setPartId(Long partId) {
		this.partId = partId;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Part getPart() {
		return part;
	}

	public void setPart(Part part) {
		this.part = part;
	}

	public VideoEntity getVideo() {
		return video;
	}

	public void setVideo(VideoEntity video) {
		this.video = video;
	}

	@Override
	public String toString() {
		return "Lesson [id=" + id + ", description=" + description + ", video=" + video + ", part=" + part + ", partId="
				+ partId + ", videoId=" + videoId + ", deleted=" + deleted + "]";
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
