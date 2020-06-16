<%@page import="com.domino.vo.User"%>
<%@page import="com.domino.dao.UserDao"%>
<%@page import="com.domino.util.StringUtil"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("username");
	String id = request.getParameter("userid");
	String password = request.getParameter("userpwd");
	Date birth = StringUtil.stringToDate(request.getParameter("userbirth"));
	
	String gender = request.getParameter("usergender");
	String tel = request.getParameter("usertel");
	String email = request.getParameter("useremail");
	
	User user = new User();
	user.setName(name);
	user.setId(id);
	user.setPassword(password);
	user.setBirth(birth);
	user.setGender(gender);
	user.setTel(tel);
	user.setEmail(email);
	
	UserDao	userDao = new UserDao();
	User savedUser = userDao.getUserById(id);
	
	if(savedUser != null){
		response.sendRedirect("signupform.jsp?error=dup");
		return;
	}
	
	userDao.insertUser(user);
	
	response.sendRedirect("/domino/user/signupcomplete.jsp");
	
	
	
	
%>