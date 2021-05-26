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
	private BigDecimal money;
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
	
	

}
