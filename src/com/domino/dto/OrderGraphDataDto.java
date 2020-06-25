package com.domino.dto;

public class OrderGraphDataDto {
	private String regDate;
	private int discountPrice;
	
	public OrderGraphDataDto () {
		
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(int discountPrice) {
		this.discountPrice = discountPrice;
	}
	
	
}
