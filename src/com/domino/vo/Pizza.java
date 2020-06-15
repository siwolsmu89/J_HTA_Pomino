package com.domino.vo;

import java.util.Date;

public class Pizza {

	private int no;
	private String name;
	private String imageSrc;
	private int Lprice;
	private int Mprice;
	private String disableYn;
	private Date regDate;
	
	public Pizza() {}

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

	public String getImageSrc() {
		return imageSrc;
	}

	public void setImageSrc(String imageSrc) {
		this.imageSrc = imageSrc;
	}

	public int getLprice() {
		return Lprice;
	}

	public void setLprice(int lprice) {
		Lprice = lprice;
	}

	public int getMprice() {
		return Mprice;
	}

	public void setMprice(int mprice) {
		Mprice = mprice;
	}

	public String getDisableYn() {
		return disableYn;
	}

	public void setDisableYn(String disableYn) {
		this.disableYn = disableYn;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
}
