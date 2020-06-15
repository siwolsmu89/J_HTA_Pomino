package com.domino.dto;

public class PizzaOrderDto {

	private int no;
	private int pizzaNo;
	private String pizzaSize;
	private int doughNo;
	private int orderAmount;
	private int orderPrice;
	private int discountPrice;
	private int orderNo;
	private String pizzaName;
	private String doughName;
	private int doughPrice;
	private int totalOrderPrice;
	private int totalDiscountPrice;
	
	public PizzaOrderDto() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getPizzaNo() {
		return pizzaNo;
	}

	public void setPizzaNo(int pizzaNo) {
		this.pizzaNo = pizzaNo;
	}

	public String getPizzaSize() {
		return pizzaSize;
	}

	public void setPizzaSize(String pizzaSize) {
		this.pizzaSize = pizzaSize;
	}

	public int getDoughNo() {
		return doughNo;
	}

	public void setDoughNo(int doughNo) {
		this.doughNo = doughNo;
	}

	public int getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}
	
	public int getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}

	public int getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(int discountPrice) {
		this.discountPrice = discountPrice;
	}

	public int getTotalOrderPrice() {
		return totalOrderPrice;
	}

	public void setTotalOrderPrice(int totalOrderPrice) {
		this.totalOrderPrice = totalOrderPrice;
	}

	public int getTotalDiscountPrice() {
		return totalDiscountPrice;
	}

	public void setTotalDiscountPrice(int totalDiscountPrice) {
		this.totalDiscountPrice = totalDiscountPrice;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getPizzaName() {
		return pizzaName;
	}

	public void setPizzaName(String pizzaName) {
		this.pizzaName = pizzaName;
	}

	public String getDoughName() {
		return doughName;
	}

	public void setDoughName(String doughName) {
		this.doughName = doughName;
	}

	public int getDoughPrice() {
		return doughPrice;
	}

	public void setDoughPrice(int doughPrice) {
		this.doughPrice = doughPrice;
	}
	
}
