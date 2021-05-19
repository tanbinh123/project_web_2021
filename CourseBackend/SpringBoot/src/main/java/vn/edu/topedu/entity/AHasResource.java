package vn.edu.topedu.entity;

import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

@MappedSuperclass
public abstract class AHasResource extends BaseEntity {
	@JsonIgnore
	@Transient
	protected String beforeResource;

	public String getBeforeResource() {
		return beforeResource;
	}

	public void setBeforeResource(String beforeResource) {
		
		this.beforeResource = beforeResource;
	}
	

}
