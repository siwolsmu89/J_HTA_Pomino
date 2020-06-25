<%@page import="com.domino.vo.User"%>
<%@page import="com.domino.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script>
	document.title = "포미노 피자 - 당신의 인생에 완벽한 한 끼! Life Food, Pomino's";
	var link = document.createElement("link");
	link.type = "image/x-icon";
	link.rel = "shortcut icon";
	link.href = "/domino/resource/images/logo/nomido2.png";
	document.getElementsByTagName('head')[0].appendChild(link);
</script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
	body {
		font-family: 'Noto Sans KR', sans-serif;
	}
	
</style>
<div class="container mt-3"><!-- 내비 컨테이너 -->
	<div class="row">
		<div class="col-12">
			<div class="row">
				<div class="col-3"> <!-- 로고 -->
					<a class="navbar-brand" href="/domino/common/home.jsp">
						<img src="../resource/images/logo/pominoLogo.png" alt="도미노 로고"/>
					</a> 
				</div>
				<div class="col-5">	
					<!-- 검색창의 흔적
					<div class="row row-vh align-items-center">
						<div class="col-12">
							<form class="form-inline d-flex justify-content-center md-form form-sm">
		  						<input class="form-control form-control-sm mr-3 w-75" type="text" placeholder="Search" aria-label="Search">
		  						<i class="fas fa-search" aria-hidden="true"></i>
							</form>
						</div>
					</div>
					-->
				</div>
				<div class="col-4"><!-- 작은 버튼 로그인 로그아웃 등.. -->
					
					<div class="row small">
					<%
						if("Yes".equals(loginYn)) {
					%>
						<div class="col-12 text-right mt-2">
							<a class="btn btn-sm <%="login".equals(position) ? "font-weight-bold" : ""%>" href="/domino/user/logout.jsp">로그아웃</a>
							<a class="btn btn-sm <%="login".equals(position) ? "font-weight-bold" : ""%>" href="/domino/user/detailform.jsp">나의정보</a>
							<a class="btn btn-sm <%="login".equals(position) ? "font-weight-bold" : ""%>" href="/domino/order/cart.jsp">장바구니</a>
						</div>
					<%
						} else {
					%>
						<div class="col-12 text-right mt-2">
							<a class="btn btn-sm <%="signup".equals(position) ? "font-weight-bold" : ""%>" href="/domino/user/loginform.jsp">로그인</a>
							<a class="btn btn-sm <%="signup".equals(position) ? "font-weight-bold" : ""%>" href="/domino/user/signupform.jsp">회원가입</a>
						</div>
						
					<%
						}
					%>
					</div>
				</div>
			</div>
			
			<div class="row"><!-- 메뉴바 -->
				<div class="col-12"><!-- 상세메뉴 -->
					<div class="row">
						<div class="col-10">
							<nav class="navbar navbar-expand-lg navbar-light bg-white">
							  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
							    <span class="navbar-toggler-icon"></span>
							  </button>
							  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
							    <a class="navbar-brand invisible" href="#">Domino</a>
							    <ul class="navbar-nav mr-auto mt-2 mt-lg-0 font-weight-bold">
							    
							      <li class="nav-item pr-5 mr-3 <%="pizzamenu".equals(position) ? "active" : ""%>">
							        <a class="nav-link" href="/domino/pizza/pizzamenu.jsp">메뉴</a>
							      </li>
							      <li class="nav-item pr-5 mr-3 <%="event".equals(position) ? "active" : ""%>">
							        <a class="nav-link" href="/domino/event/eventlist.jsp">이벤트/제휴</a>
							      </li>
							      <%
								  	if("Yes".equals(loginYn)) {
								  %>
							      <li class="nav-item pr-5 mr-3 <%="order".equals(position) ? "active" : ""%>">
							        <a class="nav-link" href="/domino/order/cart.jsp">주문</a>
							      </li>
							      <%
								  	} else {
							      %>
							      <li class="nav-item pr-5 mr-3 <%="order".equals(position) ? "active" : ""%>">
							        <a class="nav-link" href="/domino/user/loginform.jsp">주문</a>
							      </li>
							      <%
								  	}
							      %>
							      <li class="nav-item pr-5 mr-3 <%="map".equals(position) ? "active" : ""%>">
							        <a class="nav-link" href="/domino/map/detail.jsp">매장검색</a>
							      </li>
							      <%
								  	if("Yes".equals(loginYn)) {
								  %>
								  <%
								  		if(("Yes").equals(session.getAttribute("매니저여부"))){
								  %>
							      <li class="nav-item pr-5 mr-3 <%="branch".equals(position) ? "active font-weight-bold" : ""%>">
							        <a class="nav-link" href="/domino/branch/info.jsp">가맹점</a>
							      </li>
							      <%
								  		}
							      %>
							      <%
								  		if(("Yes").equals(session.getAttribute("관리자여부"))){
								  %>
							      <li class="nav-item pr-5 mr-3 <%="manager".equals(position) ? "active font-weight-bold" : ""%>">
							        <a class="nav-link" href="/domino/manager/info.jsp">관리자</a>
							      </li>
							      <%	 }
								  	} else {
							      %>
							      <%
								  		if(("Yes").equals(session.getAttribute("매니저여부"))){
								  %>
							      <li class="nav-item pr-5 mr-3 <%="branch".equals(position) ? "active font-weight-bold" : ""%>">
							        <a class="nav-link" href="/domino/user/loginform.jsp">가맹점</a>
							      </li>
							       <%
								  		}
							      %>
							      <%
							      		if(("Yes").equals(session.getAttribute("관리자여부"))){
							      %>
							      <li class="nav-item pr-5 mr-3 <%="manager".equals(position) ? "active font-weight-bold" : ""%>">
							        <a class="nav-link" href="/domino/user/loginform.jsp">관리자</a>
							      </li>
							      <%
							      		}
								  	}
							      %>
							    </ul>
							  </div>
							</nav>

						</div>
						
						<div class="col-2"><!-- 더보기 -->
							  <nav class="navbar navbar-light bg-white text-right" style="padding-left: 100px;">
							    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
							      <span class="navbar-toggler-icon"></span>
							    </button>
							  </nav>
						
						</div>
					 
				  </div>
				  <div class="row">
					<div class="col-12">
						<div class="collapse" id="navbarToggleExternalContent">
							<div class="row">
								<div class="col-12">
									<div class="bg-white p-4 row" style="border-top: 2px solid black;">
										<div class="col-6">
										      <h5 class="text-dark h4 font-weight-bold">도미노서비스</h5>
										      <p class="pt-2 pl-5"><a href="/domino/user/detailform.jsp" class="text-muted">▶ 매니아혜택</a></p>
										      <p class="pl-5"><a href="/domino/order/reorder.jsp?type=quick" class="text-muted">▶ 퀵오더</a></p>
										</div>
										<div class="col-6">
											    
											      <h5 class="text-dark h4 font-weight-bold">고객센터</h5>
											      <p class="pt-2 pl-5"><a href="/domino/user/questionform.jsp" class="text-muted">▶ 1:1문의</a></p>
											    
										</div>
									</div>	
								</div>
						  	</div>
						</div>
					 </div>
				  </div>
				</div>
			</div>
		</div>
	</div>
</div>
