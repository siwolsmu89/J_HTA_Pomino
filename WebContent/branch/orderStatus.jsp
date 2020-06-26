<%@page import="com.domino.vo.Order"%>
<%@page import="com.domino.dao.OrderDao"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.setCharacterEncoding("utf-8");
	int orderNo = NumberUtil.stringToInt(request.getParameter("orderno"));
	int orderStatus = NumberUtil.stringToInt(request.getParameter("statusno"));
	String position = request.getParameter("position");
	
	OrderDao orderDao = new OrderDao();
	Order order = orderDao.getOrderByNo(orderNo);
	
	order.setOrderStatus(orderStatus+1);
	
	orderDao.updateOrder(order);
	
	if("detail".equalsIgnoreCase(position)){
		response.sendRedirect("/domino/branch/orderlist.jsp");
		return;
	}
	response.sendRedirect("/domino/branch/info.jsp");
%>