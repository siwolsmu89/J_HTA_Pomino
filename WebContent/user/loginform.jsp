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
<style type="text/css">
	.field-error {
		border: 1px solid red;
	}
	
	html {
  		overflow-y: scroll;
	}
</style>
</head>
<body>
<%
	String position = "signup";

%>
<%@ include file="../common/navbar.jsp"%>
<div class="container">

	<div class="header">
		<div class="row">	
			<div class="col-4">
				<h4>로그인</h4>
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
					    <a class="nav-link disabled text-dark font-weight-bold pr-1" href="#" tabindex="-1" aria-disabled="true">로그인</a>
					  	<!--text-dark font-weight-bold pr-1  -->
					  </li>
				</ul>
			</div>
		</div>
	</div>
	
	<div style="background-color: black; height: 2px;" class="mb-2"></div>
	
	<div class="body">
		<%
			String error = request.getParameter("error");
		%>
		<div class="row justify-content-md-center">
			<div class="col-7">
				<!-- 로그인 오류시 표시할 오류내용 예시 시작 -->
				<%
					if("fail".equals(error)) {
				%>
				<div class="alert alert-danger">
	  				<strong>오류!</strong> 아이디 혹은 비밀번호가 일치하지 않습니다.
				</div>
				<%
					}
				%>
				<%
					if("deny".equals(error)) {
				%>
				<div class="alert alert-danger">
	  				<strong>오류!</strong> 해당 페이지는 로그인 후 사용가능합니다.
				</div>
				<%
					}
				%>
				<!-- 로그인 오류시 표시할 오류내용 예시 끝 -->
				
				<!-- 로그인 입력폼을 포함하고 있는 card 시작 -->
				<div class="card ">
					<div class="card-body">
						<h3 class="card-title text-center">로그인</h3>
						<!-- 로그인 입력폼 시작  -->
						<form method="post" action="login.jsp" onsubmit="checkField(event)">
							<div class="form-group">
								<label for="user-id">아이디</label>
								<input type="text" class="form-control" name="userid" id="user-id"/>
							</div>
							<div class="form-group">
								<label for="user-pwd">비밀번호</label>
								<input type="password" class="form-control" name="userpwd" id="user-pwd"/>
							</div>
							<div class="text-right">
								<button type="submit" class="btn btn-primary btn-lg btn-block">로그인</button>
								<a class="btn btn-light btn-lg btn-block" href="signupform.jsp">회원가입</a>
							</div>
						</form>
						<!-- 로그인 입력폼 끝  -->
					</div>
				</div>
				
				<!-- 로그인 입력폼을 포함하고 있는 card 끝 -->
			</div>
		</div>
	</div>
	<div class="mb-3"></div>
</div>
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
	function checkField(event) {
		clearErrorField();
		var idField = document.querySelector("input[name=userid]");
		var pwdField = document.querySelector("input[name=userpwd]");
		
		var isPassed = true;
		if(!idField.value) {
			idField.classList.add("field-error");
			isPassed = false;
		}
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
</script>
</body>
</html>