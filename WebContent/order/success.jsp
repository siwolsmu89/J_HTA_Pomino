<%@page import="com.domino.dao.LocationDao"%>
<%@page import="com.domino.vo.Location"%>
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
				<ul class="nav justify-content-end small text-muted">
				  <li class="nav-item">
				    <a class="nav-link text-muted active pr-1" href="/domino/common/home.jsp">홈</a>	<!--text-muted pr-1  -->
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled pr-1" href="#" tabindex="-1" aria-disabled="true">></a><!-- pr-1  -->
				  </li>
				  <li class="nav-item">
				    <a class="nav-link text-muted active pr-1" href="/domino/order/cart.jsp">장바구니</a><!--text-muted active pr-1  -->
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled pr-1" href="#" tabindex="-1" aria-disabled="true">></a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled text-dark font-weight-bold pr-1" href="#" tabindex="-1" aria-disabled="true">결제하기</a>
				  	<!--text-dark font-weight-bold pr-1  -->
				  </li>
				</ul>
			</div>
		</div>
		<div style="background-color: black; height: 2px;" class="mb-2"></div>
	</div>
	<div class="body">
		<div class="row">
			<div class="col-12">
				<div class="jumbotron jumbotron-fluid pb-2 bg-white">
				  <div class="container text-center">
				    <h1 class="py-2" >주문이 완료되었습니다.</h1>
					<%
						// 세션에 매장번호가 저장되어 있을 것, 원래는 그거 불러와서 쓰기
						int locationNo = (int) session.getAttribute("savedLocationNo");
						LocationDao locationDao = new LocationDao();
						Location location = locationDao.getLocationByNo(locationNo);
						BranchDao branchDao = new BranchDao();
						Branch branch = branchDao.getBranchByAddr(location.getAddrFirst());
					%>
					
					<h4 class="text-primary font-weight-bold py-2"><%=branch.getName() %> <%=branch.getTel() %></h4>
					<p class="mb-0 pt-2">주문을 취소할 경우 해당 매장으로 전화하여 취소 부탁드리며,</p>
					<p class="">접수완료 후에는 취소가 되지 않으니 양해 부탁드립니다.</p>
					<div id="link-button" class="py-4">
						<a href="../user/orderlist.jsp"><button class="btn btn-primary btn-lg">주문내역 보기</button></a>
					</div>
				  </div>
				</div>
				<hr />
			</div>
		</div>
	</div>
	<div class="mb-3"></div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>