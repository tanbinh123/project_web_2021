package vn.edu.topedu.entity;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "revenue")
public class Revenue  extends BaseEntity {
	@Column(name="month", updatable = false)
	private int month;
	@Column(name="year", updatable = false)
	private int year;
	@Column(name="money", updatable = false)
	private BigDecimal money=BigDecimal.valueOf(0);
	@Column(name="day", updatable = false)
	private BigDecimal day;
	
	
	@Column(name="course_sell", updatable = false)
	private BigDecimal courseSell =BigDecimal.valueOf(0);
	
	@Column(name="course_upload", updatable = false)
	private BigDecimal courseUpload =BigDecimal.valueOf(0);
	
	@Column(name="new_member", updatable = false)
	private BigDecimal newMember =BigDecimal.valueOf(0);
	
	
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public BigDecimal getMoney() {
		return money;
	}
	public void setMoney(BigDecimal money) {
		this.money = money;
	}
	public BigDecimal getDay() {
		return day;
	}
	public void setDay(BigDecimal day) {
		this.day = day;
	}
	public BigDecimal getCourseSell() {
		return courseSell;
	}
	public void setCourseSell(BigDecimal courseSell) {
		this.courseSell = courseSell;
	}
	public BigDecimal getCourseUpload() {
		return courseUpload;
	}
	public void setCourseUpload(BigDecimal courseUpload) {
		this.courseUpload = courseUpload;
	}
	public BigDecimal getNewMember() {
		return newMember;
	}
	public void setNewMember(BigDecimal newMember) {
		this.newMember = newMember;
	}
	
	
	

}
