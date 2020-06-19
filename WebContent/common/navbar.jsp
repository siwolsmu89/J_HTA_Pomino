<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container mt-3"><!-- 내비 컨테이너 -->
	<div class="row">
		<div class="col-12">
			<div class="row">
				<div class="col-3"> <!-- 로고 -->
					<a class="navbar-brand" href="/domino/common/home.jsp">
						<img src="../resource/images/logo/domino.png" alt="도미노 로고"/>
					</a> 
				</div>
				<div class="col-5">	<!-- 검색창 -->
					<div class="row row-vh align-items-center">
						<div class="col-12">
							<form class="form-inline d-flex justify-content-center md-form form-sm">
		  						<input class="form-control form-control-sm mr-3 w-75" type="text" placeholder="Search" aria-label="Search">
		  						<i class="fas fa-search" aria-hidden="true"></i>
							</form>
						</div>
					</div>
				</div>
				<div class="col-4"><!-- 작은 버튼 로그인 로그아웃 등.. -->
					<div class="row small">
					<%
						if("Yes".equals(loginYn)) {
					%>
						<div class="col-4"><a class="btn btn-sm <%="login".equals(position) ? "font-weight-bold" : ""%>" href="/domino/user/logout.jsp">로그아웃</a></div>
						<div class="col-4"><a class="btn btn-sm <%="login".equals(position) ? "font-weight-bold" : ""%>" href="/domino/user/detailform.jsp">나의정보</a></div>
						<div class="col-4"><a class="btn btn-sm <%="login".equals(position) ? "font-weight-bold" : ""%>" href="/domino/order/cart.jsp">장바구니</a></div>
					<%
						} else {
					%>
						<div class="col-6"><a class="btn btn-sm <%="signup".equals(position) ? "font-weight-bold" : ""%>" href="/domino/user/loginform.jsp">로그인</a></div>
						<div class="col-6"><a class="btn btn-sm <%="signup".equals(position) ? "font-weight-bold" : ""%>" href="/domino/user/signupform.jsp">회원가입</a></div>
						
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
							        <a class="nav-link" href="#">이벤트/제휴</a>
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
							      <li class="nav-item pr-5 mr-3">
							        <a class="nav-link" href="#">매장검색</a>
							      </li>
							      <%
								  	if("Yes".equals(loginYn)) {
								  %>
							      <li class="nav-item pr-5 mr-3 <%="branch".equals(position) ? "active font-weight-bold" : ""%>">
							        <a class="nav-link" href="/domino/branch/info.jsp">가맹점</a>
							      </li>
							      <li class="nav-item pr-5 mr-3 <%="manager".equals(position) ? "active font-weight-bold" : ""%>">
							        <a class="nav-link" href="/domino/manager/info.jsp">관리자</a>
							      </li>
							      <%
								  	} else {
							      %>
							      <li class="nav-item pr-5 mr-3 <%="branch".equals(position) ? "active font-weight-bold" : ""%>">
							        <a class="nav-link" href="/domino/user/loginform.jsp">가맹점</a>
							      </li>
							      <li class="nav-item pr-5 mr-3 <%="manager".equals(position) ? "active font-weight-bold" : ""%>">
							        <a class="nav-link" href="/domino/user/loginform.jsp">관리자</a>
							      </li>
							      <%
								  	}
							      %>
							    </ul>
							  </div>
							</nav>

						</div>
						<div class="col-2"><!-- 더보기 -->
							  <nav class="navbar navbar-light bg-white">
							    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
							      <span class="navbar-toggler-icon"></span>
							    </button>
							  </nav>
							 <div class="collapse" id="navbarToggleExternalContent">
							    <div class="bg-light p-4">
							      <h5 class="text-dark h4">Collapsed content</h5>
							      <span class="text-muted">Toggleable via the navbar brand.</span>
							    </div>
							  </div>
						
						</div>
				
					 
				  </div>
				
				</div>
			</div>
		</div>
	</div>
</div>
