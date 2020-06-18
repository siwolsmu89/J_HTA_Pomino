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
				<h4>나의정보</h4>
			</div>
			<div class="col-8">
				<ul class="nav justify-content-end small text-muted">
				  <li class="nav-item">
				    <a class="nav-link text-muted active pr-1" href="#">홈</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled pr-1" href="#" tabindex="-1" aria-disabled="true">></a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link text-muted active pr-1" href="#">나의정보</a>
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
		<div style="background-color: black; height: 2px;" class="mb-2"></div>
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
		}
		
	%>
	
	<div class="body">
		<div id="order-status">
			<div>
				<p><strong>배달</strong> 주문일시 <strong><%=order.getRegDate() %></strong> 주문번호 <strong><%=order.getNo() %></strong></p>
				<p>주문 상태 표시줄 // 하영씨가 만든거 갖고와서 써야지</p>
				<hr/>
				<h3><%=statusString %></h3>
				<hr/>
			</div>
		</div>
		<div class="card mb-5">
			<div class="card-header row" id="ordered-items">
				<div class="col-1"></div>
				<div id="order-items" class="col-5">
					<div>
						<h4>주문내역</h4>
					</div>
					<div class="small text-mute">
		<%
				if (!pol.isEmpty()) {
					for (PizzaOrderDto po : pol) {
						String orderTitle = po.getPizzaName() + po.getDoughName();
						String orderPrice = NumberUtil.numberWithComma(po.getOrderPrice()) + "원";
		%>
					<p>-<%=orderTitle %> / <%=orderPrice %> </p>
		<%
						List<ToppingOrderDto> tol = toppingDetailDao.getToppingOrdersByPizzaNo(po.getNo());
						for (ToppingOrderDto to : tol) {
		%>
					<p class="text-muted">&emsp;&emsp;-<%=to.getName() %> x <%=to.getOrderAmount() %> / <%=NumberUtil.numberWithComma(to.getOrderPrice()) %>원 </p>
		<%					
						}
					}
				}
				
				if (!sol.isEmpty()) {
					for (SideOrderDto so : sol) {
						String orderTitle = so.getSideName() ;
						String orderPrice = NumberUtil.numberWithComma(so.getOrderPrice()) + "원";
		%>
					<p>-<%=orderTitle %> / <%=orderPrice %> </p>
		<%
					}
				}
				
				if (!eol.isEmpty()) {
					for (EtcOrderDto eo : eol) {
						String orderTitle = eo.getEtcName() ;
						String orderPrice = NumberUtil.numberWithComma(eo.getOrderPrice()) + "원";
		%>
					<p>-<%=orderTitle %> / <%=orderPrice %> </p>
		<%
					}
				}
		%>
					</div>
				</div>
				<div class="col-1" style="border-left: 1px solid lightgray;"></div>
				<div id="order-prices" class="col-5">
					<div class="row">
						<div class="col-4">
							<p>주문금액</p>
							<p>할인금액</p>
						</div>
						<div class="col-4">
						</div>
						<div class="col-4">
							<p><%=order.getTotalPrice() %>원</p>
							<p>-<%=order.getTotalPrice() - order.getDiscountPrice() %>원</p>
						</div>
					</div>
					<hr/>
					<div class="row">
						<div class="col-4">
							<p>결제금액</p>
						</div>
						<div class="col-4"></div>
						<div class="col-4">
							<p><%=order.getDiscountPrice() %>원</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="order-info">
			<div class="card">
				<div class="card-header">
					<p>주문정보</p>
				</div>
				<div class="card-body">
					<div id="info-table" class="table">
						<table>
							<tr>
								<th>결제방법</th>
								<td>온라인 주문 / 즉시결제 <%=order.getDiscountPrice() %>원</td>
							</tr>
							<tr>
								<th>수령인</th>
								<td><%=order.getReceiverName() %></td>
							</tr>
							<tr>
								<th>수령인 연락처</th>
								<td><%=order.getReceiverTel() %></td>
							</tr>
							<tr>
								<th>배달요청시간</th>
								<td><%=order.getRequestTime() %></td>
							</tr>
							<tr>
								<th>배달주소</th>
								<td><%=order.getLocationNo() %>를 가지고 조회한 주소</td>
							</tr>
							<tr>
								<th>매장정보</th>
								<td><%=order.getBranchNo() %>를 가지고 조회한 매장명, 매장전화번호</td>
							</tr>
							<tr>
								<th>추가요청</th>
								<td><%=order.getRequestDetail() == null ? "없음" : order.getRequestDetail() %></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div id="buttons">
			<div id="to-orderlist">
				<button>목록</button>
			</div>
			<div id="to-reorder">
				<button>재주문</button>
			</div>
			<div id="to-quickorder">
				<button>퀵오더</button>
			</div>
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>