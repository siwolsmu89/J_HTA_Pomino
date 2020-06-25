<%@page import="com.domino.vo.Pizza"%>
<%@page import="com.domino.dao.PizzaDao"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@page import="com.domino.vo.Event"%>
<%@page import="java.util.List"%>
<%@page import="com.domino.dao.EventDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	String position = "event";
	
%>
<%@ include file="../common/navbar.jsp"%>
<div class="container">
	<div class="header">
		<div class="row">	
			<div class="col-4"><!-- 페이지명 바꿔서 사용하기 -->
				<h4><!-- 페이지명 --></h4>
			</div>
			
			<div class="col-8"><!-- 홈>회원가입 같은 형태 바꿔서 사용하기(나중에 javascript로...) -->
				<ul class="nav justify-content-end small text-muted">
				  <li class="nav-item">
				    <a class="nav-link text-muted active pr-1" href="#">홈</a>	<!--text-muted pr-1  -->
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled pr-1" href="#" tabindex="-1" aria-disabled="true">></a><!-- pr-1  -->
				  </li>
				  <li class="nav-item">
				    <a class="nav-link text-muted active pr-1" href="#">이벤트/제휴</a><!--text-muted active pr-1  -->
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled pr-1" href="#" tabindex="-1" aria-disabled="true">></a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled text-dark font-weight-bold pr-1" href="#" tabindex="-1" aria-disabled="true">이벤트</a>
				  	<!--text-dark font-weight-bold pr-1  -->
				  </li>
				</ul>
			</div>
		</div>
		<div style="background-color: black; height: 2px;" class="mb-2"></div>
		<div class="row">
			<div class="col-12">
				<div class="navbar navbar-expand-sm ">
					<ul class="navbar-nav">
						<li class="nav-item  d-flex justify-content-between align-itens-center small">
							<a class="nav-link font-weight-bold text-dark" href="eventlist.jsp">전체이벤트</a>
						</li>
						
					</ul>
				</div>
			</div>
		</div>
		<div style="background-color: black; height: 1px;" class="mb-2"></div>
	</div>
	<div class="body">
		<%
			int eventNo = NumberUtil.stringToInt(request.getParameter("eventno"));
			EventDao eventDao = new EventDao();
			Event event = eventDao.getEventByNo(eventNo);
			PizzaDao pizzaDao = new PizzaDao();
			Pizza pizza = pizzaDao.getPizzaByNo(event.getPizzaNo());
		%>
		<div class="row">
			<div class="col-12">
				
				<div class="card">
					<div class="row">
						<div class="col-12">
						  <div class="card-body">
						    <h5 class="card-title font-weight-bold"><strong style="color: red; font-size: 25px;"><%=pizza.getName() %></strong> 피자 - <strong style="color: red; font-size: 25px;"><%=event.getDiscountRate() * 100 %>%</strong> 할인 이벤트</h5>
						    <p class="card-text"><small class="text-muted">이벤트 기간 : <%=event.getStartDate() %> ~ <%=event.getEndDate() %></small></p>
						  </div>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
						  <img src="/domino/resource/images/event/dominomodel.jpg" class="card-img-top" alt="도미노모델" >
						</div>
					</div>
					<div class="row">
						<div class="col-12 text-center py-2 my-2">
				  		  <iframe width="900" height="500" src="https://www.youtube.com/embed/OX1jWl2V6gY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						  
						</div>
					</div>
					<div class="row"><!-- 버튼 -->
						<div class="col-12 text-center py-2 my-2">
						  <a href="/domino/pizza/detail.jsp?no=<%=event.getPizzaNo() %>&discountrate=<%=event.getDiscountRate() %>"><button class="btn btn-primary btn-lg"style="width: 300px; height: 90px; font-size: xx-large;">주문하러 가기</button></a>
						</div>
					</div>
				  
				</div>
					
				
			</div>
		</div>
	</div>
	<div class="mb-3"></div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>