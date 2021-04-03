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
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@Entity
@Table(name = "App_User", //
		uniqueConstraints = { //
				@UniqueConstraint(name = "email_uq", columnNames = "email"),
				@UniqueConstraint(name = "APP_USER_UK", columnNames = "User_Name") })
public class AppUser implements UserDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "User_Id", nullable = false)

	private Long userId;

	@Column(name = "User_Name", length = 36, nullable = false)
	private String userName;

	@Column(name = "Encryted_Password", length = 128, nullable = false)
	private String encrytedPassword;

	@Column(name = "Enabled", length = 1, nullable = false)
	private Boolean enabled = true;
	@Column(name = "Deleted", length = 1, nullable = false)

	private Boolean deleted = false;
	@Column(name = "Avatar", length = 255, nullable = false)
	private String avatar = "image/avatar/momo.webp";
	@Column(name = "Email", length = 255, nullable = false)
	private String email;

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "user_role", 
	joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "user_id"), 
	inverseJoinColumns = @JoinColumn(name = "role_id", referencedColumnName = "role_id"))
	private List<AppRole> authorities;

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
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

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getAvater() {
		return avatar;
	}

	public void setAvater(String avatar) {
		this.avatar = avatar;
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

	public Boolean getEnabled() {
		return enabled;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return this.authorities;
	}

	@Override
	public String getPassword() {
		return this.encrytedPassword;
	}

	@Override
	public String getUsername() {
		return this.userName;
	}

	@Override
	public boolean isAccountNonExpired() {
		return false;
	}

	@Override
	public boolean isAccountNonLocked() {
		return false;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return false;
	}

	@Override
	public boolean isEnabled() {
		return this.enabled;
	}

}