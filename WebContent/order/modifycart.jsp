<%@page import="com.domino.dto.EtcOrderDto"%>
<%@page import="com.domino.dto.SideOrderDto"%>
<%@page import="com.domino.dto.PizzaOrderDto"%>
<%@page import="com.domino.dao.EtcDetailDao"%>
<%@page import="com.domino.dao.SideDetailDao"%>
<%@page import="com.domino.dao.PizzaDetailDao"%>
<%@page import="com.domino.util.StringUtil"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");
	int no = NumberUtil.stringToInt(request.getParameter("no"));
	int amount = NumberUtil.stringToInt(request.getParameter("amount"));
	String type = StringUtil.nullToBlank(request.getParameter("type"));
	
	
	if ("pizza".equals(type)) {
		PizzaDetailDao pdd = new PizzaDetailDao();
		
		PizzaOrderDto pod = pdd.getPizzaOrderByNo(no);
		
		int oneDiscountPrice = pod.getDiscountPrice() / pod.getOrderAmount();
		int onePrice = pod.getOrderPrice() / pod.getOrderAmount();
		
		int orderPrice = onePrice * amount;
		int discountPrice = oneDiscountPrice * amount;
		
		pod.setOrderAmount(amount);
		pod.setOrderPrice(orderPrice);
		pod.setDiscountPrice(discountPrice);

		pdd.updatePizzaOrder(pod);
	} else if ("side".equals(type)) {
		SideDetailDao sdd = new SideDetailDao();
		
		SideOrderDto sod = sdd.getSideOrderByNo(no);
		
		int orderPrice = sod.getSidePrice() * amount;
		
		sod.setOrderAmount(amount);
		sod.setOrderPrice(orderPrice);
		
		sdd.updateSideOrder(sod);
	} else if ("etc".equals(type)){
		EtcDetailDao edd = new EtcDetailDao();
		
		EtcOrderDto eod = edd.getEtcOrderByNo(no);
		
		int orderPrice = eod.getEtcPrice() * amount;
		
		eod.setOrderAmount(amount);
		eod.setOrderPrice(orderPrice);
		
		edd.updateEtcOrder(eod);
	}
	
	response.sendRedirect("cart.jsp");

%>