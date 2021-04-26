package vn.edu.topedu.entity;

import java.util.Collection;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.fasterxml.jackson.annotation.JsonIgnore;

import vn.edu.topedu.entity.detailcourse.Learning;

@Entity
@Table(name = "App_User", //
		uniqueConstraints = { //
				@UniqueConstraint(name = "email_uq", columnNames = "email"),
				@UniqueConstraint(name = "APP_USER_UK", columnNames = "User_Name") })
public class AppUser extends AHasResource implements UserDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)

	private Long id;

	@Column(name = "User_Name", length = 36, nullable = false)
	private String userName;

	@Column(name = "Encryted_Password", length = 128, nullable = false)
	@JsonIgnore
	private String encrytedPassword;

	@Column(name = "actived", length = 1, nullable = false)
	private Boolean actived = false;
	
	@Column(name = "Enabled", length = 1, nullable = false)
	@JsonIgnore
	private Boolean enabled = false;
	
	@Column(name = "deleted", length = 1, nullable = false)
	@JsonIgnore
	private Boolean deleted = false;
	
	@OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "avatar_id", referencedColumnName = "id")
    private ResourceImage avatar;
	
	@Column(name = "Email", length = 255, nullable = false)
	private String email;
	
	@JsonIgnore
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "user_role", 
	joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id"), 
	inverseJoinColumns = @JoinColumn(name = "role_id", referencedColumnName = "id"))
	private List<AppRole> authorities;
	
	@OneToMany(mappedBy = "appUser")
	private List<UserRole> userRoles;
	
	


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEncrytedPassword() {
		return encrytedPassword;
	}

	public void setEncrytedPassword(String encrytedPassword) {
		this.encrytedPassword = encrytedPassword;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Boolean getDeleted() {
		return deleted;
	}

	public void setDeleted(Boolean deleted) {
		this.deleted = deleted;
	}

	

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return this.authorities;
	}

	@Override
	@JsonIgnore
	public String getPassword() {
		return this.encrytedPassword;
	}

	@Override
	@JsonIgnore
	public String getUsername() {
		return this.userName;
	}

	@Override
	@JsonIgnore
	public boolean isAccountNonExpired() {
		return false;
	}

	@Override
	@JsonIgnore
	public boolean isAccountNonLocked() {
		return false;
	}

	@Override
	@JsonIgnore
	public boolean isCredentialsNonExpired() {
		return false;
	}

	@Override
	public boolean isEnabled() {
		return this.enabled;
	}

	public ResourceImage getAvatar() {
		return avatar;
	}

	public void setAvatar(ResourceImage avatar) {
		this.avatar = avatar;
	}

	public void setAuthorities(List<AppRole> authorities) {
		this.authorities = authorities;
	}

	public List<UserRole> getUserRoles() {
		return userRoles;
	}

	public void setUserRoles(List<UserRole> userRoles) {
		this.userRoles = userRoles;
	}
	@Override
	public void setBeforeResource(String beforeResource) {
		super.setBeforeResource(beforeResource);
		this.avatar.setBeforeResource(beforeResource);
	}

	public Boolean getActived() {
		return actived;
	}

	public void setActived(Boolean actived) {
		this.actived = actived;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}
	
	
	

}