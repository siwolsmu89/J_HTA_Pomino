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
				<ul class="nav justify-content-end small text-muted">
				  <li class="nav-item">
				    <a class="nav-link text-muted active pr-1" href="/domino/common/home.jsp">홈</a>	<!--text-muted pr-1  -->
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled pr-1" href="#" tabindex="-1" aria-disabled="true">></a><!-- pr-1  -->
				  </li>
				  <li class="nav-item">
				    <a class="nav-link text-muted active pr-1" href="/domino/user/detailform.jsp">나의정보</a><!--text-muted active pr-1  -->
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled pr-1" href="#" tabindex="-1" aria-disabled="true">></a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled text-dark font-weight-bold pr-1" href="#" tabindex="-1" aria-disabled="true">정보수정</a>
				  	<!--text-dark font-weight-bold pr-1  -->
				  </li>
				</ul>
			</div>
		</div>
	<div style="background-color: black; height: 2px;" class="mb-2"></div>
	<div class="row">
			<div class="col-12">
				<div class="navbar navbar-expand-sm ">
					<ul class="navbar-nav">
						<li class="nav-item  d-flex justify-content-between align-items-center small">
							<a class="nav-link <%="usergrade".equals(subPosition) ? "font-weight-bold text-dark" : "text-muted"%>" href="detailform.jsp">매니아등급</a>
						</li>
						<li class="nav-item  d-flex justify-content-between align-items-center small">
							<a class="nav-link <%="userorder".equals(subPosition) ? "font-weight-bold text-dark" : "text-muted"%>" href="orderlist.jsp">주문내역</a>
						</li>
						<li class="nav-item  d-flex justify-content-between align-items-center small">
							<a class="nav-link <%="userques".equals(subPosition) ? "font-weight-bold text-dark" : "text-muted"%>" href="">1:1문의</a>
						</li>
						<li class="nav-item  d-flex justify-content-between align-items-center small">
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
						  <h2 class="">도미노피자 회원탈퇴</h2>
						  <div style="background-color: #00B9FF; height: 4px; width: 40%;" class="my-3"></div>
						  <p class="text-muted">도미노피자를 이용해주셔서 감사합니다.불편하셨던 점이나 불만사항을 알려주시면 적극 반영하도록 노력하겠습니다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12 small text-danger text-left font-weight-bold">
				<p>*탈퇴시 고객님께서 보유하셨던 온라인 쿠폰과 등급 기록이 모두 삭제되며, 한번 탈퇴한 아이디는 다시 사용 불가능합니다.</p>
			</div>
		</div>
		<div style="background-color: black; height: 2px;" class="mb-2"></div>
		<div class="row">
			<div class="col-12">
				<div class="card ">
					<div class="card-body">
						<form method="post" action="delete.jsp">
							<div class="form-group">
								<label>탈퇴사유</label>
								<div class="m-2 small">
									<div class="custom-control custom-radio custom-control-inline ">
										<input type="radio" class="custom-control-input" name="deletetitle" id="delete-1" value="답변불만" checked>
										<label class="custom-control-label" for="delete-1">관리자 답변 불만</label>
	  								</div>
									<div class="custom-control custom-radio custom-control-inline mx-2">
										<input type="radio" class="custom-control-input" name="deletetitle" id="delete-2" value="서비스불만">
										<label class="custom-control-label"  for="delete-2">회사 서비스에 대한 불만</label>
	  								</div>
	  								<div class="custom-control custom-radio custom-control-inline mx-2">
										<input type="radio" class="custom-control-input" name="deletetitle" id="delete-3" value="성능불만">
										<label class="custom-control-label"  for="delete-3">시스템 성능 불만</label>
	  								</div>
	  								<div class="custom-control custom-radio custom-control-inline mx-2">
										<input type="radio" class="custom-control-input" name="deletetitle" id="delete-4" value="정보미흡">
										<label class="custom-control-label"  for="delete-4">사이트 정보 미흡</label>
	  								</div>
	  								<div class="custom-control custom-radio custom-control-inline mx-2">
										<input type="radio" class="custom-control-input" name="deletetitle" id="delete-5" value="광고메일">
										<label class="custom-control-label"  for="delete-5">광고 메일 수신</label>
	  								</div>
	  								<div class="custom-control custom-radio custom-control-inline mx-2">
										<input type="radio" class="custom-control-input" name="deletetitle" id="delete-6" value="개인정보보호">
										<label class="custom-control-label"  for="delete-6">개인정보 보호</label>
	  								</div>
	  								<div class="custom-control custom-radio custom-control-inline mx-2">
										<input type="radio" class="custom-control-input" name="deletetitle" id="delete-7" value="기타">
										<label class="custom-control-label"  for="delete-7">기타</label>
	  								</div>
								</div>
							</div>
							<div class="form-group">
								<label>내용</label>
								<div>
                        			<textarea class="form-control" rows="8" style="resize:none" onsubmit="alertdanger(event)" name="deletecontent"></textarea>
                        		</div>
							</div>
							<div class="text-center">
								<a class="btn btn-secondary btn-lg" href="modifyform.jsp">탈퇴 취소</a>
								<button type="submit" class="btn btn-primary btn-lg">탈퇴하기</button>
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