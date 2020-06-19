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
							for(Order order : todayAllOrder){
								todayAllOrderCount++;
								// 오늘 전체 주문중 현재 진행중인 주문 카운트
								if(3!=order.getOrderStatus() && 4!=order.getOrderStatus()){
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
					<!-- 배너광고 슬라이드 시작  -->
					<div id="demo" class="carousel slide my-2" data-ride="carousel">
						<!-- 배너의 하단에 표시되는 바로가기 표시 시작  -->
						<ol class="carousel-indicators">
							<li data-target="#demo" data-slide-to="0" class="active"></li>
							<li data-target="#demo" data-slide-to="1"></li>
							<li data-target="#demo" data-slide-to="2"></li>
						</ol>
						<!-- 배너의 하단에 표시되는 바로가기 표시 끝  -->

						<!-- 배너 이미지 시작 -->
						<div class="carousel-inner">
							<div class="carousel-item active">
								<a href="링크주소"> <img class="d-block w-100"
									src="/sample/resources/images/banners/banner1.jpg" alt="설명">
								</a>
							</div>
							<div class="carousel-item">
								<a href="링크주소"> <img class="d-block w-100"
									src="/sample/resources/images/banners/banner2.jpg" alt="설명">
								</a>
							</div>
							<div class="carousel-item">
								<a href="링크주소"> <img class="d-block w-100"
									src="/sample/resources/images/banners/banner3.jpg" alt="설명">
								</a>
							</div>
						</div>
						<!-- 배너 이미지 끝 -->

						<!-- 이전/다음 표시 시작 -->
						<a class="carousel-control-prev" href="#demo" data-slide="prev">
							<span class="carousel-control-prev-icon"></span>
						</a> <a class="carousel-control-next" href="#demo" data-slide="next">
							<span class="carousel-control-next-icon"></span>
						</a>
						<!-- 이전/다음 표시 끝 -->
					</div>
					<!-- 배너광고 슬라이드 끝  -->
				</div>
			</div>

			<div class="row">
				<div class="col-12">
					<%
						QnaDao qnaDao = new QnaDao();
						List<QuestionDto> questions = qnaDao.getAllQuestion();
					%>
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
								<th>번호</th>
								<th>카테고리</th>
								<th>작성자</th>
								<th>문의제목</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
						<%
							for(QuestionDto questionDto : questions) {
								if("N".equalsIgnoreCase(questionDto.getAnsweredYn())){
						%>
								<tr>
									<td><%=questionDto.getNo() %></td>
									<td>카테고리</td>
									<td><%=questionDto.getUserName() %></td>
									<td><%=questionDto.getTitle() %></td>
									<td>
										<a class="btn btn-primary" role="button" href="qnaboard.jsp?qnano=<%=questionDto.getNo() %>">답변대기</a>
									</td>
								</tr>
						<%
								}
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