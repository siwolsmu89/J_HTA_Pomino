<%@page import="com.domino.dto.OrderGraphDataDto"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="com.domino.vo.Order"%>
<%@page import="com.domino.dao.OrderDao"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int date = NumberUtil.stringToInt(request.getParameter("date"));
	
	OrderDao orderDao = new OrderDao();
	List<OrderGraphDataDto> orders = orderDao.getOrderCountByDateRange(date);
	
	Gson gson = new Gson();
	String jsonContent = gson.toJson(orders);

	out.write(jsonContent);
%>