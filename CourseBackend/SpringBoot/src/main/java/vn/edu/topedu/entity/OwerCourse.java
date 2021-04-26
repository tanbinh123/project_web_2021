package vn.edu.topedu.entity;
 
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
 
@Entity
@Table(name = "Ower_Course", //
        uniqueConstraints = { //
                @UniqueConstraint(name = "USER_ID_UQ", columnNames = {  "Course_Id" }) })
public class OwerCourse {
 
    @Id
    @GeneratedValue
    @Column(name = "id", nullable = false)
    private Long id;
 
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "User_Id", nullable = false)
    private AppUser appUser;
 
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "Course_Id", nullable = false)
    private Course course;
 
   
 
    public AppUser getAppUser() {
        return appUser;
    }
 
    public void setAppUser(AppUser appUser) {
        this.appUser = appUser;
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}
 
   
     
}