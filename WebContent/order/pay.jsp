<%@page import="com.domino.util.StringUtil"%>
<%@page import="java.util.Date"%>
<%@page import="com.domino.vo.Grade"%>
<%@page import="java.util.List"%>
<%@page import="com.domino.dao.GradeDao"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@page import="com.domino.vo.User"%>
<%@page import="com.domino.dao.UserDao"%>
<%@page import="com.domino.vo.Order"%>
<%@page import="com.domino.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	// userNo는 나중에 loginUserNo로 바뀔것
	int userNo = loginUserNo;

	OrderDao orderDao = new OrderDao();
	UserDao userDao = new UserDao();

	Order order = orderDao.getCartByUserNo(userNo);
	
	String receiverName = StringUtil.nullToBlank(request.getParameter("receiver_name"));
	String tel1 = StringUtil.nullToBlank(request.getParameter("receiver_tel_1"));
	String tel2 = StringUtil.nullToBlank(request.getParameter("receiver_tel_2"));
	String tel3 = StringUtil.nullToBlank(request.getParameter("receiver_tel_3"));
	String fullTel = tel1 + "-" + tel2 + "-" + tel3;
	String requestDetail = StringUtil.nullToBlank(request.getParameter("request_detail"));
	if ("self".equals(requestDetail)) {
		requestDetail = StringUtil.nullToBlank(request.getParameter("self_input"));
	}
	int totalPrice = NumberUtil.stringToInt(request.getParameter("totalprice"));
	int totaldiscount = NumberUtil.stringToInt(request.getParameter("totaldiscount"));
	if (session.getAttribute("savedLocationNo") == null) {
		response.sendRedirect("selectlocation.jsp");
		return;
	}
	int locationNo = (int) session.getAttribute("savedLocationNo");
	
	order.setReceiverName(receiverName);
	order.setReceiverTel(fullTel);
	order.setRequestDetail(requestDetail);
	order.setTotalPrice(totalPrice);
	order.setDiscountPrice(totaldiscount);
	order.setOrderType("O");
	order.setLocationNo(locationNo);
	orderDao.updateOrder(order);
	
	User user = userDao.getUserByNo(userNo);
	int orderCount = user.getOrderCount() + 1;
	user.setOrderCount(orderCount);
	
	GradeDao gradeDao = new GradeDao();
	List<Grade> grades = gradeDao.getAllGrades();
	for (Grade grade : grades) {
		if (orderCount >= grade.getOrderCount()) {
			user.setGradeName(grade.getName());
			Date date = new Date();
			user.setGradeDate(date);
			break;
		}
	}
	
	userDao.updateUser(user);
	
	response.sendRedirect("success.jsp");
%>