package com.domino.dto;

import java.util.Date;

public class UserDto {
	private int no;
	private String id;
	private String password;
	private String name;
	private Date birth;
	private String gender;
	private String tel;
	private String email;
	private Date regDate;
	private String gradeName;
	private Date gradeDate;
	private String quitYn;
	private String quitReason;
	private String quitDetail;
	private int orderCount;
	private int quickOrderNo;
	private int userTotalPrice;
	private int questionWriter;
	private int questionCount;
	private String questionType;
	private String questionTitle;
	private String questionContent;
	private String branchAddr;
	private String branchName;
	
	public UserDto() {}

	
	public String getQuestionType() {
		return questionType;
	}


	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}


	public String getQuestionTitle() {
		return questionTitle;
	}


	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}


	public String getQuestionContent() {
		return questionContent;
	}


	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}


	public String getBranchAddr() {
		return branchAddr;
	}


	public void setBranchAddr(String branchAddr) {
		this.branchAddr = branchAddr;
	}


	public String getBranchName() {
		return branchName;
	}


	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}


	public int getQuestionWriter() {
		return questionWriter;
	}


	public void setQuestionWriter(int questionWriter) {
		this.questionWriter = questionWriter;
	}


	public int getQuestionCount() {
		return questionCount;
	}


	public void setQuestionCount(int questionCount) {
		this.questionCount = questionCount;
	}


	public int getUserTotalPrice() {
		return userTotalPrice;
	}

	public void setUserTotalPrice(int userTotalPrice) {
		this.userTotalPrice = userTotalPrice;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	
	public Date getGradeDate() {
		return gradeDate;
	}

	public void setGradeDate(Date gradeDate) {
		this.gradeDate = gradeDate;
	}

	public String getQuitYn() {
		return quitYn;
	}

	public void setQuitYn(String quitYn) {
		this.quitYn = quitYn;
	}

	public String getQuitReason() {
		return quitReason;
	}

	public void setQuitReason(String quitReason) {
		this.quitReason = quitReason;
	}

	public String getQuitDetail() {
		return quitDetail;
	}

	public void setQuitDetail(String quitDetail) {
		this.quitDetail = quitDetail;
	}

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	public int getQuickOrderNo() {
		return quickOrderNo;
	}

	public void setQuickOrderNo(int quickOrderNo) {
		this.quickOrderNo = quickOrderNo;
	}
	
}
