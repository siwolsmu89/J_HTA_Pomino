<%@page import="com.domino.dto.OrderDto"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@page import="com.domino.dao.OrderDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.domino.vo.Order"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String searchOpt = request.getParameter("searchOpt");
	String searchValue = request.getParameter("searchValue");
	int beginNumber = NumberUtil.stringToInt(request.getParameter("beginNumber"));
	int endNumber = NumberUtil.stringToInt(request.getParameter("endNumber"));

	// 검색 옵션에 따른 조회방식 변화
	OrderDao orderDao = new OrderDao();

	List<OrderDto> orders = new ArrayList<OrderDto>();
	if ("orderno".equals(searchOpt)) {
		if(searchValue.isEmpty()){
			orders = orderDao.getAllOrdersWithRange(beginNumber, endNumber);
		} else {
			OrderDto orderDto = new OrderDto();
			orderDto = orderDao.getOrderDtoByNo(NumberUtil.stringToInt(searchValue));
			orders.add(orderDto);
		}
		// 오더넘버 + 범위 
	} else if ("branchname".equals(searchOpt)) {
		orders = orderDao.getOrderByBranchNameWithRange(beginNumber, endNumber, searchValue);
		// 가맹점명 + 범위
	} else if ("orderstatus".equals(searchOpt)) {
		// 주문상태 + 범위
		if ("접수완료".equals(searchValue)) {
			orders = orderDao.getOrdersByStatusWithRange(beginNumber, endNumber, 0);
		} else if ("요리중".equals(searchValue)) {
			orders = orderDao.getOrdersByStatusWithRange(beginNumber, endNumber, 1);
		} else if ("배달중".equals(searchValue)) {
			orders = orderDao.getOrdersByStatusWithRange(beginNumber, endNumber, 2);
		} else if ("배달완료".equals(searchValue)) {
			orders = orderDao.getOrdersByStatusWithRange(beginNumber, endNumber, 3);
		} else if ("수령완료".equals(searchValue)) {
			orders = orderDao.getOrdersByStatusWithRange(beginNumber, endNumber, 4);
		} else if ("주문취소".equals(searchValue)) {
			orders = orderDao.getOrdersByStatusWithRange(beginNumber, endNumber, 5);
		} else {
			orders = orderDao.getAllOrdersWithRange(beginNumber, endNumber);
		}
	}

	Gson gson = new Gson();
	String jsonContent = gson.toJson(orders);

	out.write(jsonContent);
%>