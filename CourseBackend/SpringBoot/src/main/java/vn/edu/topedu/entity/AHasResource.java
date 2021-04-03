package vn.edu.topedu.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

public abstract class AHasResource {
	@JsonIgnore
	protected String beforeResource;

	public String getBeforeResource() {
		return beforeResource;
	}

	public void setBeforeResource(String beforeResource) {
		this.beforeResource = beforeResource;
	}
	

}
