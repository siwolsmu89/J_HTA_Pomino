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
					<div class="alert alert-danger">
						<strong>오류!</strong> 회원가입 정보가 올바르지 않습니다.
					</div>
					<!-- 회원가입시 표시할 오류내용 끝  -->
					<!-- 회원가입폼을 포함하고 있는 card 컴포넌트 시작 -->
					<div class="card ">
					<div class="card-body">
						<!-- 회원가입 입력 폼 시작  -->
						<form method="post" action="signup.jsp">
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
								<input type="text" class="form-control" name="id" placeholder="예)홍길동"/>
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
								<label>비밀번호 확인</label>
								<input type="password" class="form-control" name="userpwdcheck"/>
							</div>
							<div class="form-group">
								<label>생년월일</label>
								
							</div>
							<!-- 라디오버튼 예시 시작 -->
							<div class="form-group">
								<label>성별</label>
								<div>
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" class="custom-control-input" name="gender" id="gender-male" value="남" checked>
										<label class="custom-control-label" for="gender-male">남자</label>
	  								</div>
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" class="custom-control-input" name="gender" id="gender-female" value="여">
										<label class="custom-control-label" for="gender-female">여자</label>
	  								</div>
								</div>
							</div>
							<!-- 라디오버튼 예시 끝 -->
							<div class="form-group">
                        		<label>휴대폰 번호</label>
                        			<input type="tel" class="form-control" id="inputMobile" placeholder="예)010-1234-5678">
                    		</div>
							<div class="form-group">
								<label for="exampleFormControlInput1">이메일</label>
    							<input type="email" class="form-control" id="exampleFormControlInput1" placeholder="예)name@example.com">
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
	<div class="mb-3"></div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>