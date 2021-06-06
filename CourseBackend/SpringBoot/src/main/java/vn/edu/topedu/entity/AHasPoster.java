package vn.edu.topedu.entity;

import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

import com.fasterxml.jackson.annotation.JsonIgnore;

@MappedSuperclass
public abstract class AHasPoster extends BaseEntity {
	
	
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

	

	

}
