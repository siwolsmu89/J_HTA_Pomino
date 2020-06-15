package com.domino.vo;

public class ToppingOrder {

	private int no;
	private int pizzaOrderNo;
	private int toppigNo;
	private int orderAmount;
	private int orderPrice;
	
	public ToppingOrder() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getPizzaOrderNo() {
		return pizzaOrderNo;
	}

	public void setPizzaOrderNo(int pizzaOrderNo) {
		this.pizzaOrderNo = pizzaOrderNo;
	}

	public int getToppigNo() {
		return toppigNo;
	}

	public void setToppigNo(int toppigNo) {
		this.toppigNo = toppigNo;
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
	
}
