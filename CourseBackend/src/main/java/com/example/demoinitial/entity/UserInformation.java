package com.example.demoinitial.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "user_information")
public class UserInformation {
	
	@Id
    @GeneratedValue
    @Column(name = "ID", nullable = false)
    private Long ID;
 
    @Column(name = "AVATAR", length = 255, nullable = true)
    private String avatar;
    
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "User_Id", nullable = false)
    private AppUser appUser;

	public Long getID() {
		return ID;
	}

	public void setID(Long iD) {
		ID = iD;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
    
    
   

}
