package vn.edu.topedu.entity;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

@MappedSuperclass
public abstract class AHasPoster extends BaseEntity {
	@JsonIgnore
	@Transient
	protected String beforeResource;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_poster_id", nullable = false)
	@JsonIgnore
	private AppUser appUser;
	
	
	
	
	public AppUser getAppUser() {
		return appUser;
	}

	public void setAppUser(AppUser appUser) {
		this.appUser = appUser;
	}

	public String getBeforeResource() {
		return beforeResource;
	}

	public void setBeforeResource(String beforeResource) {
		
		this.beforeResource = beforeResource;
	}

	

}
