package vn.edu.topedu.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="templates")
public class TemplateEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private Integer id;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "actived")
	private Boolean actived;
	
	@Column(name = "deleted", length = 1, nullable = false)
	private Boolean deleted = false;
	
	@Column(name = "Create_Time", nullable = false)
	private Date createTime = new Date();
	
	@Column(name = "Update_Time", nullable = false)
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

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Boolean getActived() {
		return actived;
	}

	public void setActived(Boolean active) {
		this.actived = active;
	}
	
	


}
