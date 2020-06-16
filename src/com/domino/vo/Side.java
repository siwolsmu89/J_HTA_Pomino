package com.domino.vo;

public class Side {
	
	private int no;
	private String name;
	private String imageSrc;
	private int price;
	private String disableYn;
	
	public Side() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public String getImageSrc() {
		return imageSrc;
	}

	public void setImageSrc(String imageSrc) {
		this.imageSrc = imageSrc;
	}

	public String getDisableYn() {
		return disableYn;
	}

	public void setDisableYn(String disableYn) {
		this.disableYn = disableYn;
	}
	
	
}
