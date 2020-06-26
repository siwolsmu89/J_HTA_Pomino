<%@page import="java.util.Date"%>
<%@page import="com.domino.dto.OrderDto"%>
<%@page import="com.domino.dto.EtcOrderDto"%>
<%@page import="com.domino.dao.EtcDetailDao"%>
<%@page import="com.domino.dto.SideOrderDto"%>
<%@page import="com.domino.dao.SideDetailDao"%>
<%@page import="com.domino.dto.PizzaOrderDto"%>
<%@page import="com.domino.dao.PizzaDetailDao"%>
<%@page import="com.domino.vo.Branch"%>
<%@page import="com.domino.dao.BranchDao"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@page import="com.domino.vo.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.domino.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		String position = "branch";
	%>
	<%@ include file="../common/navbar.jsp"%>
	<div class="container">
		<div class="header">
			<div class="row">
				<div class="col-4">
					<h4>가맹점</h4>
				</div>
				<div class="col-8">
					<ul class="nav justify-content-end small text-muted">
					  <li class="nav-item">
					    <a class="nav-link text-muted active pr-1" href="/domino/common/home.jsp">홈</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link disabled pr-1" href="#" tabindex="-1" aria-disabled="true">></a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link text-muted active pr-1" href="/domino/branch/info.jsp">가맹점</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link disabled pr-1" href="#" tabindex="-1" aria-disabled="true">></a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link disabled text-dark font-weight-bold pr-1" href="#" tabindex="-1" aria-disabled="true">메인</a>
					  </li>
					</ul>
					
				</div>
			</div>
			<div style="background-color: black; height: 2px;" class="mb-2"></div>
			<div class="row ">
				<div class="col-12">
					<div class="navbar navbar-expand-sm ">
						<ul class="navbar-nav">
							<li
								class="nav-item  d-flex justify-content-between align-items-center small"><a
								class="nav-link text-dark font-weight-bold" href="info.jsp">메인</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-items-center small"><a
								class="nav-link text-muted" href="orderlist.jsp">주문내역</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-items-center small"><a
								class="nav-link text-muted" href="branchdetail.jsp">상세정보</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="body">
			<div class="row">
				<div class="col-12">
					<div class="jumbotron bg-dark text-white mb-2">
						<div class="row text-center">
						<%
							int rowsPerPage = 5;
							int pageNo = NumberUtil.stringToInt(request.getParameter("page"), 1);

							int branchUserNo = (int)session.getAttribute("사용자번호");
							UserDao userDao = new UserDao();
							User user = userDao.getUserByNo(branchUserNo);
							int branchNo = Integer.parseInt(user.getId().substring(7));

							OrderDao orderDao = new OrderDao();
							List<Order> todayAllOrder = orderDao.getOrdersByBranchnoWithDate(branchNo);
							
							int todayAllOrderCount = 0;
							int nowAllOrderCount = 0;
							int todayTotalSales = 0;
							// 오늘 전체주문 카운트
							for(Order order : todayAllOrder){
								todayAllOrderCount++;
								// 오늘 전체 주문중 현재 진행중인 주문 카운트
								if(3!=order.getOrderStatus() && 4!=order.getOrderStatus() && 5!=order.getOrderStatus()){
									nowAllOrderCount++;
								} else {
									todayTotalSales += order.getDiscountPrice();
								}
							}
							
						%>
							<div class="col-4">
								<p class="text-primary font-weight-bold">오늘 주문현황</p>
								<p class="display-4 text-center font-weight-bold"><%=todayAllOrderCount %>건</p>
							</div>
							<div class="col-4"
								style="border-left: 1px solid white; border-right: 1px solid white;">
								<p class="text-primary font-weight-bold">현재 주문현황</p>
								<p class="display-4 text-center font-weight-bold"><%=nowAllOrderCount %>건</p>
							</div>
							<div class="col-4">
								<p class="text-primary font-weight-bold">오늘 총 매출</p>
								<p class="display-4 text-center font-weight-bold">
									<%=NumberUtil.numberWithComma(todayTotalSales) %>원
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-12">
					<%
						
						List<OrderDto> AllOrder = orderDao.getTodayOrdersByBranchNo(branchNo);
					%>
					<div class="row">
						<div class="col-12">
							<p class="	text-center font-weight-bold" style="border: 1px solid black; border-bottom: none;">주문리스트</p>
						</div>
					</div>
					<table class="table text-center">
						<colgroup>
							<col width="10%">
							<col width="20%">
							<col width="20%">
							<col width="*%">
							<col width="15%">
						</colgroup>
						<thead class="thead thead-dark">
							<tr>
								<th>주문번호</th>
								<th>매장이름</th>
								<th>주문한메뉴</th>
								<th>총금액</th>
								<th>배달요청시간</th>
								<th>주문상태</th>
							</tr>
						</thead>
						<tbody>
							<%
								if (AllOrder.isEmpty()) {
							%>
								<tr><td colspan="6">주문정보가 없습니다.</td></tr>
							<%
								} else {
								for (OrderDto order : AllOrder) {
									int orderNo = order.getOrderNo();
									String branchName = order.getBranchName();
									int totalAmount = order.getTotalAmount();
									int totalPrice = order.getTotalDiscountPrice();
		
									String menuName = "";
									if (order.getPizzaName() != null) {
										menuName = order.getPizzaName();
									} else if (order.getSideName() != null) {
										menuName = order.getSideName();
									} else {
										menuName = order.getEtcName(); 
									}
									/*
									int os = order.getOrderStatus();
									String statusStr = "";
									if (os == 0) {
										statusStr = "<button class='btn btn-primary'>접수완료</button>";
									} else if (os == 1) {
										statusStr = "<button class='btn btn-primary'>요리중</button>";
									} else if (os == 2) {
										statusStr = "<button class='btn btn-sucess'>배달중</button>";
									} else if (os == 3) {
										statusStr = "<button class='btn btn-success'>배달완료</button>";
									} else if (os == 4) {
										statusStr = "<button class='btn btn-dark'>수령완료</button>";
									} else {
										statusStr = "<button class='btn btn-danger'>주문취소</button>";
									}
									*/
									Date reqTime = order.getRequestTime();
									String requestTime = reqTime.toString();
									
									// 주문갯수세기
									String simpleMenu = "";
									int orderCount = order.getTotalAmount();
									if(!order.getPizzaName().isEmpty()){
										simpleMenu = order.getPizzaName() + " " + (orderCount > 1 ? "외 " + (orderCount - 1) + "건" : "");
									} else if(!order.getSideName().isEmpty()){
										simpleMenu = order.getSideName() + (orderCount > 1 ? "외" + (orderCount - 1) + "건" : "");
									}
							%>
							<tr>
								<td><%=orderNo %></td>
								<td><%=branchName %></td>
								<td><%=simpleMenu%></td>
								<td><%=totalPrice %></td>
								<td><%=requestTime %></td>
								<%
									if (order.getOrderStatus() == 0) {
								%>
								<td>
									<a class="btn btn-primary text-white" role="button"
									href="orderStatus.jsp?orderno=<%=orderNo %>&statusno=0">접수완료</a>
								</td>
								
								<%
									} else if (order.getOrderStatus() == 1) {
								%>
								<td>
									<a class="btn btn-primary text-white" role="button"
									href="orderStatus.jsp?orderno=<%=orderNo %>&statusno=1">요리중</a>
								</td>
								<%
									} else if (order.getOrderStatus() == 2) {
								%>
								<td>
									<a class="btn btn-success text-white" role="button"
									href="orderStatus.jsp?orderno=<%=orderNo %>&statusno=2">배달중</a>
								</td>
								<%
									} else if (order.getOrderStatus() == 3) {
								%>
								<td>
									<a class="btn btn-success text-white" role="button"
									href="orderStatus.jsp?orderno=<%=orderNo %>&statusno=3">배달완료</a>
								</td>
								<%
									} else if (order.getOrderStatus() == 4) {
								%>
								<td>
									<a class="btn btn-dark text-white" role="button">수령완료</a>
								</td>
								<%
									} else {
								%>
								<td>
									<a class="btn btn-danger text-white" role="button">주문취소</a>
								</td>
								<%
									}
								%>
							</tr>
							<%
									}
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="mb-3"></div>
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>