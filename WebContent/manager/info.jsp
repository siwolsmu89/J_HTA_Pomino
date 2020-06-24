<%@page import="com.domino.dto.QuestionDto"%>
<%@page import="com.domino.dao.QnaDao"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@page import="java.util.Currency"%>
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
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
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
					    <a class="nav-link disabled text-dark font-weight-bold pr-1" href="#" tabindex="-1" aria-disabled="true">메인</a>
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
								class="nav-link text-dark font-weight-bold" href="info.jsp">메인</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-muted" href="orderlist.jsp">주문</a></li>
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
					<div class="jumbotron bg-dark text-white mb-1">
						<div class="row text-center">
							<%
								OrderDao orderDao = new OrderDao();
								List<Order> todayAllOrder = orderDao.getOrdersByDate();
								int todayAllOrderCount = 0;
								int nowAllOrderCount = 0;
								int todayTotalSales = 0;
								// 오늘 전체주문 카운트
								for (Order order : todayAllOrder) {
									todayAllOrderCount++;
									// 오늘 전체 주문중 현재 진행중인 주문 카운트
									if (3 != order.getOrderStatus() && 4 != order.getOrderStatus()) {
										nowAllOrderCount++;
									} else {
										todayTotalSales += order.getDiscountPrice();
									}
								}
							%>
							<div class="col-4">
								<p class="text-primary font-weight-bold">오늘 주문현황</p>
								<p class="display-4 text-center font-weight-bold"><%=todayAllOrderCount%>건
								</p>
							</div>
							<div class="col-4" style="border-left: 1px solid white; border-right: 1px solid white;">
								<p class="text-primary font-weight-bold">현재 주문현황</p>
								<p class="display-4 text-center font-weight-bold"><%=nowAllOrderCount%>건
								</p>
							</div>
							<div class="col-4">
								<p class="text-primary font-weight-bold">오늘 총 매출</p>
								<p class="display-4 text-center font-weight-bold">
									<%=NumberUtil.numberWithComma(todayTotalSales)%>원
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="mb-3"></div>
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-header ">
							<div class="row">
								<div class="col-4 text-center " id="7">
									<a role="button" onclick="select(7)">7일 매출</a>
								</div>
								<div class="col-4 text-center " id="30">
									<a role="button" onclick="select(30)">30일 매출</a>
								</div>
								<div class="col-4 text-center " id="365">
									<a role="button" onclick="select(365)">365일 매출</a>
								</div>
							</div>
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-12">
									<%
										int date = 7;
									%>
									<div id="chart_div"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="mb-3"></div>
		
	</div>
	<%@ include file="../common/footer.jsp"%>

	<script type="text/javascript">
		google.charts.load('current', {packages: ['corechart', 'line']});
		google.charts.setOnLoadCallback(drawBasic);
	
		var options = {
			hAxis: {title: '일'},
		  	vAxis: {title: '매출'}
		};

		
		function select(date) {
			drawBasic(date);
			
			var noneactive = document.querySelectorAll('.card-header div div');
			for(var i=0; i<noneactive.length; i++){
				var none = noneactive[i];
				none.setAttribute('style', 'font-weight: defalut');
			}
			var active = document.getElementById(date);
			active.setAttribute('style', 'font-weight : bold');
		}

		function drawBasic(date) {
			var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
	      	var data = new google.visualization.DataTable();
	      	data.addColumn('number', '일');
	      	data.addColumn('number', '일매출');
			
	      	if(!date){
	      		date = 7;
	      	}
			var xhr = new XMLHttpRequest();

			xhr.onreadystatechange = function() {

				if (xhr.readyState == 4 && xhr.status == 200) {
					var text = xhr.responseText;
					var values = JSON.parse(text);

					for (var i = 0; i < values.length; i++) {
						var value = values[i];
						var regDate = Number(value.regDate.substring(3, 5));
						var totalPrice = value.discountPrice;
						var row = [ regDate, totalPrice ];
						data.addRows([ row ]);
						chart.draw(data, options);
					}
				}
			}

			xhr.open("GET", "/domino/manager/JSON/ordercountdata.jsp?date="
					+ date);
			xhr.send();
		}
	</script>
</body>
</html>