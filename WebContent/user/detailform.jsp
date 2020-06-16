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
	String subPosition = "usergrade";
%>
<%@ include file="../common/navbar.jsp"%>
<div class="container">
	<div class="header">
		<div class="row">	
			<div class="col-4"><!-- 페이지명 바꿔서 사용하기 -->
				<h4>나의 정보</h4>
			</div>
			<div class="col-8"><!-- 홈>회원가입 같은 형태 바꿔서 사용하기(나중에 javascript로...) -->
				<ul class="nav justify-content-end ">
				  <li class="nav-item">
				    <a class="nav-link active" href="#">홈</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled" href="#" aria-disabled="true">></a>
				  </li>
				 <li class="nav-item">
				    <a class="nav-link " href="#">나의정보</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">></a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">매니아등급</a>
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
	<div class="body">
		<%
			UserDao userDao = new UserDao();
			User user = userDao.getUserByNo(loginUserNo);
		%>
		<div class="row">
			<div class="col-12">
				<div class="jumbotron bg-dark text-white">
					<div class="row">
						<div class="col-6">
						  <h4 class=""><%=loginUserName %>님</h4>
						  <p class="display-4 font-weight-bold"><%=user.getGradeName() %></p><!-- 등급불러오기 -->
<!-- 등급별 혜택보기 만들기 -->	  <p><a class="text-muted" href="#"><small>등급별 혜택 보기 ></small></a></p>
						</div>
						<div class="col-3" style="border-left: 1px solid white; border-right: 1px solid white;">
							<p class="text-muted"><small>주문</small></p>
							<p class="text-muted"><small>(2020-01~2021~01)</small></p>
							<p class="display-4 text-center font-weight-bold"><%=user.getOrderCount() %></p>
						</div>
						<div class="col-3">
							<p class="text-muted"><small>총 주문금액</small></p>
							<p class="text-muted"><small>(2020-01~2021~01)</small></p>
<!-- 주문쪽 다 만들면 다시하기 -->		<p class="display-4 text-center font-weight-bold">61,900</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-5">
						<h6 class="text-left">다음 등급으로 업그레이드 하려면?</h6>
					</div>
					<div class="col-7">
						<div class="text-right text-muted small">*1년간 완료된 주문에 대해서 주문건 수를 기준으로 1년된 1일에 매니아 등급에 반영됩니다.</div>
					</div>
				</div>
				<div style="background-color: gray; height: 1px;" class="mb-2"></div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-12 p-5"  style="border: 1px solid gray;">	
				<div class="row py-3 font-weight-bold">
					<div class="col-6">
						<div class="text-left px-5">주문건수</div>
					</div>
					<div class="col-6">
						<div class="text-right px-5">목표등급</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="progress">
						  <div class="progress-bar w-75 py-3" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
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