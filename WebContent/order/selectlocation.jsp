<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>도미노피자 - 당신의 인생에 완벽한 한끼! Life Food,Domino's</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<% String position = "order"; %>
<%@ include file="../common/navbar.jsp"%>
<div class="container">
	<div class="header">
		<div class="row">	
			<div class="col-4">
				<h4>주문방법 선택</h4>
			</div>
			<div class="col-8">
				<ul class="nav justify-content-end small text-muted">
				  <li class="nav-item">
				    <a class="nav-link text-muted active pr-1" href="#">홈</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled pr-1" href="#" tabindex="-1" aria-disabled="true">></a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled text-dark font-weight-bold pr-1" href="#" tabindex="-1" aria-disabled="true">주문방법 선택</a>
				  </li>
				</ul>
			</div>
		</div>
		
		<div style="background-color: black; height: 3px;" class="mt-2"></div>
		
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>