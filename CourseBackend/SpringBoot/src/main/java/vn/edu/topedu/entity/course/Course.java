package vn.edu.topedu.entity.course;
 
import java.math.BigDecimal;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.servlet.http.HttpServletRequest;

import com.fasterxml.jackson.annotation.JsonIgnore;
import vn.edu.topedu.consts.VariableConst;
import vn.edu.topedu.entity.AHasPoster;
import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.CategoryEntity;
import vn.edu.topedu.entity.ResourceImage;
import vn.edu.topedu.json.JsonResponse;
import vn.edu.topedu.utils.WebUtils;
 
@Entity
@Table(name = "Course")
public class Course extends AHasPoster implements JsonResponse {
     
 
    
    
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "img_poster_id", referencedColumnName = "id")
    @JsonIgnore
    private ResourceImage poster;
    
    
    @Column(name = "description", length = 255)
    private String description="";
    @Column(name = "title", length = 255, nullable = false)
    private String title="";
    @Column(name = "price", length = 15, nullable = false)
    private BigDecimal price=new BigDecimal(0);
    @Column(name = "bought", length = 10, nullable = false)
    private int bought=0;
    @Column(name = "rateStar", length = 10, nullable = false)
    private double rateStar=0;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_poster_id", nullable = false)
    @JsonIgnore
    private AppUser appUser;
    
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "category_id", nullable = false)
    @JsonIgnore
    private CategoryEntity category;
    
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	
	
	
	public Course() {
		super();
	}
	public ResourceImage getPoster() {
		return poster;
	}
	public void setPoster(ResourceImage poster) {
		this.poster = poster;
	}
	public AppUser getAppUser() {
		return appUser;
	}
	public void setAppUser(AppUser appUser) {
		this.appUser = appUser;
	}
	public CategoryEntity getCategory() {
		return category;
	}
	public void setCategory(CategoryEntity category) {
		this.category = category;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public int getBought() {
		return bought;
	}
	public void setBought(int bought) {
		this.bought = bought;
	}
	public double getRateStar() {
		return rateStar;
	}
	public void setRateStar(double rateStar) {
		this.rateStar = rateStar;
	}
	
	public String getThumbnail() {
		return this.poster.getImage();
	}
	
	
	public String getImgAvatar() {
		return appUser.getAvatar().getImage();
	}
	
	public String getNameAuthor() {
		return appUser.getUsername();
	}
	
	public String getCategoryName() {
		return this.category.getName();
	}
	
	
	public void setBeforeResource(String bf) {
		this.getAppUser().getAvatar().setBeforeResource(bf);
		this.getPoster().setBeforeResource(bf);
	}
	public void setBeforeResource(HttpServletRequest httpServletRequest) {
		String bf = WebUtils.getUrl(httpServletRequest);
		this.getAppUser().getAvatar().setBeforeResource(bf);
		this.getPoster().setBeforeResource(bf);
	}
	
	
    
 
  
}