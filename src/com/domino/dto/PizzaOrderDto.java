package com.domino.dto;

/**
 * 피자 상세 주문 Dto
 * 피자 상세 주문 vo + 피자명, 도우명, 피자가격+도우가격 등의 추가 정보를 담는 Dto 객체
 * @author 민석
 *
 */
public class PizzaOrderDto {

	private int no;
	private int pizzaNo;
	private String pizzaSize;
	private int doughNo;
	private int orderAmount;
	/**
	 *  orderPrice : 피자+도우 가격 * 수량
	 */
	private int orderPrice;
	/**
	 *  discountPrice : 피자+도우 할인 가격 * 수량
	 */
	private int discountPrice;
	private int orderNo;
	private String pizzaName;
	private String doughName;
	private int doughPrice;
	private String imageSrc;

	/**
	 * pizzaPrice : 할인되지 않은 피자 가격(1판)
	 * Dao에서 size를 확인한 후, L이면 L가격을, M이면 M가격을 담아야 함
	 */
	private int pizzaPrice;
	
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

	public int getPizzaPrice() {
		return pizzaPrice;
	}

	public void setPizzaPrice(int pizzaPrice) {
		this.pizzaPrice = pizzaPrice;
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
	
	public String getImageSrc() {
		return imageSrc;
	}
	
	public void setImageSrc(String imageSrc) {
		this.imageSrc = imageSrc;
	}
}
