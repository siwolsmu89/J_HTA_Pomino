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
	String subPosition = "userques";
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
				    <a class="nav-link text-muted active pr-1" href="#">홈</a>	<!--text-muted pr-1  -->
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled pr-1" href="#" tabindex="-1" aria-disabled="true">></a><!-- pr-1  -->
				  </li>
				  <li class="nav-item">
				    <a class="nav-link text-muted active pr-1" href="#">나의정보</a><!--text-muted active pr-1  -->
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled pr-1" href="#" tabindex="-1" aria-disabled="true">></a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled text-dark font-weight-bold pr-1" href="#" tabindex="-1" aria-disabled="true">1:1문의</a>
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
						<div class="col12">
						  <h2 class=""><%=loginUserName %>님께서 문의하신 내용입니다.</h2>
						  <div style="background-color: #00B9FF; height: 4px; width: 100%;" class="my-3"></div>
						  <p class="text-muted"><%=loginUserName %>님께서 문의하신 내용은 <strong class="text-white">총0건</strong>입니다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
				<div class="col-12">
					<table class="table text-center">
						<colgroup>
							<col width="10%">
							<col width="40%">
							<col width="30%">
							<col width="20%">
						</colgroup>
						<thead class="thead thead-dark">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>등록일</th>
								<th>처리상태</th>
							</tr>
						</thead>
						
						<tbody>
							<tr>
								<td>1</td>
								<td>제품관련</td>
								<td>2020-06-15</td>
								<td>
									<button class="btn btn-primary" disabled>답변대기</button>
								</td>
							</tr>
							<tr>
								<td>2</td>
								<td>칭찬</td>
								<td>2020-06-20</td>
								<td>
									<button class="btn btn-primary" disabled>답변대기</button>
								</td>
							</tr>
						</tbody>
						
					</table>
					<div class="row">
						<div class="col-12 text-center">
							<button type="button" class="btn btn-dark" data-toggle="modal" data-target="#questionbutton">
							  문의하기
							</button>
						</div>
					</div>
					
					<div class="modal fade" id="questionbutton" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">1:1 문의</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								
								<form method="post" action="question.jsp">
									<div class="modal-body">
										<div class="row">
											<div class="col-12">
												<div class="alert alert-danger">
													<strong>오류!</strong> 제목 또는 내용을 입력하지 않았습니다.
												</div>
												<div class="alert alert-danger">
													<strong>오류!</strong> 문의사항을 선택하지 않았습니다.
												</div>
												<div class="alert alert-danger">
													<strong>오류!</strong> 매장을 선택하지 않았습니다.
												</div>
												<div class="form-group">
													<label>아이디</label>
													<input type="text" class="form-control"
														name="userid" disabled />
												</div>
												<div class="form-group">
													<label>연락처</label> <input type="tel"
														class="form-control" name="usertel" disabled/>
												</div>
												<div class="form-group">
													<label>이메일</label> <input type="email" class="form-control"
														name="useremail" disabled/>
												</div>
												<div class="form-group">
													<label>문의유형</label>
											      	<select class="custom-select mr-sm-2" id="inlineFormCustomSelect">
											        	<option selected>선택</option>
											        	<option value="1">제품관련</option>
											        	<option value="2">배달서비스 관련</option>
											        	<option value="3">직원서비스 관련</option>
											        	<option value="4">콜센터 관련</option>
											        	<option value="5">칭찬</option>
											        	<option value="6">제안</option>
											        	<option value="7">단순문의</option>
											        	<option value="8">기타</option>
											      	</select>
												</div>
												<div class="form-group row">
													<div class="col-6">
														<label>매장선택</label> 
														<select class="custom-select mr-sm-2">
												        	<option selected>지역</option>
												        	<option value="seoul">서울</option>
												        	<option value="incheon">인천</option>
												        	<option value="gyeonggi">경기</option>
												        	<option value="gangwor">강원</option>
												        	<option value="chungnam">충남</option>
												        	<option value="chungbuk">충북</option>
												        	<option value="daejeon">대전</option>
												        	<option value="gyeongnam">경남</option>
												        	<option value="gyeongbuk">경북</option>
												        	<option value="daegu">대구</option>
												        	<option value="jeonnam">전남</option>
												        	<option value="jeonbuk">전북</option>
												        	<option value="gwangju">광주</option>
												        	<option value="ulsan">울산</option>
												        	<option value="busan">부산</option>
												        	<option value="jeju">제주</option>
												        	<option value="sejong">세종특별자치시</option>
												      	</select>
													</div>
													<div class="col-6"> <!-- ajax 사용하고 디비에서 불러오기 -->
														<label class="invisible">매장선택</label> 
														<select class="custom-select mr-sm-2">
												        	<option selected>매장 선택</option>
												        	<option value="1">가락점</option>
												        	<option value="2">가산점</option>
												        	<option value="3">가좌점</option>
												        	<option value="4">콜센터 관련</option>
												        	<option value="5">칭찬</option>
												        	<option value="6">제안</option>
												        	<option value="7">단순문의</option>
												        	<option value="8">기타</option>
												      	</select>
													
													</div>
												</div>
												
												<div class="form-group">
													<label>제목</label> <input type="text" class="form-control"
														name="questiontitle" />
												</div>

												<!-- 텍스트입력화면 예시 끝 -->
												<div class="form-group">
													<label for="questioncontent">문의내용</label>
													<textarea class="form-control" rows="5" name="description"
														id="questioncontent"></textarea>
												</div>
												<!-- 텍스트입력화면 예시 끝 -->

											
										</div>
									</div>
									<div class="row">
										<div class="col-12 small text-muted">
										<p class="m-0">등록하신 내용 및 답변은 회원정보상의 이메일로도 발송이 됩니다.</p>
										<p class="m-0">상담원과 통화를 원하시면 아래 번호로 전화주시기 바랍니다.</p>
										<p class="m-0">고객만족 센터 : <span style="color: #00B9FF">080-123-9632</span></p>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="reset" class="btn btn-secondary">다시 작성</button>
									<button type="button" class="btn btn-info">답변 등록</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- 페이지 처리 시작 -->
				<ul class="pagination justify-content-center"
					style="margin: 20px 0">
					<li class="page-item "><a class="page-link" href="#">이전</a></li>
					<li class="page-item active"><a class="page-link" href="#">1</a></li>
					<li class="page-item "><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#">다음</a></li>
				</ul>
				<!-- 페이지 처리 끝 -->

			</div>
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>