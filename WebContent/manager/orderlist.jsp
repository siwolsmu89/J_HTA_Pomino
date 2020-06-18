<%@page import="com.domino.dto.EtcOrderDto"%>
<%@page import="com.domino.dto.SideOrderDto"%>
<%@page import="com.domino.dto.PizzaOrderDto"%>
<%@page import="com.domino.dao.EtcDetailDao"%>
<%@page import="com.domino.dao.SideDetailDao"%>
<%@page import="com.domino.dao.PizzaDetailDao"%>
<%@page import="com.domino.vo.Branch"%>
<%@page import="com.domino.dao.BranchDao"%>
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
	String position = "manager";
%>
	<%@ include file="../common/navbar.jsp"%>
	<div class="container">
		<div class="header">
			<div class="row">
				<div class="col-4">
					<!-- 페이지명 바꿔서 사용하기 -->
					<h4>관리자</h4>
				</div>

				<div class="col-8">
					<ul class="nav justify-content-end">
						<li class="nav-item"><a class="nav-link active" href="#">홈</a></li>
						<li class="nav-item"><a class="nav-link disabled" href="#"
							tabindex="-1" aria-disabled="true">></a></li>
						<li class="nav-item"><a class="nav-link active" href="#">관리자</a></li>
						<li class="nav-item"><a class="nav-link disabled" href="#"
							tabindex="-1" aria-disabled="true">></a></li>
						<li class="nav-item"><a class="nav-link disabled" href="#">주문</a></li>
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
								class="nav-link text-muted " href="info.jsp">메인</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-dark font-weight-bold" href="orderlist.jsp">주문</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-muted" href="menulist.jsp">메뉴</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-muted" href="eventlist.jsp">이벤트</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-muted" href="qnaboard.jsp">1:1문의</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-muted" href="branchlist.jsp">가맹점</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="body">
			<div class="row">
				<div class="col-12">
					<!-- 검색조건, 정렬기준, 테이블, 페이지처리 내용을 포함하는 card 시작 -->
					<!-- 검색조건, 정렬기준 입력 폼 시작 -->
					<form>
						<div class="row">
							<!-- 검색조건 입력폼 시작 -->
							<div class="col-6">
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<select class="form-control" name="searchOption">
											<option value="title">주문번호</option>
											<option value="writer">매장이름</option>
											<option value="content">메뉴</option>
										</select>
									</div>
									<input type="text" class="form-control"
										placeholder="검색어를 입력하세요">
									<div class="input-group-append">
										<button class="btn btn-outline-secondary" type="button">조회</button>
									</div>
								</div>
							</div>
							<!-- 검색조건 입력폼 끝 -->
							<!-- 정렬기준 선택 시작  -->
							<div class="col-2 offset-4">
								<div class="input-group mb-3">
									<select class="form-control" name="sort">
										<option value="title">전체보기</option>
										<option value="writer">완료된 주문</option>
										<option value="content">진행중인 주문</option>
									</select>
								</div>
							</div>
							<!-- 정렬기준 선택 끝  -->
						</div>
					</form>
					<!-- 검색조건, 정렬기준 입력 폼 끝 -->
					<%
						OrderDao orderDao = new OrderDao();
						List<Order> orders = orderDao.getAllOrders();
					%>
					<table class="table text-center">
						<colgroup>
							<col width="15%">
							<col width="15%">
							<col width="25%">
							<col width="15%">
							<col width="15%">
							<col width="15%">
						</colgroup>
						<thead class="thead-dark">
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
						for(Order order : orders) {
							// 주문한 매장 정보 가져오기
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
							if(!pod.isEmpty()){
								simpleMenu = pod.get(0).getPizzaName() + " " + pod.get(0).getDoughName() + " " + (orderCount > 1 ? "외 " + (orderCount - 1) + "건" : "");
							} else if(!sod.isEmpty()){
								simpleMenu = sod.get(0).getSideName() + (orderCount > 1 ? "외" + (orderCount - 1) + "건" : "");
							}
					%>
							<tr>
								<td><%=order.getNo() %></td>
								<td><%=branch.getName() %></td>
								<td>
									<%=simpleMenu%>
								</td>
								<td><%=order.getDiscountPrice()%></td>
								<td><%=order.getRequestTime() %></td>
					<%
								if(order.getOrderStatus() == 0) {
					%>
								<td>
									<button class="btn btn-primary">접수완료</button>
								</td>
					<%
								} else if (order.getOrderStatus() == 1) {
					%>
								<td>
									<button class="btn btn-primary">요리중</button>
								</td>
					<%
								} else if (order.getOrderStatus() == 2) {
					%>
								<td>
									<button class="btn btn-sucess">배달중</button>
								</td>
					<%
								} else if (order.getOrderStatus() == 3) {
					%>
								<td>
									<button class="btn btn-success">배달완료</button>
								</td>
					<%
								} else if (order.getOrderStatus() == 4) {
					%>
								<td>
									<button class="btn btn-secondary">수령완료</button>
								</td>
					<%
								} else {
					%>
								<td>
									<button class="btn btn-dark">주문취소</button>
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
						<li class="page-item"><a class="page-link" href="#">이전</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item active"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#">다음</a></li>
					</ul>
					<!-- 페이지 처리 끝 -->
					<!-- 검색조건, 정렬기준, 테이블, 페이지처리 내용을 포함하는 card 끝 -->
				</div>

			</div>
		</div>


	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>