package com.domino.dto;

/**
 * 기타 메뉴 상세 주문 Dto
 * 기타 메뉴 주문 vo + 기타메뉴명, 기타메뉴 개별 가격 등의 추가 정보를 담는 Dto 객체
 * @author 민석
 *
 */
public class EtcOrderDto {

	private int no;
	private int etcNo;
	private int orderAmount;
	/**
	 * orderPrice : 개별가격 * 수량
	 */
	private int orderPrice;
	private int orderNo;
	private String etcName;
	/**
	 * 개별 메뉴의 가격
	 */
	private int etcPrice;
	private String imageSrc;
	
	public EtcOrderDto() {
		
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getEtcNo() {
		return etcNo;
	}

	public void setEtcNo(int etcNo) {
		this.etcNo = etcNo;
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

	public String getEtcName() {
		return etcName;
	}

	public void setEtcName(String etcName) {
		this.etcName = etcName;
	}

	public int getEtcPrice() {
		return etcPrice;
	}

	public void setEtcPrice(int etcPrice) {
		this.etcPrice = etcPrice;
	}

	public String getImageSrc() {
		return imageSrc;
	}

	public void setImageSrc(String imageSrc) {
		this.imageSrc = imageSrc;
	}
	
}
