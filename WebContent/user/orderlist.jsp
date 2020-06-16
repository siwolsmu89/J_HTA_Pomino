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
	String subPosition = "userorder";
%>
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
						<div class="col-9">
						  <h2 class=""><%=loginUserName %>님이 주문하신 내역입니다.</h2>
						  <div style="background-color: #00B9FF; height: 4px; width:60%;" class="my-3"></div>
						  <p class="text-muted">주문을 취소하시려면 해당 매장으로 전화하셔야 합니다.</p>
						</div>
						<div class="col-3 text-right"> <!-- 이용안내 만들기 -->
						  <p><a class="text-muted" href="#"><small>이용안내 ></small></a></p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-12">
				<p class="text-center font-weight-bold" style="border: 1px solid black; border-bottom: none;">피자 주문</p>
			</div>
		</div>
		
		<div class="row">
			<div class="col-12">
				<div class="m-4 p-4 text-center font-weight-bold">
					<p>주문내역이 없습니다.</p>
				</div>
				<hr/>	
			</div>
		</div>
		
		<div class="row"><!-- 제품리스트 완료되면 연결하기 -->
			<div class="col-12 text-center">
				<a href="#" class="btn btn-info btn-lg" role="button">신제품보러가기</a>
				<a href="#" class="btn btn-secondary btn-lg" role="button">다른제품 보러가기</a>
			</div>
		</div>
		
		<!-- 주문완료되면 연결하기
		<div class="row">
			<div class="col-12">
			
				<div class="row small font-weight-bold">
					<div class="col-6 text-left"> 
						<div class="row">
							<div class="col-2">
								<p>배달</p>
							</div>
							<div class="col-5">
								<p>주문번호 12121212121</p>
							</div>
							<div class="col-5">
								<p>주문일자 20200506</p>
							</div>
						</div>
					</div>
					<div class="col-6 text-right"> 
						<div class="row">
							<div class="col-6"></div>
							<div class="col-3">
								<div><a class="text-dark" href="#">+재주문하기</a></div>
							</div>	
							<div class="col-3">
								<div><a class="text-muted" href="#">+퀵오더등록</a></div>
							</div>
						</div>
					</div>
				</div>
				
				<hr/>
				<div class="row">
					<div class="col-3">
						<h4 class="">수령완료</h4>
						<p class="small text-muted">안양석수점 031-1111-1212</p>
					</div>
					<div class="col-6 text-center">
						<p>시리얼 칠리크랩 슈퍼시드 함유도우 슈퍼시드 함유 도우 27,650원</p>
					</div>
					<div class="col-3 text-right text-white">
						<a type="button" class="btn btn-dark small font-weight-bold">상세보기</a>
					</div>
				</div>
			</div>
		</div>
			 -->
	</div>
	<div class="mb-3"></div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>