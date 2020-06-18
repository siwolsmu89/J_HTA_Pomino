<%@page import="com.google.gson.Gson"%>
<%@page import="com.domino.vo.Branch"%>
<%@page import="java.util.List"%>
<%@page import="com.domino.dao.UserDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("utf-8");

	String addr = request.getParameter("addr");
	UserDao userDao = new UserDao();
	List<Branch> branches = userDao.getBranchesByAddrFirst(addr);
	
	Gson gson = new Gson();
	String jsonText = gson.toJson(branches);
	
	out.write(jsonText);
%>
