<%@page import="com.domino.vo.Event"%>
<%@page import="java.util.List"%>
<%@page import="com.domino.dao.EventDao"%>
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
					<ul class="nav justify-content-end">
						<li class="nav-item"><a class="nav-link active" href="#">홈</a></li>
						<li class="nav-item"><a class="nav-link disabled" href="#"
							tabindex="-1" aria-disabled="true">></a></li>
						<li class="nav-item"><a class="nav-link active" href="#">관리자</a></li>
						<li class="nav-item"><a class="nav-link disabled" href="#"
							tabindex="-1" aria-disabled="true">></a></li>
						<li class="nav-item"><a class="nav-link disabled" href="#">이벤트</a></li>
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
								class="nav-link text-dark font-weight-bold" href="eventlist.jsp">이벤트</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-muted" href="qnaboard.jsp">1:1문의</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-muted" href="branchlist.jsp">가맹점</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<div class="body">
			<%
				EventDao eventDao = new EventDao();
				List<Event> events = eventDao.getAllEvent();
			%>
			<div class="row">

				<div class="col-12">
					<form>
						<div class="row">
							<!-- 검색조건 입력폼 시작 -->
							<div class="col-6">
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<select class="form-control" name="searchOption">
											<option value="title">이벤트번호</option>
											<option value="writer">이벤트이름</option>
										</select>
									</div>
									<input type="text" class="form-control"
										placeholder="검색어를 입력하세요">
									<div class="input-group-append">
										<button class="btn btn-outline-secondary" type="button">조회</button>
									</div>
								</div>
							</div>
							<!-- 검색조건 입력폼 끝 -->
							<!-- 정렬기준 선택 시작  -->
							<div class="col-2 offset-4">
								<div class="input-group mb-3">
									<select class="form-control" name="sort">
										<option value="title">전체보기</option>
										<option value="writer">완료된 이벤트</option>
										<option value="content">진행중인 이벤트</option>
									</select>
								</div>
							</div>
							<!-- 정렬기준 선택 끝  -->
						</div>
					</form>
					<!-- 검색조건, 정렬기준 입력 폼 끝 -->
					<table class="table text-center">
						<colgroup>
							<col width="10%">
							<col width="20%">
							<col width="15%">
							<col width="15%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead class="thead-dark">
							<tr>
								<th>이벤트번호</th>
								<th>이벤트이름</th>
								<th>시작일</th>
								<th>종료일</th>
								<th>단종여부</th>
								<th>할인율</th>
								<th colspan='2'><a class="btn btn-light"
									href="eventform.jsp">신규 이벤트 등록</a></th>
							</tr>
						</thead>
						<tbody>
						<%
							for(Event event : events) {
						%>
							<tr
								<%
									if ("n".equalsIgnoreCase(event.getDisableYn())){ 
								%>
									class="font-weight-bold"
								<%
									} else {
								%>
									class="text-muted"
								<%
									}
								%>
							>
								<td><%=event.getNo() %></td>
								<td><%=event.getName() %></td>
								<td><%=event.getStartDate() %></td>
								<td><%=event.getEndDate() %></td>
								<td><%=("N".equals(event.getDisableYn())) ? "아니오" : "예" %></td>
								<td><%=(0 == event.getDiscountRate()*100) ? 0 : event.getDiscountRate()*100+"%" %></td>
								<td><a class="btn btn-primary text-light"
									href="eventmodifyform.jsp?yn=n&eventno=<%=event.getNo() %>">수정</a></td>
								<%
									if("N".equalsIgnoreCase(event.getDisableYn())){
								%>
								<td>
									<form method="post" action="eventmodify.jsp" enctype="multipart/form-data">
										<input type="hidden" name="yn" value="y">
										<input type="hidden" name="eventno" value=<%=event.getNo() %>>
										<button class="btn btn-secondary text-light" type="submit">
											비활성
										</button>
									</form>
								</td>
								<%
									} else {
								%>
								<td>
									<form method="post" action="eventmodify.jsp" enctype="multipart/form-data">
										<input type="hidden" name="yn" value="yn">
										<input type="hidden" name="eventno" value=<%=event.getNo() %>>
										<button class="btn btn-danger text-light" type="submit">
											활성
										</button>
									</form>
								</td>
								<%
									}
								%>
							</tr>
						<%
							}
						%>
						</tbody>
					</table>
					<!-- 페이지 처리 시작 -->
					<ul class="pagination justify-content-center"
						style="margin: 20px 0">
						<li class="page-item"><a class="page-link" href="#">이전</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item active"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#">다음</a></li>
					</ul>
					<!-- 페이지 처리 끝 -->
					<!-- 검색조건, 정렬기준, 테이블, 페이지처리 내용을 포함하는 card 끝 -->
				</div>

			</div>
		</div>


	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>