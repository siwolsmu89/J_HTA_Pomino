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
  <style type="text/css">
  	.field-error {
		border: 1px solid red;
	}	
  </style>
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
							<a class="nav-link <%="userques".equals(subPosition) ? "font-weight-bold text-dark" : "text-muted"%>" href="questionform.jsp">1:1문의</a>
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
			<%
				UserDao userDao = new UserDao();
				User user = userDao.getUserByNo(loginUserNo);
				
			%>
			<div class="col-12 mt-2">				
				<!-- 회원가입폼을 포함하고 있는 card 컴포넌트 시작 -->
			
				<div class="card ">
					<div class="card-body">
						<!-- 회원가입 입력 폼 시작  -->
						<form method="post" action="modify.jsp" onsubmit="checkField(event)">
							<input type="hidden" class="form-control" name="userno" value="<%=user.getNo()%>">
							<div class="form-group">
								<label>이름</label>
								<input type="text" class="form-control" name="username" value=<%=user.getName() %> disabled/>
							</div>
							<div class="form-group">
								<label>아이디</label>
								<input type="text" class="form-control" name="userid" value=<%=user.getId() %> disabled/>
							</div>
							<div class="form-group">
								<label>비밀번호</label>
								<input type="password" class="form-control" name="userpwd" placeholder="영문(대소문자),숫자,특수기호를 조합해주세요."/>
								<p class="small px-1 text-danger font-weight-bold">(변경을 원하지 않으시면 기존의 비밀번호를 입력해 주세요)</p>
							</div>
							<div class="form-group">
                        		<label>휴대폰 번호</label>
                        			<input type="tel" class="form-control" name="usertel" value=<%=user.getTel() %>>
                    		</div>
							<div class="form-group">
								<label for="exampleFormControlInput1">이메일</label>
    							<input type="email" class="form-control" name="useremail" value=<%=user.getEmail() %>>
							</div>
                
							<div class="text-center row">
								<div class="col-6">
									<button type="reset" class="btn btn-secondary btn-block">초기화</button>
								</div>
								<div class="col-6">
									<button type="submit" class="btn btn-primary btn-block" onclick="alertcomplete(event)">수정하기</button>								
								</div>
							</div>
							<div class="row">
								<div class="col-12 text-center">
									<div class="small text-muted m-2">도미노피자를 더 이상 이용하지 않는다면 <a href="deleteform.jsp" class="text-dark font-weight-bold">회원탈퇴 바로가기 ></a></div>															
								</div>
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
<script type="text/javascript">
function checkField(event) {
	clearErrorField();
	var pwdField = document.querySelector("input[name=userpwd]");
	
	var isPassed = true;
	if(!pwdField.value) {
		pwdField.classList.add("field-error");
		isPassed = false;
	}
	
	if(!isPassed){
		event.preventDefault();
	}
}

function clearErrorField() {
	var fields = document.querySelectorAll(".form-group input");
	for(var i=0;i<fields.length;i++) {
		var input = fields[i];
		input.classList.remove('field-error');
	}
}
function alertcomplete(event) {
	if(confirm('수정하시겠습니까?')){
	
	} else {
		event.preventDefault();
	}
}
</script>
</body>
</html>