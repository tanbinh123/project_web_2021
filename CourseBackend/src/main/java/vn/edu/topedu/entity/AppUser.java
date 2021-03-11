package vn.edu.topedu.entity;
 
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
 
@Entity
@Table(name = "App_User", //
        uniqueConstraints = { //
                @UniqueConstraint(name = "APP_USER_UK", columnNames = "User_Name") })
public class AppUser {
 
    @Id
    @GeneratedValue
    @Column(name = "User_Id", nullable = false)
    private Long userId;
 
    @Column(name = "User_Name", length = 36, nullable = false)
    private String userName;
 
    @Column(name = "Encryted_Password", length = 128, nullable = false)
    private String encrytedPassword;
 
    @Column(name = "Enabled", length = 1, nullable = false)
    private boolean enabled;
    @Column(name = "Delete", length = 1, nullable = false)
    private boolean delete;
    @Column(name = "Avatar", length = 255, nullable = false)
    private String avater;
    @Column(name = "Email", length = 255, nullable = false)
    private String email;
 
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
 
    public boolean isEnabled() {
        return enabled;
    }
 
    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

	public boolean isDelete() {
		return delete;
	}

	public void setDelete(boolean delete) {
		this.delete = delete;
	}

	public String getAvater() {
		return avater;
	}

	public void setAvater(String avater) {
		this.avater = avater;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
    
 
}