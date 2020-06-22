<%@page import="com.google.gson.Gson"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@page import="com.domino.dao.OrderDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.domino.vo.Order"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String searchOpt = request.getParameter("searchopt");
	String searchValue = request.getParameter("searchValue");
	
	// 검색 옵션에 따른 조회방식 변화
	OrderDao orderDao = new  OrderDao();
	
	List<Order> orders = new ArrayList<Order>();
	if("orderno".equals(searchOpt)){
		Order order = new Order();
		order = orderDao.getOrderByNo(NumberUtil.stringToInt(searchValue));		
		orders.add(order);
	} else if ("branchname".equals(searchOpt)){
		orders = orderDao.getAllOrdersByBranchname(searchValue);
		
	} else if("orderstatus".equals(searchOpt)){
		if("접수완료".equals(searchValue)) {
			orders = orderDao.getAllOrdersByStatus(0);
		} else if("요리중".equals(searchValue)) {
			orders = orderDao.getAllOrdersByStatus(1);
		} else if("배달중".equals(searchValue)) {
			orders = orderDao.getAllOrdersByStatus(2);
		} else if("배달완료".equals(searchValue)) {
			orders = orderDao.getAllOrdersByStatus(3);
		} else if("수령완료".equals(searchValue)) {
			orders = orderDao.getAllOrdersByStatus(4);
		} else if("주문취소".equals(searchValue)) {
			orders = orderDao.getAllOrdersByStatus(5);
		}	
	}
	
	Gson gson = new Gson();
	String jsonContent = gson.toJson(orders);
	
	out.write(jsonContent);
	
%>