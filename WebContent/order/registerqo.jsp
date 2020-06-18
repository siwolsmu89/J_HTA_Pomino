<%@page import="com.domino.dao.UserDao"%>
<%@page import="com.domino.vo.User"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	int orderNo = NumberUtil.stringToInt(request.getParameter("orderno"));
	
	UserDao userDao = new UserDao();
	User user = userDao.getUserByNo(loginUserNo);
	user.setQuickOrderNo(orderNo);
	userDao.updateUser(user);
	
	response.sendRedirect("../user/orderlist.jsp");
%>