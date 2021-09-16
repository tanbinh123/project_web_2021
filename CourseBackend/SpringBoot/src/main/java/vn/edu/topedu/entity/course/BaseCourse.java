package vn.edu.topedu.entity.course;
 
import java.math.BigDecimal;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.Table;
import javax.servlet.http.HttpServletRequest;

import com.fasterxml.jackson.annotation.JsonIgnore;

import vn.edu.topedu.entity.AppUser;
import vn.edu.topedu.entity.BaseEntity;
import vn.edu.topedu.entity.CategoryEntity;
import vn.edu.topedu.entity.ResourceImage;
import vn.edu.topedu.json.JsonResponse;
import vn.edu.topedu.utils.WebUtils;
 
@MappedSuperclass
public class BaseCourse extends BaseEntity implements JsonResponse {
     
 
    
    
	@Column(name = "img_poster_id", nullable = false)
	//@JsonIgnore
	protected Long imagePosterId;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "img_poster_id", referencedColumnName = "id", insertable = false, updatable = false)
	protected ResourceImage imagePoster;
    
    
    @Column(name = "description", length = 255)
    protected String description="";
    @Column(name = "title", length = 255, nullable = false)
    protected String title="";
    @Column(name = "price", length = 15, nullable = false, updatable = false,insertable = false)
    protected BigDecimal price=new BigDecimal(0);
    @Column(name = "origin_price", length = 15, nullable = false)
    protected BigDecimal originPrice=BigDecimal.ZERO;
    @Column(name = "discount", length = 15, nullable = false)
    protected int discount=0;
    @Column(name = "bought", length = 10, nullable = false)
    protected int bought=0;
    @Column(name = "sum_star", length = 10, nullable = false, updatable = false)
    @JsonIgnore
    private BigDecimal sumStar=BigDecimal.ZERO;
    @JsonIgnore
    @Column(name = "sum_rating", length = 10, nullable = false, updatable = false)
    protected BigDecimal sumRating=BigDecimal.ZERO;
    
    
    
    @Column(name = "user_poster_id", nullable = false)
	//@JsonIgnore
    protected Long userPosterId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_poster_id", nullable = false, insertable = false, updatable = false)
	@JsonIgnore
	protected AppUser userPoster;
    
   
    
	@Column(name = "actived", length = 1, nullable = false)
	protected Boolean actived = true;
	
	
	@Column(name = "rate_star", length = 10, nullable = false, updatable = false,insertable = false)
	protected int rateStar;
	
	//@JsonIgnore
		@Column(name = "category_id", nullable = false)
		protected Integer categoryId;
		@ManyToOne
		@JoinColumn(name = "category_id", nullable = false, insertable = false, updatable = false)
		protected CategoryEntity category;
    
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	
	
	
	public BaseCourse() {
		super();
	}
	
	public BigDecimal getSumRating() {
		return sumRating;
	}
	public void setSumRating(BigDecimal sumRating) {
		this.sumRating = sumRating;
	}
	public void setRateStar(BigDecimal rateStar) {
		this.sumStar = rateStar;
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
	public int getRateStar() {
		return this.rateStar;
	}
	
	
	public String getThumbnail() {
		if(this.imagePoster!=null)
		return this.imagePoster.getImage();else {
			return null;
		}
	}
	
	
	public String getImgAvatar() {
		return userPoster.getAvatar().getImage();
	}
	
	public String getNameAuthor() {
		return userPoster.getUsername();
	}
	
	public String getCategoryName() {
		if(this.category!=null)
		return this.category.getName();else {
			return null;
		}
	}
	
	
	
	public ResourceImage getImagePoster() {
		return imagePoster;
	}
	public void setImagePoster(ResourceImage imagePoster) {
		this.imagePoster = imagePoster;
	}
	
	public Boolean getActived() {
		return actived;
	}
	public void setActived(Boolean actived) {
		this.actived = actived;
	}
	public BigDecimal getOriginPrice() {
		return originPrice;
	}
	public void setOriginPrice(BigDecimal originPrice) {
		this.originPrice = originPrice;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	
	public void setBeforeResource(String bf) {
		
		if (this.imagePoster != null)
			this.imagePoster.setBeforeResource(bf);
		
		if (this.getUserPoster() != null&&this.getUserPoster().getAvatar() != null)
		this.getUserPoster().getAvatar().setBeforeResource(bf);
	}
	public void setBeforeResource(HttpServletRequest httpServletRequest) {
		String bf = WebUtils.getUrl(httpServletRequest);
		if (this.imagePoster != null)
			this.imagePoster.setBeforeResource(bf);
		
		if (this.getUserPoster() != null&&this.getUserPoster().getAvatar() != null)
		this.getUserPoster().getAvatar().setBeforeResource(bf);
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public Long getImagePosterId() {
		return imagePosterId;
	}
	public void setImagePosterId(Long imagePosterId) {
		this.imagePosterId = imagePosterId;
	}
	public Long getUserPosterId() {
		return userPosterId;
	}
	public void setUserPosterId(Long userPosterId) {
		this.userPosterId = userPosterId;
	}
	public AppUser getUserPoster() {
		return userPoster;
	}
	public void setUserPoster(AppUser userPoster) {
		this.userPoster = userPoster;
	}
	
	
	
    
 
  
}