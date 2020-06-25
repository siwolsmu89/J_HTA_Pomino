<%@page import="com.domino.dao.QnaDao"%>
<%@page import="com.domino.dto.QuestionDto"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		String position = "manager";
	%>
	<%@ include file="../common/navbar.jsp"%>
	<div class="container">
		<div class="header">
			<div class="row">
				<div class="col-4">
					<!-- 페이지명 바꿔서 사용하기 -->
					<h4>관리자</h4>
				</div>

				<div class="col-8">
					<ul class="nav justify-content-end small text-muted">
					  <li class="nav-item">
					    <a class="nav-link text-muted active pr-1" href="/domino/common/home.jsp">홈</a>	<!--text-muted pr-1  -->
					  </li>
					  <li class="nav-item">
					    <a class="nav-link disabled pr-1" href="#" tabindex="-1" aria-disabled="true">></a><!-- pr-1  -->
					  </li>
					  <li class="nav-item">
					    <a class="nav-link text-muted active pr-1" href="/domino/manager/info.jsp">관리자</a><!--text-muted active pr-1  -->
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
			<div class="row ">
				<div class="col-12">
					<div class="navbar navbar-expand-sm ">
						<ul class="navbar-nav">
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-muted " href="info.jsp">메인</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-muted " href="orderlist.jsp">주문</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-muted" href="menulist.jsp">메뉴</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-muted" href="eventlist.jsp">이벤트</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-dark font-weight-bold" href="qnaboard.jsp">1:1문의</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-muted" href="branchlist.jsp">가맹점</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="body">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<strong>답변하기</strong>
						</div>
						<div class="card-body">
							<%
								int questionNo = NumberUtil.stringToInt(request.getParameter("questionno"));
								QnaDao qnaDao = new QnaDao();
								QuestionDto questionDto = qnaDao.getQuestionByNo(questionNo);
							%>
							<form method="post"
								action="/domino/manager/answer.jsp?questionno=<%=questionDto.getNo()%>">
								<div class="form-group">
									<label>이름</label> <input type="text" class="form-control"
										value="<%=questionDto.getUserName()%>" disabled />
								</div>
								<div class="form-group">
									<label>아이디</label> <input type="text" class="form-control"
										value="<%=questionDto.getUserId()%>" disabled />
								</div>


								<div class="form-group">
									<label>이메일</label> <input type="text" class="form-control"
										value="<%=questionDto.getUserEmail()%>" disabled />
								</div>
								<div class="form-group">
									<label>등록날짜</label> <input type="text" class="form-control"
										value="<%=questionDto.getRegDate()%>" name="addrdetail"
										disabled />
								</div>


								<div class="form-group">
									<label>제목</label> <input type="text" class="form-control"
										value="<%=questionDto.getTitle()%> " disabled name="tel" />
								</div>


								<div class="form-group">
									<label>문의내용</label>
									<textarea class="form-control" disabled name="tel"><%=questionDto.getContent()%></textarea>
								</div>



								<div class="form-group">
									<label for="desc-1">답변작성</label>
									<textarea class="form-control" name="answercontent" id="desc-1" cols="10" rows="20"></textarea>
								</div>


								<div class="row">
									<div class="col-6 text-right">
										<button type="button" class="btn btn-secondary btn-block" onclick="location.reload()">다시 작성</button>
									</div>
									<div class="col-6 text-right">
										<button type="submit" class="btn btn-primary btn-block">답변등록</button>
									</div>
								</div>
								<div class="">
									
									
								</div>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="mb-2"></div>
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>