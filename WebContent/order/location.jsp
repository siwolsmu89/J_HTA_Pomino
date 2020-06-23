<%@page import="com.domino.dao.LocationDao"%>
<%@page import="com.domino.vo.Location"%>
<%@page import="com.domino.vo.Order"%>
<%@page import="com.domino.dao.OrderDao"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String addrDetail = request.getParameter("addr_detail");
	
	if(addr1.isEmpty() || addr2.isEmpty() || addrDetail.isEmpty()){
		response.sendRedirect("selectlocation.jsp?error=empty");
		return;
	}
	
	Location location = new Location();
	location.setAddrFirst(addr1);
	location.setAddrSecond(addr2);
	location.setAddrDetail(addrDetail);
	location.setUserNo(loginUserNo);
	
	LocationDao locationDao = new LocationDao();
	locationDao.insertLocation(location);

	response.sendRedirect("selectlocation.jsp");
%>