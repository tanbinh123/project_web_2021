package vn.edu.topedu.entity;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

@MappedSuperclass
public abstract class AHasResource extends BaseEntity {
	@JsonIgnore
	@Transient
	protected String beforeResource;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_poster_id", nullable = true)
	@JsonIgnore
	private AppUser appUser;
	
	@Column(name = "count_linked", nullable = false, updatable=false)	
	private BigDecimal countLinked=BigDecimal.ZERO;
	
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

	public BigDecimal getCountLinked() {
		return countLinked;
	}

	public void setCountLinked(BigDecimal countLinked) {
		this.countLinked = countLinked;
	}
	

}
