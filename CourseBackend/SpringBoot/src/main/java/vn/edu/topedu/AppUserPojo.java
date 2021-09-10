package vn.edu.topedu;

import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.ResourceImage;

public  class AppUserPojo{
	private String userName;
	private String email;
	private String fullname;
	private ResourceImage avatar;
	
	public static AppUserPojo toA(AppUser appUser) {
		if(appUser==null)return null;
		AppUserPojo a = new AppUserPojo();
		a.setFullname(appUser.getFullname());
		a.setUserName(appUser.getUsername());
		a.setEmail(appUser.getEmail());
		a.setAvatar(appUser.getAvatar());
		return a;
	}
	

	public ResourceImage getAvatar() {
		return avatar;
	}


	public void setAvatar(ResourceImage avatar) {
		this.avatar = avatar;
	}


	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	
}
