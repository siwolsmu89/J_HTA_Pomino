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
								<div class="col-6 text-center " id="7">
									<a role="button" onclick="select(7)">7일 매출</a>
								</div>
								<div class="col-6 text-center " id="30">
									<a role="button" onclick="select(30)">30일 매출</a>
								</div>

							</div>
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-12">
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
		// 구글차트 이미지 로드
		google.charts.load('current', {packages: ['corechart', 'line']});
		// 구글차트 그리는 메소드 실행
		google.charts.setOnLoadCallback(drawBasic);
		
		// 구글차트 옵션설정
		var options = {
			backgroundColor : {
				fill : '#e1f5fe',
				fillOpacity : 1
			},
			pointSize:10,
            titleTextStyle: { 
                color: 'white' // 타이틀 색
            },

			hAxis : {
				fontSize:10,
				color:'black',
				title : '날짜(년월일)',
				format : '0',
				gridlines:{
					color:'#8898A1'
				},
	            textStyle:{
	                fontSize:8,
	                color:'black'
	            },
	            baselineColor:'black'

			},
			
			vAxis : {
				title : '매출(원)',
				textStyle:{
                    fontSize:15,
                    color:'black'
                },
                gridlines: { // 중간의 선
                    color: '#8898A1'
                },
                baselineColor:'8898A1' 
			},
			
			legend:{ // 항목
                textStyle:{
                    fontSize:15,
                    color:'black'
                }
            },
			
            series: { // 선색
                0: {
                    color: '#0288d1'
                }
            }

		};

		// 그래프 리스트의 메뉴 선택시 그래프 function에 date값 전달해주는 메소드
		function select(date) {
			// 그래프 function 호출
			drawBasic(date);

			// 그래프 리스트 모든 메뉴 선택해서 폰트스타일 디폴트값으로 변경
			var noneactive = document.querySelectorAll('.card-header div div');
			for (var i = 0; i < noneactive.length; i++) {
				var none = noneactive[i];
				none.setAttribute('style', 'font-weight: defalut');
			}

			// 그래프 리스트에서 선택된 메뉴의 폰트스타일 볼드로 변경
			var active = document.getElementById(date);
			active.setAttribute('style', 'font-weight : bold');
		}

		// 구글차트 그리는 메소드
		function drawBasic(date) {
			// 차트가 들어갈 태그 선택
			var chart = new google.visualization.LineChart(document
					.getElementById('chart_div'));
			var data = new google.visualization.DataTable();
			// 차트 X,Y축 데이터타입 및 설명 세팅
			data.addColumn('string', '일');
			data.addColumn('number', '일매출');

			// 파라미터값이 null이면 dafaul값 7로 설정 (최초 페이지 로드시 사용됨)
			if (!date) {
				date = 7;
			}
			var xhr = new XMLHttpRequest();

			xhr.onreadystatechange = function() {

				if (xhr.readyState == 4 && xhr.status == 200) {
					var text = xhr.responseText;
					var values = JSON.parse(text); 

						
					// 차트에 들어갈 값 세팅
					for (var i = 0; i < values.length; i++) {
						var value = values[i];
						var regDate = value.regDate;

						var totalPrice = value.discountPrice;
						var row = [ regDate, totalPrice ];
						data.addRows([ row ]);
					}

					// 세팅된 값과 옵션을 사용해서 차트 그리기
					chart.draw(data, options);
				}
			}

			xhr.open("GET", "/domino/manager/JSON/ordercountdata.jsp?date="
					+ date);
			xhr.send();
		}
	</script>
</body>
</html>