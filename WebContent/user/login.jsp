<%@page import="com.domino.vo.User"%>
<%@page import="com.domino.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("userid");
	String password = request.getParameter("userpwd");
	
	UserDao userDao = new UserDao();
	User user = userDao.getUserById(id);
	
	if(user == null) {
		response.sendRedirect("loginform.jsp?error=fail");
		return;
	}
	if(!user.getPassword().equals(password)) {
		response.sendRedirect("loginform.jsp?error=fail");
		return;
	}
	
	if("Y".equals(user.getQuitYn())) {
		response.sendRedirect("signupform.jsp?error=fail");
		return;
	} else {
		session.setAttribute("사용자이름", user.getName());
		session.setAttribute("사용자번호", user.getNo());
		session.setAttribute("로그인여부", "Yes");
		
		if ("admin".equals(id)) {
			session.setAttribute("관리자여부", "Yes");
		}
		
		if (id.length()>7) {
			if ("branch".equals(id.substring(0, 6))) {
				session.setAttribute("매니저여부", "Yes");
				session.setAttribute("매장번호", id.substring(7));
			}
		}
		
		response.sendRedirect("/domino/common/home.jsp");
	}
%>