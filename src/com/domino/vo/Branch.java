package com.domino.vo;

import java.util.Date;

public class Branch {

	private int no;
	private String name;
	private String addrFirst;
	private String addrSecond;
	private String addrDetail;
	private String tel;
	private Date regDate;
	private String parkingYn;
	private String openTime;
	private String closeTime;
	private String comment;
	private double discountRate;
	private String quitYn;
	private String imageSrc;
	
	public Branch() {}

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

	public String getAddrFirst() {
		return addrFirst;
	}

	public void setAddrFirst(String addrFirst) {
		this.addrFirst = addrFirst;
	}

	public String getAddrSecond() {
		return addrSecond;
	}

	public void setAddrSecond(String addrSecond) {
		this.addrSecond = addrSecond;
	}

	public String getAddrDetail() {
		return addrDetail;
	}

	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getParkingYn() {
		return parkingYn;
	}

	public void setParkingYn(String parkingYn) {
		this.parkingYn = parkingYn;
	}

	public String getOpenTime() {
		return openTime;
	}

	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}

	public String getCloseTime() {
		return closeTime;
	}

	public void setCloseTime(String closeTime) {
		this.closeTime = closeTime;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public double getDiscountRate() {
		return discountRate;
	}

	public void setDiscountRate(double discountRate) {
		this.discountRate = discountRate;
	}

	public String getQuitYn() {
		return quitYn;
	}

	public void setQuitYn(String quitYn) {
		this.quitYn = quitYn;
	}

	public String getImageSrc() {
		return imageSrc;
	}

	public void setImageSrc(String imageSrc) {
		this.imageSrc = imageSrc;
	}
	
}
