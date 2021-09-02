package vn.edu.topedu.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "image_admin")
public class ImageAdminEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private Long id;

	@Column(name = "tag_name")
	private String tagName;
	
	@Column(name = "description", length = 255)
	private String description = "";
	// @JsonIgnore
	@Column(name = "image_id", nullable = false)
	private Long imageId;
	@ManyToOne
	@JoinColumn(name = "image_id", nullable = false, insertable = false, updatable = false)
	private ResourceImage image;

	

	@Column(name = "deleted", length = 1, nullable = false)
	private Boolean deleted = false;

	@Column(name = "Create_At", nullable = false)
	private Date createTime = new Date();

	@Column(name = "Update_At", nullable = false)
	private Date updateTime = new Date();

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
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

	

	

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Long getImageId() {
		return imageId;
	}

	public void setImageId(Long imageId) {
		this.imageId = imageId;
	}

	public ResourceImage getImage() {
		return image;
	}

	public void setImage(ResourceImage image) {
		this.image = image;
	}
	public void setBeforeResource(String beforeResource) {
		if(this.image!=null)this.image.setBeforeResource(beforeResource);

	}
	

}
