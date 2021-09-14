package vn.edu.topedu.dto;

import java.math.BigDecimal;

public class RevenueMonth   {
	private int month;
	private int year;
	private BigDecimal money=BigDecimal.valueOf(0);
	
	
	private BigDecimal courseSell =BigDecimal.valueOf(0);
	
	private BigDecimal courseUpload =BigDecimal.valueOf(0);
	
	private BigDecimal newMember =BigDecimal.valueOf(0);
	
	public RevenueMonth(int year,int month, BigDecimal money, BigDecimal courseSell, BigDecimal courseUpload, BigDecimal newMember) {
		this.year=year;
		this.month=month;
		this.money=money;
		this.courseSell=courseSell;
		this.courseUpload=courseUpload;
		this.newMember=newMember;
	}
	
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
