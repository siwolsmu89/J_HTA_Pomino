<%@page import="com.domino.vo.Order"%>
<%@page import="com.domino.dao.OrderDao"%>
<%@page import="com.domino.dao.ToppingDetailDao"%>
<%@page import="com.domino.dao.PizzaDetailDao"%>
<%@page import="com.domino.dao.SideDetailDao"%>
<%@page import="com.domino.dao.EtcDetailDao"%>
<%@page import="com.domino.util.StringUtil"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int no = NumberUtil.stringToInt(request.getParameter("no"));
	String type = StringUtil.nullToBlank(request.getParameter("type"));

	OrderDao orderDao = new OrderDao();
	Order order = orderDao.getCartByUserNo(loginUserNo);
	int orderNo = order.getNo();
	
	if ("etc".equals(type)) {
		EtcDetailDao etcDetailDao = new EtcDetailDao();
		etcDetailDao.deleteEtcOrderByNo(no);
		orderDao.deleteOrder(orderNo);
	} else if ("side".equals(type)) {
		SideDetailDao sideDetailDao = new SideDetailDao();
		sideDetailDao.deleteSideOrderByNo(no);
		orderDao.deleteOrder(orderNo);
	} else if ("pizza".equals(type)) {
		ToppingDetailDao toppingDetailDao = new ToppingDetailDao();
		toppingDetailDao.deleteToppingOrdersByPizzaOrderNo(no);
		PizzaDetailDao pizzaDetailDao = new PizzaDetailDao();
		pizzaDetailDao.deletePizzaOrderByNo(no);
		orderDao.deleteOrder(orderNo);
	} else if ("topping".equals(type)) {
		ToppingDetailDao toppingDetailDao = new ToppingDetailDao();
		toppingDetailDao.deleteToppingOrderByNo(no);
	}
	
	response.sendRedirect("cart.jsp");
	
%>