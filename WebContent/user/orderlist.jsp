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
<%@ include file="../common/navbar.jsp"%>
<div class="container">
	<div class="header">
		<div class="row">	
			<div class="col-4"><!-- 페이지명 바꿔서 사용하기 -->
				<h4>나의 정보</h4>
			</div>
			<div class="col-8"><!-- 홈>회원가입 같은 형태 바꿔서 사용하기(나중에 javascript로...) -->
				<ul class="nav justify-content-end">
				  <li class="nav-item">
				    <a class="nav-link active" href="#">홈</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled" href="#" aria-disabled="true">></a>
				  </li>
				 <li class="nav-item">
				    <a class="nav-link" href="#">나의정보</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">></a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">주문내역</a>
				  </li>
				</ul>
			</div>
		</div>
	</div>
	<div style="background-color: black; height: 2px;" class="mb-2"></div>
	<div class="body">
		<div class="row">
			<div class="col-12">
				<div class="navbar navbar-expand-sm ">
					<ul class="navbar-nav">
						<li class="nav-item  d-flex justify-content-between align-itens-center small"><a class="nav-link text-muted" href="detailform.jsp">매니아등급</a></li>
						<li class="nav-item  d-flex justify-content-between align-itens-center small"><a class="nav-link text-dark font-weight-bold" href="orderlist.jsp">주문내역</a></li>
						<li class="nav-item  d-flex justify-content-between align-itens-center small"><a class="nav-link text-muted" href="">1:1문의</a></li>
						<li class="nav-item  d-flex justify-content-between align-itens-center small"><a class="nav-link text-muted" href="">정보수정</a></li>
					</ul>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-12">
				<div class="jumbotron bg-dark text-white">
					<div class="row">
						<div class="col-9">
						  <h2 class="">@@님이 주문하신 내역입니다.</h2>
						  <div style="background-color: white; height: 2px; width: 65%;" class="my-3"></div>
						  <p class="text-muted">주문을 취소하시려면 해당 매장으로 전화하셔야 합니다.</p>
						</div>
						<div class="col-3">
						  <p><a class="text-muted text-center" href="#"><small>이용안내 ></small></a></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>