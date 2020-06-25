<%@page import="com.domino.util.NumberUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.domino.vo.Question"%>
<%@page import="com.domino.dao.QnaDao"%>
<%@page import="com.domino.dto.UserDto"%>
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
			UserDto userDto = userDao.getCountQuestionUserByNo(loginUserNo);
		%>
		<div class="row">
			<div class="col-12">
				<div class="jumbotron bg-dark text-white">
					<div class="row">
						<div class="col12">
						  <h2 class=""><%=loginUserName %>님께서 문의하신 내용입니다.</h2>
						  <div style="background-color: #00B9FF; height: 4px; width: 100%;" class="my-3"></div>
						  <p class="text-muted"><%=loginUserName %>님께서 문의하신 내용은 <strong class="text-white">총<%=userDto.getQuestionCount()%>건</strong>입니다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
				<%
					int rowsPerPage = 5;
					int pageNo = NumberUtil.stringToInt(request.getParameter("page"), 1);
					int beginRowNumber = (pageNo - 1)*rowsPerPage + 1;
					int endRowNumber = pageNo*rowsPerPage;
					
					QnaDao qnaDao = new QnaDao();
					//List<Question> questions = qnaDao.getQuestionAllByUserNo(loginUserNo);
					List<Question> questions = qnaDao.getQuestionAllRangeByUserNo(loginUserNo, beginRowNumber, endRowNumber);
				%>
				<div class="col-12">
					<table class="table text-center table-hover">
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
						
							<%
								if (questions.isEmpty()) {
							%>
								<tr>
									<td class="text-center" colspan="6">게시글이 없습니다.</td>
								</tr>
							<%
								} else {
									int index = (pageNo - 1) * 10 + 1;
									for (Question question : questions) {
										// 삭제처리된 글인 경우
										if ("Y".equals(question.getQuestionDelYn())) {
							%>		
											<tr>
												<td class="text-center"><%=index++ %></td>
												<td colspan="5"><del>삭제된 글입니다.</del></td>
											</tr>
										
							<%				
										} else {
							%>
										
											<tr>
												<td><%=index++ %></td>
												<td><a class="text-dark font-weight-bold" href="questiondetail.jsp?questionno=<%=question.getNo() %>&page=<%=pageNo%>"><%=question.getTitle() %></a></td>
												<td><%=question.getRegDate() %></td>
												<td>
											<%
													if(!"Y".equals(question.getAnsweredYn())) {
											%>
													<button class="btn btn-primary" disabled>답변대기</button>
											<%
													} else {
											%>
													<button class="btn btn-secondary" disabled>답변완료</button>
											<%			
													}
											%>
												</td>
											</tr>		
							
							<%
										}
									}
								}
							%>
							
							
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
										<%
											String error = request.getParameter("error");
										%>
										<div class="row">
										
											<div class="col-12">
												
												<%
													if("empty".equals(error)) {
												%>
												<div class="alert alert-danger">
													<strong>오류!</strong> 정보를 선택 또는 입력하세요.
												</div>
												<%
													}
												%>
												<div class="form-group">
													<label>아이디</label>
													<input type="text" class="form-control"
														name="userid" value=<%=user.getId() %>  disabled />
												</div>
												<div class="form-group">
													<label>연락처</label> <input type="tel"
														class="form-control" name="usertel" value=<%=user.getTel() %> disabled/>
												</div>
												<div class="form-group">
													<label>이메일</label> <input type="email" class="form-control"
														name="useremail" value=<%=user.getEmail() %> disabled/>
												</div>
												<div class="form-group">
													<label>문의유형</label>
											      	<select class="custom-select mr-sm-2" name="questiontype" id="inlineFormCustomSelect">
											        	<option selected>선택</option>
											        	<option value="제품관련">제품관련</option>
											        	<option value="배달서비스 관련">배달서비스 관련</option>
											        	<option value="직원서비스 관련">직원서비스 관련</option>
											        	<option value="콜센터 관련">콜센터 관련</option>
											        	<option value="칭찬">칭찬</option>
											        	<option value="제안">제안</option>
											        	<option value="단순문의">단순문의</option>
											        	<option value="기타">기타</option>
											      	</select>
												</div>
												<div class="form-group row">
													<div class="col-6">
														<label>매장선택</label> 
														<select class="custom-select mr-sm-2" name="branchaddr" onchange="refreshBranches(event);">
												        	<option value="" selected disabled>지역</option>
												        	<option value="서울">서울</option>
												        	<option value="인천">인천</option>
												        	<option value="경기">경기</option>
												        	<option value="강원">강원</option>
												        	<option value="충남">충남</option>
												        	<option value="충북">충북</option>
												        	<option value="대전">대전</option>
												        	<option value="경남">경남</option>
												        	<option value="경북">경북</option>
												        	<option value="대구">대구</option>
												        	<option value="전남">전남</option>
												        	<option value="전북">전북</option>
												        	<option value="광주">광주</option>
												        	<option value="울산">울산</option>
												        	<option value="부산">부산</option>
												        	<option value="제주">제주</option>
												        	<option value="세종">세종</option>
												      	</select>
													</div>
													<div class="col-6"> <!-- ajax 사용하고 디비에서 불러오기 -->
														<label class="invisible">매장선택</label> 
														<select class="custom-select mr-sm-2" name="branchname" id="branch-combobox">
												        	<option value="" selected disabled>매장 선택</option>
												      	</select>
													
													</div>
												</div>
												
												<div class="form-group">
													<label>제목</label> 
													<input type="text" class="form-control" name="questiontitle" />
												</div>

												<!-- 텍스트입력화면 예시 끝 -->
												<div class="form-group">
													<label for="questioncontent">문의내용</label>
													<textarea class="form-control" rows="5" name="questioncontent"
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
								
								<div class="modal-footer row">
									<div class="col-12">
										<button type="reset" class="btn btn-secondary btn-block">다시 작성</button>
										<button type="submit" class="btn btn-primary btn-block" onclick="alertcomplete(event)">질문 등록</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-12 text-center">
						<!-- 페이지 처리 시작 -->
						<ul class="pagination justify-content-center"
							style="margin: 20px 0;">
				<%
						int pagesPerBlock = 5;
						int rows = qnaDao.getQuestionByUserno(loginUserNo).size();
						int totalPages = (int) Math.ceil((double)rows/rowsPerPage);
						int totalBlock = (int) Math.ceil((double) totalPages/pagesPerBlock);
						int currentBlock = (int) Math.ceil((double) pageNo/pagesPerBlock);
						int beginPageNo = (currentBlock-1)*pagesPerBlock+1;
						int endPageNo = currentBlock*pagesPerBlock;
						if(pageNo > 1) {
				%>
							<li class="page-item "><a class="page-link" href="questionform.jsp?page=<%=pageNo - 1%>">이전</a></li>
				<%
						}
				%>
				<%
						for(int num=beginPageNo; num <=endPageNo; num++) {
							if(endPageNo > totalBlock) {
								endPageNo = totalPages;
							}
				%>
							<li class="page-item <%=pageNo == num ? "active" : ""%> "><a class="page-link" href="questionform.jsp?page=<%=num%>"><%=num%></a></li>
				<%
						}
				%>
				<%
						if(pageNo < totalPages) {
				%>
							<li class="page-item"><a class="page-link" href="questionform.jsp?page=<%=pageNo + 1%>">다음</a></li>
				<%
						}
				%>
						</ul>
						<!-- 페이지 처리 끝 -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="mb-3"></div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
<script type="text/javascript">
	function refreshBranches(event) {
		
		var combobox = document.querySelector("#branch-combobox");
		
		//alert(event.target.value);
		var comboboxValue = event.target.value;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var branches = JSON.parse(xhr.responseText);
				var options = "";
				for (var i=0; i<branches.length; i++) {
					var branch = branches[i]
					options += '<option value="'+branch.no+'"> '+branch.name+'</option>';
				}
				combobox.innerHTML = options;
			}
		}
		xhr.open("get", "json/branches.jsp?addr=" + comboboxValue);
		xhr.send();
	}
	function alertcomplete(event) {
		if(confirm('등록하시겠습니까?')){
		
		} else {
			event.preventDefault();
		}
	}
	
</script>
</html>