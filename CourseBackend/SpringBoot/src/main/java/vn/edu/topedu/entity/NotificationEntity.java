package vn.edu.topedu.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;

import vn.edu.topedu.AppUserPojo;


@JsonInclude(JsonInclude.Include.NON_NULL)
@Entity
@DynamicUpdate
@Table(name = "notifications")
public class NotificationEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private Long id;
	
	
	
	@Column(name = "deleted", length = 1, nullable = false)
	private Boolean deleted = false;
	
	@Column(name = "actived", length = 1, nullable = false)
	private Boolean actived = false;
	
	@Column(name = "Create_At", nullable = false)
	private Date createAt = new Date();
	
	@Column(name = "Update_At", nullable = false)
	private Date updateAt = new Date();

	@Column(name = "content", nullable = false)
	private String content ="";
	
	@Column(name = "name", nullable = false)
	private String name ="";
	
	@Column(name = "user_id", nullable = false)
	private Long userId;
	
	@Column(name = "user_sent_id", nullable = false)
	private Long userSentId;
	
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_sent_id", updatable=false, insertable=false)
	
	private AppUser appUserSent;
	
//	
	public AppUserPojo getAppUserSent() {
		if(this.appUserSent!=null)
		return AppUserPojo.toA(this.appUserSent);
		return null;
	}
	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getUserSentId() {
		return userSentId;
	}

	public void setUserSentId(Long userSentId) {
		this.userSentId = userSentId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public void setActived(Boolean actived) {
		this.actived = actived;
	}

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
	public void setBeforeResource(String beforeResource) {
		if (this.appUserSent != null)
			this.appUserSent.setBeforeResource(beforeResource);
		
	}

	
	
	


}
