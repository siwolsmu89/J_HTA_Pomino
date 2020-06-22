<%@page import="com.domino.dao.LocationDao"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	int no = NumberUtil.stringToInt(request.getParameter("no"));
	
	LocationDao locationDao = new LocationDao();
	locationDao.deleteLocation(no);
	
	response.sendRedirect("selectlocation.jsp");
%>