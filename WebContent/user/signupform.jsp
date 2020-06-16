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
		String position="signup";
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
		<%
			String error = request.getParameter("error");
		%>
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-12">
						<ul class="nav nav-pills nav-fill">
						  <li class="nav-item">
						    <a class="nav-link bg-secondary text-white" href="#">01 개인정보입력</a>
						  </li>
						 <li class="nav-item">
						    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">02 가입완료</a>
						  </li>
						</ul>
					</div>
				</div>
					<div class="row">
						<div class="col-12 mt-2">
						<!-- 회원가입시 표시할 오류내용 시작  -->
							<%
								if("dup".equals(error)){
							%>
							<div class="alert alert-danger">
								<strong>오류!</strong> 이미 사용중인 아이디입니다.
							</div>
							<%
								}
							%>
							<!-- 회원가입시 표시할 오류내용 끝  -->
							<!-- 회원가입폼을 포함하고 있는 card 컴포넌트 시작 -->
							<div class="card ">
							<div class="card-body">
								<!-- 회원가입 입력 폼 시작  -->
								<form method="post" action="signup.jsp" onsubmit="checkField(event)">
									<div class="form-group">
		                    			<label>개인정보취급방침</label>
		                   				<div>
		                        			<textarea class="form-control" rows="8" style="resize:none">개인정보의 항목 및 수집방법
												블라블라블라블라블라블라블라블라블라블라블라블라                        
												블라블라블라블라블라블라블라블라블라블라블라블라
												블라블라블라블라블라블라블라블라블라블라블라블라.................
		                        			</textarea>
			                        		<div class="radio">
			                            		<label>
			                                		<input type="radio" id="memberInfoYn" name="memberInfoYn" value="Y" checked>
			                                		동의합니다.
			                            		</label>
			                        		</div>
			                       			 <div class="radio">
			                            		<label>
			                                		<input type="radio" id="memberInfoYn" name="memberInfoYn" value="N">
			                                		동의하지 않습니다.
			                            		</label>
			                        		</div>
		                    			</div>
		                			</div>
									<div class="form-group">
										<label>이름</label>
										<input type="text" class="form-control" name="username" placeholder="예)홍길동"/>
									</div>
									<div class="form-group">
										<label>아이디</label>
										<input type="text" class="form-control" name="userid" placeholder="영문(대소문자),숫자를 조합해주세요."/>
									</div>
									<div class="form-group">
										<label>비밀번호</label>
										<input type="password" class="form-control" name="userpwd" placeholder="영문(대소문자),숫자,특수기호를 조합해주세요."/>
									</div>
									<div class="form-group">
										<label>생년월일</label>
										<div>
											<input type="date"  class="form-control" name="userbirth" />
										</div>
									</div>
									<!-- 라디오버튼 예시 시작 -->
									<div class="form-group">
										<label>성별</label>
										<div>
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" class="custom-control-input" name="usergender" id="gender-male" value="M" checked>
												<label class="custom-control-label" for="gender-male">남자</label>
			  								</div>
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" class="custom-control-input" name="usergender" id="gender-female" value="F">
												<label class="custom-control-label" for="gender-female">여자</label>
			  								</div>
										</div>
									</div>
									<!-- 라디오버튼 예시 끝 -->
									<div class="form-group">
		                        		<label>휴대폰 번호</label>
		                        			<input type="tel" class="form-control" name="usertel" id="inputMobile" placeholder="예)010-1234-5678">
		                    		</div>
									<div class="form-group">
										<label for="exampleFormControlInput1">이메일</label>
		    							<input type="email" class="form-control" name="useremail" id="exampleFormControlInput1" placeholder="예)name@example.com">
									</div>
									<div class="form-group">
										<label>이메일 수신여부</label>
		                    			<label>
		                            		<input type="radio" id="emailReceiveYn" name="emailReceiveYn" value="Y" checked> 동의합니다.
		                       			</label>
		                        		<label>
		                            		<input type="radio" id="emailReceiveYn" name="emailReceiveYn" value="N"> 동의하지 않습니다.
		                        		</label>
									</div>
									
									 <div class="form-group">
		                    			<label>SMS 수신여부</label>
				                        <label>
				                            <input type="radio" id="smsReceiveYn" name="smsReceiveYn" value="Y" checked> 동의합니다.
				                        </label>
				                        <label class="radio-inline">
				                            <input type="radio" id="smsReceiveYn" name="smsReceiveYn" value="N"> 동의하지 않습니다.
				                        </label>
		                    		</div>
		                
									
									<div class="text-right">
										<button type="submit" class="btn btn-primary">가입하기</button>
									</div>
								</form>
								<!-- 회원가입 입력 폼 끝  -->
							</div>
						</div>
						<!-- 회원가입폼을 포함하고 있는 card 컴포넌트 시작 -->
					</div>
				</div>
		<!-- 오류알림과 입력폼을 포함하는 row 끝 -->
			</div>
		</div>
	</div>
	<div class="mb-3"></div>
</div>
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
	function checkField(event) {
		
		var nameField = document.querySelector("input[name=username]");
		var idField = document.querySelector("input[name=userid]");
		var pwdField = document.querySelector("input[name=userpwd]");
		var birthField = document.querySelector("input[name=userbirth]");
		var genderField = document.querySelector("input[name=usergender]");
		var telField = document.querySelector("input[name=usertel]");
		var emailField = document.querySelector("input[name=useremail]");
		
		var isPassed = true;
		if(!nameField.value) {
			alert('이름을 입력하세요.');
			isPassed = false;
		}
		if(!idField.value) {
			alert('아이디를 입력하세요.');
			isPassed = false;
		}
		if(!pwdField.value) {
			alert('비밀번호를 입력하세요.');
			isPassed = false;
		}
		if(!birthField.value) {
			alert('생일을 선택하세요.');
			isPassed = false;
		}
		if(!genderField.value) {
			alert('성별을 선택하세요.');
			isPassed = false;
		}
		if(!telField.value) {
			alert('전화번호를 입력하세요.("-"를 입력하여 적으세요.)');
			isPassed = false;
		}
		if(!emailField.value) {
			alert('이메일을 입력하세요.');
			isPassed = false;
		}
		if(!isPassed){
			event.preventDefault();
		}
	}
</script>
</body>
</html>