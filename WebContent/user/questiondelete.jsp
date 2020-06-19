<%@page import="com.domino.dao.QnaDao"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int questionNo = NumberUtil.stringToInt(request.getParameter("questionno"));
	int pageNo = NumberUtil.stringToInt(request.getParameter("page"), 1);
	
	QnaDao qnaDao = new QnaDao();
	qnaDao.deleteQuestion(questionNo);
	
	response.sendRedirect("questionform.jsp?page=" + pageNo);
%>