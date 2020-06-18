package com.domino.vo;

import java.util.Date;

public class Answer {

	private int no;
	private int questionNo;
	private String content;
	private String deletedYn;
	private Date regDate;

	public Answer() {}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDeletedYn() {
		return deletedYn;
	}
	public void setDeletedYn(String deletedYn) {
		this.deletedYn = deletedYn;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
}
