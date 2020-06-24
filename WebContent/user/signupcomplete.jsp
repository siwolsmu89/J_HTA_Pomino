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
		String position="signup";
%>
<%@ include file="../common/navbar.jsp"%>
<div class="container">

	<div class="header">
		<div class="row">	
			<div class="col-4">
				<h4>회원가입</h4>
			</div>
			<div class="col-8">
			
				<ul class="nav justify-content-end small text-muted">
					  <li class="nav-item">
					    <a class="nav-link text-muted active pr-1" href="/domino/common/home.jsp">홈</a>	<!--text-muted pr-1  -->
					  </li>
					  <li class="nav-item">
					    <a class="nav-link disabled pr-1" href="#" tabindex="-1" aria-disabled="true">></a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link disabled text-dark font-weight-bold pr-1" href="#" tabindex="-1" aria-disabled="true">회원가입</a>
					  	<!--text-dark font-weight-bold pr-1  -->
					  </li>
				</ul>
			</div>
		</div>
	</div>
	
	<div style="background-color: black; height: 2px;" class="mb-2"></div>
	
	<div class="body">
		<div class="row">
			<div class="col-12">
				<ul class="nav nav-pills nav-fill">
				  <li class="nav-item">
				    <a class="nav-link disabled" href="#">01 개인정보입력</a>
				  </li>
				 <li class="nav-item">
				    <a class="nav-link bg-secondary text-white" href="#" tabindex="-1" aria-disabled="true">02 가입완료</a>
				  </li>
				</ul>
			</div>
		</div>
		
		<div class="row">
			<div class="col-12">
				<div class="jumbotron jumbotron-fluid bg-white pb-2">
				  <div class="container text-center">
				    <h1 class="display-4" ><strong>WELCOME TO</strong></h1>
				    <h1 class="display-4"><strong>DOMINO'S PIZZA!</strong></h1>
				    <p class="lead text-muted"><small>고객님, 도미노피자 회원이 되신것을 환영합니다.</small></p> <!-- 회색으로 변경하기 -->
				  </div>
				</div>
			  <hr/>
			</div>
		</div>
		<div class="row">
			<div class="col-12 text-center my-2">
				<h6>다양한 메뉴와 이벤트를 살펴보세요~</h6>
				<div class="mb-3"></div>
			</div>
		</div>
		<div class="row">
			<div class="col-12 text-center">
				<a href="/domino/common/home.jsp" class="btn btn-secondary btn-lg" role="button">Home</a>
				<a href="/domino/user/loginform.jsp" class="btn btn-primary btn-lg" role="button">로그인</a>
			</div>
		</div>
	</div>
	
	<div class="mb-3"></div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>