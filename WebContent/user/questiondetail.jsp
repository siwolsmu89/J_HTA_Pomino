<%@page import="com.domino.util.NumberUtil"%>
<%@page import="com.domino.dto.QuestionDto"%>
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
			int questionNo = NumberUtil.stringToInt(request.getParameter("questionno"));
			int pageNo = NumberUtil.stringToInt(request.getParameter("page"), 1);
			
			UserDao userDao = new UserDao();
			User user = userDao.getUserByNo(loginUserNo);
			UserDto userDto = userDao.getCountQuestionUserByNo(loginUserNo);
			QnaDao qnaDao = new QnaDao();
			QuestionDto qnaDto = qnaDao.getQuestionDetailUserQnaByNo(loginUserNo, questionNo);
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
			<div class="col-12">
				
				<div class="row">
					<div class="col-12">
						<table class="table">
							<!-- 테이블만들기 -->
							<tbody>
								
								<tr>
									<th style="width: 30%">아이디</th>
									<td class="text-left"><%=user.getId() %></td>
								</tr>
								<tr>
									<th style="width: 30%">연락처</th>
									<td class="text-left"><%=user.getTel() %></td>
								</tr>
								<tr>
									<th style="width: 30%">이메일</th>
									<td class="text-left"><%=user.getEmail() %></td>
								</tr>
								<tr>
									<th style="width: 30%">문의유형</th>
									<td class="text-left"><%=qnaDto.getType() %></td>
								</tr>
								<tr>
									<th style="width: 30%">매장검색</th>
									<td class="text-left"><%=qnaDto.getBranchAddrFirst() %> : <%=qnaDto.getBranchName() %></td>
								</tr>
								<tr>
									<th style="width: 30%">제목</th>
									<td class="text-left"><%=qnaDto.getTitle() %></td>
								</tr>
								<tr>
									<th style="width: 30%">문의내용</th>
									<td class="text-left">
										<textarea class="form-control bg-light" rows="5" name="questioncontent" disabled><%=qnaDto.getContent()%></textarea>
									</td>
								</tr>
								<tr>
									<th style="width: 30%">답변</th>
									<td class="text-left">
										<textarea class="form-control bg-light" rows="5" name="answercontent" disabled><%=qnaDto.getAnswerContent() == null ? "" : qnaDto.getAnswerContent() %></textarea>
									</td>
								</tr>
							</tbody>
						</table>
						<div style="background-color: black; height: 2px;" class="mb-2"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<p class="py-3 text-muted mb-0" style="font-size: 10px;">등록하신 내용 및 답변은 회원정보상의 이메일로도 발송이 됩니다. 상담원과 통화를 원하시면 아래 번호로 전화주시기 바랍니다.</p>
						<p class="mt-0 font-weight-bold" style="font-size: 20px;">고객만족 센터 <span style="color: #00B9FF" >080-111-5555</span></p>
					</div>
				</div>
				<div class="row">
					<div class="col-12 text-center">
						<a href="/domino/user/questiondelete.jsp?questionno=<%=questionNo %>&page=<%=pageNo %>" class="btn btn-secondary btn-lg" onclick="alertcomplete(event)">&nbsp&nbsp삭  제&nbsp&nbsp</a>
						<a href="/domino/user/questionform.jsp?page=<%=pageNo %>" class="btn btn-primary btn-lg">&nbsp&nbsp목  록&nbsp&nbsp</a>
					</div>
				</div>
				
			</div>
		</div>
		
	</div>
	<div class="mb-3"></div>
</div>
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
function alertcomplete(event) {
	if(confirm('삭제하시겠습니까?')){
	
	} else {
		event.preventDefault();
	}
}
</script>
</body>
</html>