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
	out.println("<script>alert('그동안 포미노를 사랑해주셔서 감사합니다 더 좋은 서비스로 보답하는 기업이 되도록 노력하겠습니다'); location.href='/domino/common/home.jsp'; </script>");
	out.flush();
	// response.sendRedirect("/domino/common/home.jsp");
%> 