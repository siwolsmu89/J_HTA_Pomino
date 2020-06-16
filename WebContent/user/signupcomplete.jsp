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
		String position="";
%>
<%@ include file="../common/navbar.jsp"%>
<div class="container">
	<div class="header">
		<div class="row">	
			<div class="col-4"><!-- 페이지명 바꿔서 사용하기 -->
				<h4>회원가입</h4>
			</div>
			<div class="col-8"><!-- 홈>회원가입 같은 형태 바꿔서 사용하기(나중에 javascript로...) -->
				<ul class="nav justify-content-end">
				  <li class="nav-item">
				    <a class="nav-link active" href="#">홈</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">></a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">회원가입</a>
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
				<div class="jumbotron jumbotron-fluid bg-white">
				  <div class="container text-center">
				    <h1 class="display-4" ><strong>WELCOME TO</strong></h1>
				    <h1 class="display-4"><strong>DOMINO'S PIZZA!</strong></h1>
				    <p class="lead"><small>@@ 고객님, 도미노피자 회원이 되신것을 환영합니다.</small></p> <!-- 회색으로 변경하기 -->
				  </div>
				</div>
			  <hr/>
			</div>
		</div>
		<div class="row">
			<div class="col-12 text-center">
				<h6>다양한 메뉴와 이벤트를 살펴보세요~</h6>
				<div class="mb-3"></div>
			</div>
		</div>
		<div class="row">
			<div class="col-12 text-center">
				<a href="../common/home.jsp" class="btn btn-secondary btn-lg" role="button">Home</a>
				<a href="" class="btn btn-info btn-lg" role="button">로그인</a>
			</div>
		</div>
	</div>
	<div class="mb-3"></div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>