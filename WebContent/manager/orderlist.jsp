<%@page import="java.util.Date"%>
<%@page import="com.domino.dto.OrderDto"%>
<%@page import="com.domino.util.NumberUtil"%>
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
					<ul class="nav justify-content-end small text-muted">
					  <li class="nav-item">
					    <a class="nav-link text-muted active pr-1" href="/domino/common/home.jsp">홈</a>	<!--text-muted pr-1  -->
					  </li>
					  <li class="nav-item">
					    <a class="nav-link disabled pr-1" href="#" tabindex="-1" aria-disabled="true">></a><!-- pr-1  -->
					  </li>
					  <li class="nav-item">
					    <a class="nav-link text-muted active pr-1" href="/domino/manager/info.jsp">관리자</a><!--text-muted active pr-1  -->
					  </li>
					  <li class="nav-item">
					    <a class="nav-link disabled pr-1" href="#" tabindex="-1" aria-disabled="true">></a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link disabled text-dark font-weight-bold pr-1" href="#" tabindex="-1" aria-disabled="true">주문</a>
					  	<!--text-dark font-weight-bold pr-1  -->
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
			<%
				//<!-- 페이지네이션  -->
				// 1. 한 화면에 표시할 행의 갯수
				int rowsPerPage = 10;

				// 2. 클라이언트가 요청한 페이지 번호 조회하기
				int pageNo = NumberUtil.stringToInt(request.getParameter("page"), 1);

				// 3. 조회할 목록의 시작번호와 끝번호를 조회한다.
				int beginNumber = (pageNo - 1) * rowsPerPage + 1;
				int endNumber = pageNo * rowsPerPage;

				int rowCount = 0;
				//<!-- 페이지네이션  -->
			%>
			<div class="row">
				<div class="col-12">
					<!-- 검색조건, 정렬기준, 테이블, 페이지처리 내용을 포함하는 card 시작 -->
					<!-- 검색조건, 정렬기준 입력 폼 시작 -->

					<div class="row">
						<div class="col-6">
							<form action="">
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<select class="form-control" name="searchoption">
											<option value="orderno">주문번호</option>
											<option value="branchname">매장이름</option>
											<option value="orderstatus">주문상태</option>
										</select>
									</div>
									<input id="searchValue" type="text" class="form-control"
										placeholder="검색어를 입력하세요" onkeyup="orderListData()">
									<div class="input-group-append">
										<button class="btn btn-outline-secondary" type="button"
											onclick="orderListData()">조회</button>
									</div>
								</div>
							</form>

						</div>
					</div>


					<!-- 검색조건, 정렬기준 입력 폼 끝 -->
					<%
						OrderDao orderDao = new OrderDao();
						List<OrderDto> orders = orderDao.getAllOrdersWithRange(beginNumber, endNumber);
						rowCount = orderDao.getOrdersCount();
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
						<tbody id="order-body">
							<%
								if (orders.isEmpty()) {
							%>
								<tr class="font-weight-bold text-center">
									<td colspan='6'>주문내역이 존재하지 않습니다.</td>
								</tr>
							<%

								} else {
									for (OrderDto order : orders) {
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

										int os = order.getOrderStatus();
										String statusStr = "";
										if (os == 0) {
											statusStr = "<button class='btn btn-primary btn-block'>접수완료</button>";
										} else if (os == 1) {
											statusStr = "<button class='btn btn-primary btn-block'>요리중</button>";
										} else if (os == 2) {
											statusStr = "<button class='btn btn-success btn-block'>배달중</button>";
										} else if (os == 3) {
											statusStr = "<button class='btn btn-success btn-block'>배달완료</button>";
										} else if (os == 4) {
											statusStr = "<button class='btn btn-dark btn-block'>수령완료</button>";
										} else {
											statusStr = "<button class='btn btn-danger btn-block'>주문취소</button>";
										}

										Date reqTime = order.getRequestTime();
										String requestTime = reqTime.toString();

										// 주문갯수세기
										String simpleMenu = "";
										int orderCount = order.getTotalAmount();
										if (!order.getPizzaName().isEmpty()) {
											simpleMenu = order.getPizzaName() + " " + (orderCount > 1 ? "외 " + (orderCount - 1) + "건" : "");
										} else if (!order.getSideName().isEmpty()) {
											simpleMenu = order.getSideName() + (orderCount > 1 ? "외" + (orderCount - 1) + "건" : "");
										}
							%>
								<tr 
							<%
								if (os == 4 || os == 5) {
							%>
								class="text-muted" 
							<%	
								} else {
							%>
								class="font-weight-bold" 
							<%
								}
							%>	>
									<td><%=orderNo%></td>
									<td><%=branchName%></td>
									<td><%=simpleMenu%></td>
									<td><%=totalPrice%></td>
									<td><%=requestTime%></td>
									<td><%=statusStr%></td>
								</tr>
							<%
									}
								}
							%>
						</tbody>
					</table>
					<!-- 페이지 처리 시작 -->
					<div class="row">
						<div class="col-12 text-center">
							<ul class="pagination justify-content-center"
								style="margin: 20px 0">
								<%
									// 0. 한 화면당 표시할 페이지번호 갯수
									int pagesPerBlock = 5;
		
									// 1. 전체 행의 갯수를 조회한다.
									int rows = rowCount;
		
									// 2. 전체 페이지수를 계산한다.
									int totalPages = (int) Math.ceil((double) rows / rowsPerPage);
		
									// 3. 전체 페이지블록 갯수 계산하기
									int totalBlocks = (int) Math.ceil((double) totalPages / pagesPerBlock);
		
									// 4. 요청한 페이지가 어느 페이지 블록에 속하는지 계산하기
									int currentBlock = (int) Math.ceil((double) pageNo / pagesPerBlock);
		
									// 5. 요청한 페에지가 속한 블록의 시작페이지번호와 끝페이지번호 계산하기
									int beginPageNo = (currentBlock - 1) * pagesPerBlock + 1;
									int endPageNo = currentBlock * pagesPerBlock;
									if(pageNo > 1) {
							%>
								<li class="page-item "><a class="page-link" href="orderlist.jsp?page=<%=pageNo - 1%>">이전</a></li>
							<%
								}
								for(int num=beginPageNo; num <=endPageNo; num++) {
									if (endPageNo > totalPages) {
										endPageNo = totalPages;
									}
							%>
								<li class="page-item <%=pageNo == num ? "active" : ""%> "><a class="page-link" href="orderlist.jsp?page=<%=num%>"><%=num%></a></li>
							<%
								}
								if(pageNo < totalPages) {
							%>
								<li class="page-item"><a class="page-link" href="orderlist.jsp?page=<%=pageNo + 1%>">다음</a></li>
							<%
								}
							%>
							</ul>
					<!-- 페이지 처리 끝 -->
						</div>
					</div>
				</div>

			</div>
		</div>
		<div class="mb-3"></div>

	</div>
	<%@ include file="../common/footer.jsp"%>

	<script type="text/javascript">
		function orderListData() {
			var beginNumber = "<%=beginNumber%>";
			var endNumber = "<%=endNumber%>";
			// 검색 옵션
			var searchOption = document
					.querySelector("select[name=searchoption]").value;
			// 검색 값
			var searchValue = document.querySelector("#searchValue").value;

			var xhr = new XMLHttpRequest();

			xhr.onreadystatechange = function() {

				if (xhr.readyState == 4 && xhr.status == 200) {
					var text = xhr.responseText;
					var orders = JSON.parse(text);

					if (!orders) {
						alert('입력한 값과 일치하는 주문이 존재하지 않습니다.');
						return;
					}

					var rows = "";
					for (var i = 0; i < orders.length; i++) {
						var order = orders[i];

						var reqTime = order.requestTime;
						var requestTime = reqTime.toString();
						var simpleMenu = '';
						var orderCount = order.totalAmount;

						if (4 == order.orderStatus || 5 == order.orderStatus) {
							rows += "<tr class='text-muted'>";
						} else {
							rows += "<tr class='font-weight-bold'>";
						}

						rows += "<td>" + order.orderNo + "</td>";
						rows += "<td>" + order.branchName + "</td>";

						if (order.pizzaName) {
							if (orderCount > 1) {
								rows += "<td>" + order.pizzaName + "' '외"
										+ (orderCount - 1) + "건</td>";
							} else {
								rows += "<td>" + order.pizzaName + "</td>";
							}
						} else if (order.sideName) {
							if (orderCount > 1) {
								rows += "<td>" + order.sideName + "' '외"
										+ (orderCount - 1) + "건</td>";
							} else {
								rows += "<td>" + order.sideName + "</td>";
							}
						}

						rows += "<td>" + order.totalDiscountPrice + "</td>";
						rows += "<td>" + order.requestTime + "</td>";

						if (0 == order.orderStatus) {
							rows += "<td><button class='btn btn-primary btn-block'>접수완료</button></td>";
						} else if (1 == order.orderStatus) {
							rows += "<td><button class='btn btn-primary btn-block'>요리중</button></td>";
						} else if (2 == order.orderStatus) {
							rows += "<td><button class='btn btn-success btn-block'>배달중</button></td>";
						} else if (3 == order.orderStatus) {
							rows += "<td><button class='btn btn-success btn-block'>배달완료</button></td>";
						} else if (4 == order.orderStatus) {
							rows += "<td><button class='btn btn-dark btn-block'>수령완료</button></td>";
						} else if (5 == order.orderStatus) {
							rows += "<td><button class='btn btn-danger btn-block'>주문취소</button></td>";
						}

						rows += "</tr>"
					}

					document.getElementById("order-body").innerHTML = rows;
				}
			}

			xhr.open("GET", "/domino/manager/JSON/orderlistdata.jsp?searchOpt="
					+ searchOption + "&&searchValue=" + searchValue
					+ "&&beginNumber=" + beginNumber + "&&endNumber="
					+ endNumber);

			xhr.send();
		}
	</script>
</body>
</html>
























