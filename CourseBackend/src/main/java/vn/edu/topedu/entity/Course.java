package vn.edu.topedu.entity;
 
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
 
@Entity

@Table(name = "Course")
public class Course {
     
    @Id
    @GeneratedValue
    @Column(name = "id", nullable = false)
    private Integer id;
 
    @Column(name = "poster", length = 255, nullable = false)
    private String poster="image/avatar/momo.webp";
    @Column(name = "description", length = 255, nullable = false)
    private String description="";
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
	@Override
	public String toString() {
		return "Course [id=" + id + ", poster=" + poster + ", description=" + description + "]";
	}
	
    
 
  
}