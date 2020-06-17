<%@page import="com.domino.vo.Branch"%>
<%@page import="com.domino.dao.BranchDao"%>
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
<% String position = "order"; %>
<%@ include file="../common/navbar.jsp"%>
<div class="container">
	<div class="header">
		<div class="row">	
			<div class="col-4">
			</div>
			<div class="col-8">
				<ul class="nav justify-content-end">
				  <li class="nav-item">
				    <a class="nav-link active" href="#">홈</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">></a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link active" href="#">장바구니</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">></a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">결제하기</a>
				  </li>
				</ul>
			</div>
		</div>
	</div>
	<div class="body">
		<div class="row">
			<div class="col-12 text-center mt-5 mb-3">
				<div id="info-header" class="mt-5">
					<h3 class="mb-5 mt-3 font-weight-bold">주문이 완료되었습니다.</h3>
					
					<%
						// 세션에 매장번호가 저장되어 있을 것, 원래는 그거 불러와서 쓰기
						int branchNo = 100;
						BranchDao branchDao = new BranchDao();
						Branch branch = branchDao.getBranchByNo(branchNo);
					%>
					
					<h5 class="text-info"><%=branch.getName() %> <%=branch.getTel() %></h5>
				</div>
				<div id="info-body" class="mt-5">
					<div id="info-text" class="mb-5 text-muted">
						<p>주문을 취소할 경우 해당 매장으로 전화하여 취소 부탁드리며,</p>
						<p>접수완료 후에는 취소가 되지 않으니 양해 부탁드립니다.</p>
					</div>
				</div>
				<div id="info-footer">
					<div id="link-button">
						<a href="../user/orderlist.jsp"><button class="btn btn-dark btn-lg">주문내역 보기</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>