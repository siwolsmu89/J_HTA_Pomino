package com.domino.vo;

import java.util.Date;

public class Grade {
	
	private String name;
	private int orderCount;
	private int orderPrice;
	private double discountRate;
	private Date achievedDate;

	public Grade() {}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public int getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public double getDiscountRate() {
		return discountRate;
	}
	public void setDiscountRate(double discountRate) {
		this.discountRate = discountRate;
	}
	public Date getAchievedDate() {
		return achievedDate;
	}
	public void setAchievedDate(Date achievedDate) {
		this.achievedDate = achievedDate;
	}
	
}
