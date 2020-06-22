package com.domino.dto;

/**
 * Side 상세 주문 Dto
 * Side 상세 주문 vo에 추가적으로 필요한 정보를 담는 Dto 객체
 * @author 민석
 *
 */
public class SideOrderDto {
	
	private int no;
	private int sideNo;
	private int orderAmount;
	/**
	 * 개별 메뉴 가격 * amount
	 */
	private int orderPrice;
	private int orderNo;
	private String sideName;
	/**
	 * 개별 메뉴 가격
	 */
	private int sidePrice;
	private String imageSrc;
	
	public SideOrderDto() {
		
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getSideNo() {
		return sideNo;
	}

	public void setSideNo(int sideNo) {
		this.sideNo = sideNo;
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

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getSideName() {
		return sideName;
	}

	public void setSideName(String sideName) {
		this.sideName = sideName;
	}

	public int getSidePrice() {
		return sidePrice;
	}

	public void setSidePrice(int sidePrice) {
		this.sidePrice = sidePrice;
	}

	public String getImageSrc() {
		return imageSrc;
	}

	public void setImageSrc(String imageSrc) {
		this.imageSrc = imageSrc;
	}
	
}
