<%@page import="com.domino.util.StringUtil"%>
<%@page import="com.domino.vo.Pizza"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@page import="com.domino.dao.PizzaDao"%>
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
					    <a class="nav-link disabled text-dark font-weight-bold pr-1" href="#" tabindex="-1" aria-disabled="true">메뉴</a>
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
								class="nav-link text-muted " href="orderlist.jsp">주문</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-dark font-weight-bold" href="menulist.jsp">메뉴</a></li>
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
					<div class="card ">
						<div class="card-header text-center">
							<strong>피자 정보 수정</strong>
						</div>
						<div class="card-body">
							<!-- 피자등록 입력 폼 시작  -->
							<%
								String yn = StringUtil.nullToValue(request.getParameter("yn"), "n");
								int pizzaNo = NumberUtil.stringToInt(request.getParameter("pizzano"));
								PizzaDao pizzaDao = new PizzaDao();
								Pizza pizza = pizzaDao.getPizzaByNo(pizzaNo);
							%>
							<form method="post" action="pizzamodify.jsp" enctype="multipart/form-data">
								<input type="hidden" name="pizzano" value="<%=pizzaNo%>">
								<input type="hidden" name="yn" value="<%=yn%>">
							
								
								<div class="form-group">
									<label>피자이름</label> <input type="text" class="form-control"
										name="name" value="<%=pizza.getName() %>" />
								</div>
								<div class="form-group">
									<label>L가격</label> <input type="text" class="form-control"
										name="lprice" value="<%=pizza.getLprice() %>" />
								</div>
								<div class="form-group">
									<label>M가격</label> <input type="text" class="form-control"
										name="mprice" value="<%=pizza.getMprice() %>" />
								</div>
								<!-- 사진등록 -->
								<div class="form-group input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text">업로드</span>
									</div>
									<div class="form-group custom-file">
										<input type="file" class="custom-file-input" name="upfile"
											aria-describedby="inputGroupFileAddon01"> <label
											class="custom-file-label" for="inputGroupFile01">
											피자사진 ( <%=pizza.getImageSrc()%> )
										</label>
									</div>
								</div>

								<div class="text-right">
									<button type="submit" class="btn btn-primary btn-block">수정하기</button>
								</div>
							</form>
							<!-- 회원가입 입력 폼 끝  -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>