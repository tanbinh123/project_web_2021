package vn.edu.topedu.entity;

import java.security.NoSuchAlgorithmException;
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

import vn.edu.topedu.utils.WebUtils;

@Entity
@Table(name = "Active_Account")
public class ActiveAccount {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private Integer id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "User_Id", nullable = false)
	private AppUser appUser;

	@Column(name = "Code", length = 255, nullable = false)
	private String code = "";
	@Column(name = "Create_Time", nullable = false)
	private Date createTime = new Date();
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public AppUser getAppUser() {
		return appUser;
	}
	public void setAppUser(AppUser appUser) {
		this.appUser = appUser;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public void genderCode(String username) {
		try {
			this.code=WebUtils.convertHashToString(this.createTime.toGMTString()+username);
		} catch (NoSuchAlgorithmException e) {
			
		}
		
	}
	
	
}
