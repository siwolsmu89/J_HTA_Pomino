<%@page import="com.domino.vo.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	int userNo = loginUserNo;
	Order order = new Order();
	
	
%>