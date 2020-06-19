package com.domino.dto;

import java.util.Date;


	
	public class QuestionDto {

		private int no;
		private int writer;	//!! userNo 임!!
		private String title;
		private String content;
		private String answeredYn;
		private String questionDelYn;
		private Date regDate;
		private String userName;
		private String userEmail;
		private String userTel;
		private String userId;
		private String type;
		private int branchNo;
		private String answerContent;
		private String branchAddrFirst;
		private String branchName;
		
		public QuestionDto() {}

		
		public String getBranchAddrFirst() {
			return branchAddrFirst;
		}


		public void setBranchAddrFirst(String branchAddrFirst) {
			this.branchAddrFirst = branchAddrFirst;
		}


		public String getBranchName() {
			return branchName;
		}


		public void setBranchName(String branchName) {
			this.branchName = branchName;
		}


		public String getType() {
			return type;
		}


		public void setType(String type) {
			this.type = type;
		}


		public int getBranchNo() {
			return branchNo;
		}


		public void setBranchNo(int branchNo) {
			this.branchNo = branchNo;
		}


		public String getAnswerContent() {
			return answerContent;
		}


		public void setAnswerContent(String answerContent) {
			this.answerContent = answerContent;
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

		public String getUserName() {
			return userName;
		}

		public void setUserName(String userName) {
			this.userName = userName;
		}

		public String getUserEmail() {
			return userEmail;
		}

		public void setUserEmail(String userEmail) {
			this.userEmail = userEmail;
		}

		public String getUserTel() {
			return userTel;
		}

		public void setUserTel(String userTel) {
			this.userTel = userTel;
		}

		public String getUserId() {
			return userId;
		}

		public void setUserId(String userId) {
			this.userId = userId;
		}
		
		
	}

