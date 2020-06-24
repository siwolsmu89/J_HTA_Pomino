<%@page import="com.domino.dto.PizzaOrderDto"%>
<%@page import="com.domino.dao.ToppingDetailDao"%>
<%@page import="com.domino.dao.PizzaDetailDao"%>
<%@page import="com.domino.dto.SideOrderDto"%>
<%@page import="com.domino.dao.SideDetailDao"%>
<%@page import="com.domino.dto.EtcOrderDto"%>
<%@page import="java.util.List"%>
<%@page import="com.domino.dao.EtcDetailDao"%>
<%@page import="com.domino.vo.Order"%>
<%@page import="com.domino.dao.OrderDao"%>
<%@page import="com.domino.vo.User"%>
<%@page import="com.domino.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("userid");
	String password = request.getParameter("userpwd");
	
	UserDao userDao = new UserDao();
	User user = userDao.getUserById(id);
	
	if(user == null) {
		response.sendRedirect("loginform.jsp?error=fail");
		return;
	}
	if(!user.getPassword().equals(password)) {
		response.sendRedirect("loginform.jsp?error=fail");
		return;
	}
	
	if("Y".equals(user.getQuitYn())) {
		response.sendRedirect("signupform.jsp?error=fail");
		return;
	} else {
		session.setAttribute("사용자이름", user.getName());
		session.setAttribute("사용자번호", user.getNo());
		session.setAttribute("로그인여부", "Yes");
		// orderDao 에 있는 getcart
		OrderDao orderDao = new OrderDao();
		Order cart = orderDao.getCartByUserNo(user.getNo());
		if (cart != null) {
			int orderNo = cart.getNo();
			EtcDetailDao etcDetailDao = new EtcDetailDao();
			List<EtcOrderDto> eol = etcDetailDao.getEtcOrdersByOrderNo(orderNo);
			for (EtcOrderDto eo : eol) {
				etcDetailDao.deleteEtcOrderByNo(eo.getNo());
			}
			
			SideDetailDao sideDetailDao = new SideDetailDao();
			List<SideOrderDto> sol = sideDetailDao.getSideOrdersByOrderNo(orderNo);
			for (SideOrderDto so : sol) {
				sideDetailDao.deleteSideOrderByNo(so.getNo());
			}
			
			PizzaDetailDao pizzaDetailDao = new PizzaDetailDao();
			ToppingDetailDao toppingDetailDao = new ToppingDetailDao();
			List<PizzaOrderDto> pol = pizzaDetailDao.getPizzaOrdersByOrderNo(orderNo);
			for (PizzaOrderDto po : pol) {
				toppingDetailDao.deleteToppingOrdersByPizzaOrderNo(po.getNo());
				pizzaDetailDao.deletePizzaOrderByNo(po.getNo());
			}
			
			orderDao.deleteOrder(orderNo);
		}
		
		if ("admin".equals(id)) {
			session.setAttribute("관리자여부", "Yes");
		} else {
			session.setAttribute("관리자여부", "No");
		}
		
		if (id.length()>7) {
			if ("branch".equals(id.substring(0, 6))) {
				session.setAttribute("매니저여부", "Yes");
				session.setAttribute("매장번호", id.substring(7));
			} else {
				session.setAttribute("매니저여부", "No");
			}
		}
		
		response.sendRedirect("/domino/common/home.jsp");
	}
%>