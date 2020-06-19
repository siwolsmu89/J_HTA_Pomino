<%@page import="com.domino.vo.User"%>
<%@page import="com.domino.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");
	
	String quitReason = request.getParameter("deletetitle");
	String quitDetail = request.getParameter("deletecontent");
	
	UserDao userDao = new UserDao();
	User userr = userDao.getUserByNo(loginUserNo);
	
	User user = new User();
	user.setNo(userr.getNo());
	user.setQuitReason(quitReason);
	user.setQuitDetail(quitDetail);
	
	userDao.deleteUser(user);
	session.invalidate();
	response.sendRedirect("/domino/common/home.jsp");
%> 