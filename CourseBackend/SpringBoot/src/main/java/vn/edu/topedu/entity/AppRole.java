package vn.edu.topedu.entity;
 
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.springframework.security.core.GrantedAuthority;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
 
@Entity
@JsonInclude(JsonInclude.Include.NON_NULL)
@Table(name = "App_Role", //
        uniqueConstraints = { //
                @UniqueConstraint(name = "APP_ROLE_UK", columnNames = "Role_Name") })
public class AppRole extends BaseEntity implements GrantedAuthority {
     
	
 
    @Column(name = "Role_Name", length = 30, nullable = false)
    private String roleName;
 
    @OneToMany(mappedBy = "appRole")
	@JsonIgnore
	private List<UserRole> userRole;
 
    public String getRoleName() {
        return roleName;
    }
 
    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
    
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Override
	@JsonIgnore
	public String getAuthority() {
		
		return this.roleName;
	}
	@JsonIgnore
	public List<UserRole> getUserRole() {
		return userRole;
	}

	public void setUserRole(List<UserRole> userRole) {
		this.userRole = userRole;
	}
	
     
}