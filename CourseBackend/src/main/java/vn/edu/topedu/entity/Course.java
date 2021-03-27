package vn.edu.topedu.entity;
 
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
 
@Entity

@Table(name = "Course")
public class Course {
     
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;
 
    @Column(name = "poster", length = 255, nullable = false)
    private String poster="image/avatar/momo.webp";
    @Column(name = "description", length = 255, nullable = false)
    private String description="";
    @Column(name = "title", length = 255, nullable = false)
    private String title="";
    @Column(name = "price", length = 10, nullable = false)
    private int price;
    @Column(name = "ratestar", length = 10, nullable = false)
    private double ratestar;
    
    @Column(name = "Deleted", length = 1, nullable = false )
    private Boolean deleted =false;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Boolean getDeleted() {
		return deleted;
	}
	public void setDeleted(Boolean deleted) {
		this.deleted = deleted;
	}
	
	
	
	
    
 
  
}