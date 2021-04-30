package vn.edu.topedu.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import vn.edu.topedu.consts.VariableConst;
@Entity
@Table(name = "Resource_Image")
public class ResourceImage extends AHasResource {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private Long id;
	@Column(name = "img_path", length = 36, nullable = false)
	private String path;
	@Column(name = "updateAt", length = 36, nullable = false)
	private Date updateAt = new Date();
	@Column(name = "deleted", length = 36, nullable = false)
	@JsonIgnore
	private String deleted;
	
	
	public ResourceImage() {
		super();
	}
	public ResourceImage(Long id, String path, Date updateAt, String deleted) {
		super();
		this.id = id;
		this.path = path;
		this.updateAt = updateAt;
		this.deleted = deleted;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public Date getUpdateAt() {
		return updateAt;
	}
	public void setUpdateAt(Date updateAt) {
		this.updateAt = updateAt;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	public String getImage() {
		return (this.beforeResource!=null)?this.beforeResource:""+VariableConst.RESOURCE_BEFORE+this.path;
	}

}
