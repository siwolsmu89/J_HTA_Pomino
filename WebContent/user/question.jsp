<%@page import="com.domino.util.NumberUtil"%>
<%@page import="com.domino.dao.QnaDao"%>
<%@page import="com.domino.vo.Question"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");

	String type = request.getParameter("questiontype");
	int branch = NumberUtil.stringToInt(request.getParameter("branchname"));
	String title = request.getParameter("questiontitle");
	String content = request.getParameter("questioncontent");
	
	Question question = new Question();
	question.setWriter(loginUserNo);
	question.setType(type);
	question.setBranchNo(branch);
	question.setTitle(title);
	question.setContent(content);
	
	if(question.getBranchNo() == 0 || question == null){
		response.sendRedirect("questionform.jsp?error=empty");
		return;
	}
	
	QnaDao qnaDao = new QnaDao();
	qnaDao.insertQuestion(question);
	
	response.sendRedirect("questionform.jsp");
%>