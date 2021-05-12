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

import com.fasterxml.jackson.annotation.JsonIgnore;

import vn.edu.topedu.utils.WebUtils;

@Entity
@Table(name = "Request_Reset_Password")
public class RequestResetPassword {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private Integer id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "User_Id", nullable = false)
	private AppUser appUser;

	@Column(name = "Code", length = 255, nullable = false)
	private String code = "";
	@Column(name = "Time", nullable = false)
	private Date time = new Date();
	
	@JsonIgnore
    @Column(name = "Alive", length = 1, nullable = false )
    private Boolean alive =true;
    
	public Boolean getAlive() {
		return alive;
	}
	public void setAlive(Boolean alive) {
		this.alive = alive;
	}
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
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public void genderCode(String username) {
		try {
			this.code=WebUtils.convertHashToString(this.time.toGMTString()+username);
		} catch (NoSuchAlgorithmException e) {
			
		}
		
	}
	
	
}
