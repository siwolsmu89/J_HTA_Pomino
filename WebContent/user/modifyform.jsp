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
	String subPosition = "usermodi";
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
				    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">정보수정</a>
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
		<div class="row">
			<div class="col-12">
				<div class="jumbotron bg-dark text-white">
					<div class="row">
						<div class="col12">
						  <h2 class="">개인정보 입력 안내문</h2>
						  <div style="background-color: #00B9FF; height: 4px; width:60%;" class="my-3"></div>
						  <p class="text-muted">회원정보를 정확히 기입하셔야 주문이나 이벤트에 대한 불이익이 없습니다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="background-color: black; height: 2px;" class="mb-2"></div>
		<div class="row">
				<div class="col-12 mt-2">				
					<!-- 회원가입폼을 포함하고 있는 card 컴포넌트 시작 -->
					<div class="card ">
					<div class="card-body">
						<!-- 회원가입 입력 폼 시작  -->
						<form method="post" action="modify.jsp">
							<div class="form-group">
								<label>이름</label>
								<input type="text" class="form-control" name="id" disabled/>
							</div>
							<div class="form-group">
								<label>아이디</label>
								<input type="text" class="form-control" name="userid" disabled/>
							</div>
							<div class="form-group">
								<label>비밀번호</label>
								<input type="password" class="form-control" name="userpwd" placeholder="영문(대소문자),숫자,특수기호를 조합해주세요."/>
								<div class="m-1 text-white text-right"><button type="button" class="btn btn-dark btn-sm">확인</button></div>
							</div>
							<div class="form-group">
                        		<label>휴대폰 번호</label>
                        			<input type="tel" class="form-control" id="inputMobile" placeholder="예)010-1234-5678">
                    		</div>
							<div class="form-group">
								<label for="exampleFormControlInput1">이메일</label>
    							<input type="email" class="form-control" id="exampleFormControlInput1" placeholder="예)name@example.com">
							</div>
                
							<div class="text-center">
								<button type="reset" class="btn btn-light btn-lg">초기화</button>
								<button type="submit" class="btn btn-info btn-lg">수정하기</button>
								<div class="small text-muted m-2">도미노피자를 더 이상 이용하지 않는다면 <a href="deleteform.jsp" class="text-dark font-weight-bold">회원탈퇴 바로가기 ></a></div>
							</div>
						</form>
					
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