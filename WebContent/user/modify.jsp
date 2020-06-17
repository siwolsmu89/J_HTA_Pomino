<%@page import="com.domino.util.NumberUtil"%>
<%@page import="com.domino.dto.UserDto"%>
<%@page import="com.domino.vo.User"%>
<%@page import="com.domino.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("utf-8");
	int userNo = Integer.parseInt(request.getParameter("userno"));
	String password = request.getParameter("userpwd");
	String tel = request.getParameter("usertel");
	String email = request.getParameter("useremail");
	
	UserDao userDao = new UserDao();
	User userr = userDao.getUserByNo(userNo);
	
	
	User user = new User();
	user.setNo(userr.getNo());
	user.setId(userr.getId());
	user.setName(userr.getName());
	user.setPassword(password);
	user.setTel(tel);
	user.setEmail(email);
	
	userDao.updateModifyUser(user);
	
	response.sendRedirect("/domino/common/home.jsp");
	
%>