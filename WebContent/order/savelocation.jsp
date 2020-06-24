<%@page import="com.domino.vo.Order"%>
<%@page import="com.domino.dao.OrderDao"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int selectedLocationNo = NumberUtil.stringToInt(request.getParameter("locationno"));
	int branchNo = NumberUtil.stringToInt(request.getParameter("branchno"));

	OrderDao orderDao = new OrderDao();
	Order order = orderDao.getCartByUserNo(loginUserNo);
	
	session.setAttribute("savedLocationNo", selectedLocationNo);

	if (order == null) {
		response.sendRedirect("/domino/order/cart.jsp");
		return;
	}

		
	order.setLocationNo(selectedLocationNo);
	order.setBranchNo(branchNo);
	orderDao.updateOrder(order);
	

	response.sendRedirect("cart.jsp?test="+selectedLocationNo);
%>