package vn.edu.topedu.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import vn.edu.topedu.json.CustomDateFullSerializer;


@MappedSuperclass
public class BaseEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	protected Long id;
	
	
	
	@Column(name = "deleted", length = 1, nullable = false)
	protected Boolean deleted = false;
	
	@Column(name = "Create_At", nullable = false)
	//@JsonSerialize(using = CustomDateFullSerializer.class)
	protected Date createAt = new Date();
	
	@Column(name = "Update_At", nullable = false)
	@JsonSerialize(using = CustomDateFullSerializer.class)
	protected Date updateAt = new Date();

	

	

	public Date getCreateAt() {
		return createAt;
	}

	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}

	public Date getUpdateAt() {
		return updateAt;
	}

	public void setUpdateAt(Date updateAt) {
		this.updateAt = updateAt;
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


	
	
	


}
