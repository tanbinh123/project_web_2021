package vn.edu.topedu.dto;

import vn.edu.topedu.entity.AppRole;

public class DTOAppRole {

	private Long id;

	private String roleName;
	

	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getRoleName() {
		return roleName;
	}


	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}


	public static DTOAppRole cover(AppRole that) {
		if(that==null)return null;
		DTOAppRole appRole = new DTOAppRole();
		appRole.id = that.getId();
		appRole.roleName = that.getRoleName();
		return appRole;
	}

}