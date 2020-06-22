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
					<ul class="nav justify-content-end">
						<li class="nav-item"><a class="nav-link active" href="#">홈</a></li>
						<li class="nav-item"><a class="nav-link disabled" href="#"
							tabindex="-1" aria-disabled="true">></a></li>
						<li class="nav-item"><a class="nav-link active" href="#">가맹점</a></li>
						<li class="nav-item"><a class="nav-link disabled" href="#"
							tabindex="-1" aria-disabled="true">></a></li>
						<li class="nav-item"><a class="nav-link disabled" href="#">메인</a></li>
					</ul>
				</div>
			</div>
			<div style="background-color: black; height: 2px;" class="mb-2"></div>
			<div class="row ">
				<div class="col-12">
					<div class="navbar navbar-expand-sm ">
						<ul class="navbar-nav">
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-dark font-weight-bold" href="info.jsp">메인</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-muted" href="orderlist.jsp">주문내역</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-muted" href="menulist.jsp">상세정보</a></li>
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
								<p>
									<a class="" href="#">오늘 주문현황</a>
								</p>
								<p class="display-4 text-center font-weight-bold"><%=todayAllOrderCount %>건</p>
							</div>
							<div class="col-4"
								style="border-left: 1px solid white; border-right: 1px solid white;">
								<p>
									<a class="" href="#">현재 주문현황</a>
								</p>
								<p class="display-4 text-center font-weight-bold"><%=nowAllOrderCount %>건</p>
							</div>
							<div class="col-4">
								<p>
									<a class="" href="#">오늘 총 매출</a>
								</p>
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
					<table class="jumbotron table text-center">
						<colgroup>
							<col width="10%">
							<col width="20%">
							<col width="20%">
							<col width="*%">
							<col width="15%">
						</colgroup>
						<thead class="thead thead-dark">
							<tr>
								<th colspan='7'>주문리스트</th>
							</tr>
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
								List<Order> AllOrder = orderDao.getAllOrdersByBranchno(branchNo);
								for (Order order : AllOrder) {
									BranchDao branchDao = new BranchDao();
									Branch branch = branchDao.getBranchByNo(order.getBranchNo());

									// 피자 주문갯수 및 주문한 피자 디테일 정보 가져오기
									PizzaDetailDao pizzaDetailDao = new PizzaDetailDao();
									List<PizzaOrderDto> pod = pizzaDetailDao.getPizzaOrdersByOrderNo(order.getNo());

									// 사이즈 메뉴 정보 가져오기
									SideDetailDao sideDetailDao = new SideDetailDao();
									List<SideOrderDto> sod = sideDetailDao.getSideOrdersByOrderNo(order.getNo());

									// 기타 메뉴 정보 가져오기
									EtcDetailDao etcDetailDao = new EtcDetailDao();
									List<EtcOrderDto> eod = etcDetailDao.getEtcOrdersByOrderNo(order.getNo());

									// 주문갯수세기
									String simpleMenu = "";
									int orderCount = pod.size() + sod.size() + eod.size();
									if (!pod.isEmpty()) {
										simpleMenu = pod.get(0).getPizzaName() + " " + pod.get(0).getDoughName() + " "
												+ (orderCount > 1 ? "외 " + (orderCount - 1) + "건" : "");
									} else if (!sod.isEmpty()) {
										simpleMenu = sod.get(0).getSideName() + (orderCount > 1 ? "외" + (orderCount - 1) + "건" : "");
									}
							%>
							<tr>
								<td><%=order.getNo()%></td>
								<td><%=branch.getName()%></td>
								<td><%=simpleMenu%></td>
								<td><%=order.getDiscountPrice()%></td>
								<td><%=order.getRequestTime()%></td>
								<%
									if (order.getOrderStatus() == 0) {
								%>
								<td>
									<a class="btn btn-primary text-white" role="button"
									href="orderStatus.jsp?orderno=<%=order.getNo() %>&statusno=0">접수완료</a>
								</td>
								
								<%
									} else if (order.getOrderStatus() == 1) {
								%>
								<td>
									<a class="btn btn-primary text-white" role="button"
									href="orderStatus.jsp?orderno=<%=order.getNo() %>&statusno=1">요리중</a>
								</td>
								<%
									} else if (order.getOrderStatus() == 2) {
								%>
								<td>
									<a class="btn btn-primary text-white" role="button"
									href="orderStatus.jsp?orderno=<%=order.getNo() %>&statusno=2">배달중</a>
								</td>
								<%
									} else if (order.getOrderStatus() == 3) {
								%>
								<td>
									<a class="btn btn-success text-white" role="button"
									href="orderStatus.jsp?orderno=<%=order.getNo() %>&statusno=3">배달완료</a>
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
							%>
						</tbody>
					</table>

					<!-- 페이지 처리 시작 -->
					<ul class="pagination justify-content-center"
						style="margin: 20px 0">
						<li class="page-item "><a class="page-link" href="#">이전</a></li>
						<li class="page-item active"><a class="page-link" href="#">1</a></li>
						<li class="page-item "><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#">다음</a></li>
					</ul>
					<!-- 페이지 처리 끝 -->

				</div>
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>