package com.domino.dto;

public class ToppingOrderDto {

	private int no;
	private int pizzaOrderNo;
	private int toppigNo;
	private int orderAmount;
	private int orderPrice;
	private String name;
	private int price;
	private String category;
	private String imageSrc;

	public ToppingOrderDto() {}

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getImageSrc() {
		return imageSrc;
	}

	public void setImageSrc(String imageSrc) {
		this.imageSrc = imageSrc;
	}

	

}
