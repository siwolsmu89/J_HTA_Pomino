package com.domino.vo;

import java.util.Date;

public class Question {

	private int no;
	private int writer;	//!! userNo 임!!
	private String title;
	private String content;
	private String answeredYn;
	private String questionDelYn;
	private String type;
	private int branchNo;
	private Date regDate;
	
	public Question() {}

	public int getBranchNo() {
		return branchNo;
	}

	public void setBranchNo(int branchNo) {
		this.branchNo = branchNo;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getWriter() {
		return writer;
	}

	public void setWriter(int writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAnsweredYn() {
		return answeredYn;
	}

	public void setAnsweredYn(String answeredYn) {
		this.answeredYn = answeredYn;
	}

	public String getQuestionDelYn() {
		return questionDelYn;
	}

	public void setQuestionDelYn(String questionDelYn) {
		this.questionDelYn = questionDelYn;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
}
