<%@page import="com.domino.dto.PizzaOrderDto"%>
<%@page import="com.domino.dto.SideOrderDto"%>
<%@page import="com.domino.dto.EtcOrderDto"%>
<%@page import="java.util.List"%>
<%@page import="com.domino.vo.Order"%>
<%@page import="com.domino.dao.ToppingDetailDao"%>
<%@page import="com.domino.dao.EtcDetailDao"%>
<%@page import="com.domino.dao.SideDetailDao"%>
<%@page import="com.domino.dao.PizzaDetailDao"%>
<%@page import="com.domino.dao.OrderDao"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	int userNo = loginUserNo;
	int orderNo = NumberUtil.stringToInt(request.getParameter("orderno"));
	
	OrderDao orderDao = new OrderDao();
	EtcDetailDao etcDetailDao = new EtcDetailDao();
	SideDetailDao sideDetailDao = new SideDetailDao();
	PizzaDetailDao pizzaDetailDao = new PizzaDetailDao();
	ToppingDetailDao toppingDetailDao = new ToppingDetailDao();
	
	Order cart = orderDao.getCartByUserNo(userNo);

	if (cart != null) {
		int cartNo = cart.getNo();
		
		List<EtcOrderDto> eol = etcDetailDao.getEtcOrdersByOrderNo(cartNo);
		if (!eol.isEmpty()) {
			for (EtcOrderDto eo : eol) {
				etcDetailDao.deleteEtcOrderByNo(eo.getNo());
			}
		}
		
		List<SideOrderDto> sol = sideDetailDao.getSideOrdersByOrderNo(cartNo);
		if (!sol.isEmpty()) {
			for (SideOrderDto so : sol) {
				sideDetailDao.deleteSideOrderByNo(so.getNo());
			}
		}
		
		List<PizzaOrderDto> pol = pizzaDetailDao.getPizzaOrdersByOrderNo(cartNo);
		if (!pol.isEmpty()) {
			for (PizzaOrderDto po : pol) {
				toppingDetailDao.deleteToppingOrdersByPizzaOrderNo(po.getNo());
				pizzaDetailDao.deletePizzaOrderByNo(po.getNo());
			}
		}
		
		orderDao.deleteOrder(cartNo);
	}
	
	orderDao.insertReorderCart(orderNo);
	cart = orderDao.getCartByUserNo(userNo);
	int cartNo = cart.getNo();
	
	pizzaDetailDao.insertReorderCart(orderNo, cartNo);
	List<PizzaOrderDto> prevPol = pizzaDetailDao.getPizzaOrdersByOrderNo(orderNo);
	List<PizzaOrderDto> thisPol = pizzaDetailDao.getPizzaOrdersByOrderNo(cartNo);
	for (int i = 0; i < prevPol.size(); i++) {
		toppingDetailDao.insertReorderCart(prevPol.get(i).getNo(), thisPol.get(i).getNo());
	}
	sideDetailDao.insertReorderCart(orderNo, cartNo);
	etcDetailDao.insertReorderCart(orderNo, cartNo);
	
	session.setAttribute("savedLocationNo", cart.getLocationNo());
	response.sendRedirect("payform.jsp");
%>