package vn.edu.topedu.entity;
 
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import vn.edu.topedu.entity.course.Course;
import vn.edu.topedu.entity.previewcourse.PreviewCourseEntity;
 
@Entity
@Table(name = "Ower_Course")
public class OwerCourse {
 
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;
	@JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "User_Id", nullable = false)
    private AppUser appUser;
	
    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY,optional=false)
    
    @JoinColumn(name = "Course_Id", nullable = false)
    private Course course;
    
//    @JsonIgnore
//    @ManyToOne(fetch = FetchType.LAZY,optional=false)
//    @JoinColumn(name = "Course_Id", nullable = false, insertable=false, updatable=false)    
//    private PreviewCourseEntity detailCourseEntity;
    
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "payment_id", referencedColumnName = "id")
    private Payment payment;
    
    @Column(name = "successed", length = 1, nullable = true)
    private Boolean successed= false;
 
    @Column(name = "deleted", length = 1, nullable = false)
	private Boolean deleted = false;
	
	@Column(name = "Create_Time", nullable = false)
	private Date createTime = new Date();
	
	@Column(name = "Update_Time", nullable = false)
	private Date updateTime = new Date();
	
	
   



	public OwerCourse() {
		super();
	}
	
	
	public Boolean getDeleted() {
		return deleted;
	}


	public void setDeleted(Boolean deleted) {
		this.deleted = deleted;
	}


	public Date getCreateTime() {
		return createTime;
	}


	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}


	public Date getUpdateTime() {
		return updateTime;
	}


	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}


	public Boolean getSuccessed() {
		return successed;
	}

	public void setSuccessed(Boolean success) {
		this.successed = success;
	}

	public Payment getPayment() {
		return payment;
	}

	public void setPayment(Payment payment) {
		this.payment = payment;
	}

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