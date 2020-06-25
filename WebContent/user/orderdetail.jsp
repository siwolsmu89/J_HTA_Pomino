<%@page import="com.domino.vo.Location"%>
<%@page import="com.domino.dao.LocationDao"%>
<%@page import="com.domino.dao.ToppingDetailDao"%>
<%@page import="com.domino.dto.ToppingOrderDto"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@page import="com.domino.dto.EtcOrderDto"%>
<%@page import="com.domino.dao.EtcDetailDao"%>
<%@page import="com.domino.dto.SideOrderDto"%>
<%@page import="com.domino.dao.SideDetailDao"%>
<%@page import="com.domino.dao.PizzaDetailDao"%>
<%@page import="com.domino.dto.PizzaOrderDto"%>
<%@page import="com.domino.vo.Branch"%>
<%@page import="com.domino.dao.BranchDao"%>
<%@page import="com.domino.vo.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.domino.dao.OrderDao"%>
<%@page import="com.domino.vo.User"%>
<%@page import="com.domino.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/logincheck.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <style>
  		table td {
  			color: gray;
  		}
  		
  </style>
</head>
<body>
<%
	String position = "login";
	String subPosition = "userorder";
%>
<%@ include file="../common/navbar.jsp"%>
<div class="container">
	<div class="header">
		<div class="row">	
			<div class="col-4">
				<h4>나의 정보</h4>
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
				    <a class="nav-link text-muted active pr-1" href="/domino/user/detailform.jsp">나의정보</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled pr-1" href="#" tabindex="-1" aria-disabled="true">></a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled text-dark font-weight-bold pr-1" href="#" tabindex="-1" aria-disabled="true">주문내역</a>
				  </li>
				</ul>
			</div>
		</div>
		<div class="mb-2" style="background-color: black; height: 2px;"></div>
		<div id="userinfo-navbar" class="row">
			<div class="col-12">
				<div class="navbar navbar-expand-sm ">
					<ul class="navbar-nav">
						<li class="nav-item  d-flex justify-content-between align-itens-center small">
							<a class="nav-link <%="usergrade".equals(subPosition) ? "font-weight-bold text-dark" : "text-muted"%>" href="detailform.jsp">매니아등급</a>
						</li>
						<li class="nav-item  d-flex justify-content-between align-itens-center small">
							<a class="nav-link <%="userorder".equals(subPosition) ? "font-weight-bold text-dark" : "text-muted"%>" href="orderlist.jsp">주문내역</a>
						</li>
						<li class="nav-item  d-flex justify-content-between align-itens-center small">
							<a class="nav-link <%="userques".equals(subPosition) ? "font-weight-bold text-dark" : "text-muted"%>" href="questionform.jsp">1:1문의</a>
						</li>
						<li class="nav-item  d-flex justify-content-between align-itens-center small">
							<a class="nav-link <%="usermodi".equals(subPosition) ? "font-weight-bold text-dark" : "text-muted"%>" href="modifyform.jsp">정보수정</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<%
		int orderNo = NumberUtil.stringToInt(request.getParameter("orderno"));
	
		OrderDao orderDao = new OrderDao();
		Order order = orderDao.getOrderByNo(orderNo);
		
		BranchDao branchDao = new BranchDao();
		Branch branch = branchDao.getBranchByNo(order.getBranchNo());
		PizzaDetailDao pizzaDetailDao = new PizzaDetailDao();
		List<PizzaOrderDto> pol = pizzaDetailDao.getPizzaOrdersByOrderNo(orderNo);
		ToppingDetailDao toppingDetailDao = new ToppingDetailDao();
		
		SideDetailDao sideDetailDao = new SideDetailDao();
		List<SideOrderDto> sol = sideDetailDao.getSideOrdersByOrderNo(orderNo);
		
		EtcDetailDao etcDetailDao = new EtcDetailDao();
		List<EtcOrderDto> eol = etcDetailDao.getEtcOrdersByOrderNo(orderNo);
		
		int orderStatus = order.getOrderStatus();
		String statusString = "";
		if (orderStatus == 0) {
			statusString = "접수완료";
		} else if (orderStatus == 1) {
			statusString = "요리중";	
		} else if (orderStatus == 2) {
			statusString = "배달중";
		} else if (orderStatus == 3) {
			statusString = "배달완료";
		} else if(orderStatus == 4) {
			statusString = "수령완료";
		} else {
			statusString = "주문취소";
			orderStatus = -1;
		}
		
		LocationDao locationDao = new LocationDao();
		Location location = locationDao.getLocationByNo(order.getLocationNo());
		
	%>
	<div class="body">
		<div class="mb-3 mt-2" style="background-color: lightgray; height: 1.5px;"></div>
		<div id="order-status">
			<div class="row">
				<div class="col-12">
					<div class="row">
						<div class="col-1 ml-5">
							<p><strong>배달주문</strong></p>
						</div>
						<div class="col-3">
							<p>주문일자 <strong><%=order.getRegDate() %></strong>
						</div>
						<div class="col-3">
							<p>주문번호 <strong><%=order.getNo() %></strong></p>
						</div>
					</div>
					<div class="mb-4" style="background-color: lightgray; height: 0.5px;"></div>
					<h3 class="font-weight-bolder pl-3"><%=statusString %></h3>
					<div class="row">
						<div class="col-12 p-5">	
							<div class="row py-3 font-weight-bold">
								<div class="col-3">
									<div class="text-center px-5">접수완료</div>
								</div>
								<div class="col-3">
									<div class="text-center px-5">요리중</div>
								</div>
								<div class="col-3">
									<div class="text-center px-5">배달중</div>
								</div>
								<div class="col-3">
									<div class="text-center px-5">배달완료</div>
								</div>
							</div>
							<div class="row">
								<div class="col-12">
									<div class="progress">
										<div class="progress-bar" role="progressbar" aria-valuenow="<%=orderStatus %>" aria-valuemin="0" aria-valuemax="100" style="background-color: red; width: <%=((orderStatus + 1) * 2 - 1) * 12.5 %>%"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="mt-4 mb-5" style="background-color: lightgray; height: 0.5px;"></div>
				</div>
			</div>
		</div>
		<div id="order-summary-card">
			<div class="row">
				<div class="col-12">
					<div class="card mb-5" style="border: none;">
						<div class="card-header" style="border: none;" id="ordered-items">
							<div class="row">
								<div class="col-1"></div>
								<div id="order-items" class="col-5">
									<div>
										<p style="font-size: 20px;" class="font-weight-bold">주문내역</p>
									</div>
									<div class="font-weight-bold">
						<%
								if (!pol.isEmpty()) {
									for (PizzaOrderDto po : pol) {
										String orderTitle = po.getPizzaName() + po.getPizzaSize() + " (" + po.getDoughName() +")";
										String orderPrice = NumberUtil.numberWithComma(po.getOrderPrice()) + "원";
						%>
									<p class="mb-0">- <%=orderTitle %> / <%=orderPrice %> </p>
						<%
										List<ToppingOrderDto> tol = toppingDetailDao.getToppingOrdersByPizzaNo(po.getNo());
										for (ToppingOrderDto to : tol) {
						%>
									<p class="text-muted small mb-0">&emsp;&emsp;+ <%=to.getName() %> x <%=to.getOrderAmount() %> / <%=NumberUtil.numberWithComma(to.getOrderPrice()) %>원 </p>
						<%					
										}
									}
								}
								
								if (!sol.isEmpty()) {
									for (SideOrderDto so : sol) {
										String orderTitle = so.getSideName() ;
										String orderPrice = NumberUtil.numberWithComma(so.getOrderPrice()) + "원";
						%>
									<p class="mb-0">- <%=orderTitle %> / <%=orderPrice %> </p>
						<%
									}
								}
								
								if (!eol.isEmpty()) {
									for (EtcOrderDto eo : eol) {
										String orderTitle = eo.getEtcName() ;
										String orderPrice = NumberUtil.numberWithComma(eo.getOrderPrice()) + "원";
						%>
									<p>- <%=orderTitle %> / <%=orderPrice %> </p>
						<%
									}
								}
						%>
									</div>
								</div>
								<div class="col-1" style="border-left: 1px solid lightgray;"></div>
								<div id="order-prices" class="col-5">
									<div class="row">
										<div class="col-12">
											<br/>
										</div>
									</div>
									<div class="row">
										<div class="col-4 font-weight-bold">
											<p class="pt-2">주문금액</p>
										</div>
										<div class="col-6 text-right">
											<p style="font-size: 25px;"><span class="font-weight-bold"><%=NumberUtil.numberWithComma(order.getTotalPrice()) %></span>원</p>
										</div>
										<div class="col-4 font-weight-bold">
											<p class="pt-2">할인금액</p>
										</div>
										<div class="col-6 text-right">
											<p style="font-size: 25px;"><span class="font-weight-bold" style="color:red;">-<%=NumberUtil.numberWithComma(order.getTotalPrice() - order.getDiscountPrice()) %></span>원</p>
										</div>
									</div>
									<hr/>
									<div class="row">
										<div class="col-4">
											<p class="font-weight-bold pt-2">결제금액</p>
										</div>
										<div class="col-6 text-right">
											<p style="font-size: 30px;"><span class="font-weight-bold"><%=NumberUtil.numberWithComma(order.getDiscountPrice()) %></span>원</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="background-color: black; height: 2px;"></div>
		<div id="order-info">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<div class="row">
								<div class="col-12">
									<p style="font-size: 20px;" class="font-weight-bold">주문정보</p>
								</div>
							</div>
						</div>
						<div class="card-body">
							<div id="info-table" class="table table-borderless">
								<table>
									<tr>
										<th>결제방법</th>
										<td>&emsp;온라인 주문 / 즉시결제 <%=order.getDiscountPrice() %>원</td>
									</tr>
									<tr>
										<th>수령인</th>
										<td>&emsp;<%=order.getReceiverName() %></td>
									</tr>
									<tr>
										<th>수령인 연락처</th>
										<td>&emsp;<%=order.getReceiverTel() %></td>
									</tr>
									<tr>
										<th>배달요청일자</th>
										<td>&emsp;<%=order.getRequestTime() %></td>
									</tr>
									<tr>
										<th>배달주소</th>
										<td>&emsp;<%=location.getAddrFirst() %> <%=location.getAddrSecond() %> <%=location.getAddrDetail() %></td>
									</tr>
									<tr>
										<th>매장정보</th>
										<td>&emsp;<%=branch.getName()%> <%=branch.getTel() %></td>
									</tr>
									<tr>
										<th>추가요청</th>
										<td>&emsp;<%=order.getRequestDetail() == null ? "없음" : order.getRequestDetail() %></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="mt-5 mb-5" id="buttons">
			<div class="row">
				<div class="col-3 ml-5" id="to-orderlist">
					<a href="orderlist.jsp" class="btn btn-outline-secondary btn-lg">목록</a>
				</div>
				<div class="col-8" id="to-orders">
					<div class="row justify-text-center">
						<div class="col-8"></div>
						<div class="col-2" id="to-reorder">
							<a href="../order/reorder.jsp?orderno=<%=orderNo %>" class="btn btn-danger btn-lg">재주문</a>
						</div>
						<div class="col-2" id="to-quickorder">
							<button onclick="addQuickOrder(<%=orderNo %>)" class="btn btn-secondary btn-lg">퀵오더</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
	function addQuickOrder(orderNo) {
		if (confirm("해당 주문을 퀵 오더로 등록하시겠습니까?")) {
			var xhr = new XMLHttpRequest();
			
			xhr.onreadystatechange = function () {
				if (xhr.readyState ==4 && xhr.status == 200) {
					alert("주문번호 [" + orderNo + "] 주문이 회원님의 퀵 오더로 등록되었습니다.");
				}
			}
			
			xhr.open("GET", "../order/registerqo.jsp?orderno=" + orderNo);
			
			xhr.send();
		} else {
			alert("퀵 오더 등록을 취소했습니다.")
		}
	}
</script>
</body>
</html>