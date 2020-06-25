<%@page import="com.domino.util.NumberUtil"%>
<%@page import="com.domino.dto.QuestionDto"%>
<%@page import="com.domino.vo.Question"%>
<%@page import="java.util.List"%>
<%@page import="com.domino.dao.QnaDao"%>
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
			<%
				//<!-- 페이지네이션  -->
				// 1. 한 화면에 표시할 행의 갯수
				int rowsPerPage = 10;

				// 2. 클라이언트가 요청한 페이지 번호 조회하기
				int pageNo = NumberUtil.stringToInt(request.getParameter("page"), 1);

				// 3. 조회할 목록의 시작번호와 끝번호를 조회한다.
				int beginNumber = (pageNo - 1) * rowsPerPage + 1;
				int endNumber = pageNo * rowsPerPage;

				int rowCount = 0;
				//<!-- 페이지네이션  -->
			%>
			<div class="row">
				<div class="col-12">
					<div class="row">
						<div class="col-6">
							<form>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<select class="form-control" name="searchoption">
											<option value="qnano">문의번호</option>
											<option value="qnawriter">문의작성자</option>
											<option value="qnatitle">문의제목</option>
										</select>
									</div>
									<input id="searchValue" type="text" class="form-control"
										placeholder="검색어를 입력하세요" onkeyup="qnaListData(event)">
									<div class="input-group-append">
										<button class="btn btn-outline-secondary" type="button"
											onclick="qnaListData(event)">조회</button>
									</div>
								</div>
							</form>
						</div>
					</div>

					<%
						QnaDao qnaDao = new QnaDao();
						List<QuestionDto> questions = qnaDao.getAllQuestion(beginNumber, endNumber);
						rowCount = qnaDao.getQnasCount();
					%>
					<table class="table text-center table-hover">
						<colgroup>
							<col width="10%">
							<col width="20%">
							<col width="20%">
							<col width="*%">
							<col width="15%">
						</colgroup>
						<thead class="thead thead-dark">
							<tr>
								<th>번호</th>
								<th>작성자</th>
								<th>제목</th>
								<th>등록일</th>
								<th>처리상태</th>
							</tr>
						</thead>
						<tbody id="qna-body">
							<%
								int fromMainNo = NumberUtil.stringToInt(request.getParameter("qnano"));
								if(questions.isEmpty()){
							%>
									<tr class="font-weight-bold text-center">
										<td colspan='5'>1:1문의가 존재하지 않습니다.</td>
									</tr>
							<%
								} else {
									for (QuestionDto questionDto : questions) {
							%>
								<tr data-toggle="modal" data-target="#a<%=questionDto.getNo()%>"
							<%
										if ("n".equalsIgnoreCase(questionDto.getAnsweredYn())){ 
							%>
									class="font-weight-bold" <%
										} else {
							%>
									class="text-muted" <%
										}
							%>
							<%
										if(questionDto.getNo() == fromMainNo) {
							%>
									style="border: 2px solid red;" <%
										}
							%>>
									<td><%=questionDto.getNo()%></td>
									<td><%=questionDto.getUserName()%></td>
									<td><%=questionDto.getTitle()%></td>
									<td><%=questionDto.getRegDate()%></td>
									<td>
							<%
											if ("N".equals(questionDto.getAnsweredYn())) {
							%>
											<a type="button" class="btn btn-primary btn-block text-light" href="qnamodifyform.jsp?questionno=<%=questionDto.getNo()%>">답변대기</a>
							<%
										 	} else {
							%>
											<a type="button" class="btn btn-secondary btn-block text-light">답변완료</a> 	
							<%
											}
							%>
									</td>
								</tr>
							<%
									}
								}
							%>
						</tbody>
					</table>



					<!-- 페이지 처리 시작 -->
					<ul class="pagination justify-content-center"
						style="margin: 20px 0">
						<%
							// 0. 한 화면당 표시할 페이지번호 갯수
							int pagesPerBlock = 5;

							// 1. 전체 행의 갯수를 조회한다.
							int rows = rowCount;

							// 2. 전체 페이지수를 계산한다.
							int totalPages = (int) Math.ceil((double) rows / rowsPerPage);

							// 3. 전체 페이지블록 갯수 계산하기
							int totalBlocks = (int) Math.ceil((double) totalPages / pagesPerBlock);

							// 4. 요청한 페이지가 어느 페이지 블록에 속하는지 계산하기
							int currentBlock = (int) Math.ceil((double) pageNo / pagesPerBlock);

							// 5. 요청한 페에지가 속한 블록의 시작페이지번호와 끝페이지번호 계산하기
							int beginPageNo = (currentBlock - 1) * pagesPerBlock + 1;
							int endPageNo = currentBlock * pagesPerBlock;
							if(pageNo > 1) {
					%>
						<li class="page-item "><a class="page-link" href="orderlist.jsp?page=<%=pageNo - 1%>">이전</a></li>
					<%
						}
						for(int num=beginPageNo; num <=endPageNo; num++) {
							if (endPageNo > totalPages) {
								endPageNo = totalPages;
							}
					%>
						<li class="page-item <%=pageNo == num ? "active" : ""%> "><a class="page-link" href="orderlist.jsp?page=<%=num%>"><%=num%></a></li>
					<%
						}
						if(pageNo < totalPages) {
					%>
						<li class="page-item"><a class="page-link" href="orderlist.jsp?page=<%=pageNo + 1%>">다음</a></li>
					<%
						}
					%>
					</ul>
					<!-- 페이지 처리 끝 -->

				</div>
			</div>
		</div>
		<div class="mb-3"></div>
	</div>
	<%@ include file="../common/footer.jsp"%>
	<script type="text/javascript">
		function qnaListData(event) {
			var beginNumber = "<%=beginNumber%>";
			var endNumber = "<%=endNumber%>";
			// 검색 옵션
			var searchOption = document
					.querySelector("select[name=searchoption]").value;
			// 검색 값
			var searchValue = document.querySelector("#searchValue").value;
			var xhr = new XMLHttpRequest();

			xhr.onreadystatechange = function() {

				if (xhr.readyState == 4 && xhr.status == 200) {
					var text = xhr.responseText;
					var questions = JSON.parse(text);
					
					
					
					var rows = "";
					
					for(var i=0; i<questions.length; i++) {
						var question = questions[i];
						
						
						rows += "";
						if('N' == question.answeredYn){
							rows += "<tr data-toggle='modal' data-target='#a"+question.no+"' class='font-weight-bold'>";
						} else {
							rows += "<tr data-toggle='modal' data-target='#a"+question.no+"' class='text-muted'>";
						}				
						rows += "<td>"+question.no+"</td>";
						rows += "<td>"+question.userName+"</td>";
						rows += "<td>"+question.title+"</td>";
						rows += "<td>"+question.regDate+"</td>";
						
						if('N' == question.answeredYn){
							rows += "<td><a type='button' class='btn btn-primary text-light' href='qnamodifyform.jsp?questionno="+question.no+"''>답변대기</a></td>";
						} else {
							rows += "<td><a type='button' class='btn btn-secondary text-light'>딥뱐완료</a></td>";
						}
						rows += "</tr>";
					}					
					// 브라우저 출력
					document.getElementById("qna-body").innerHTML = rows;
				}
			}
			xhr.open("GET", "/domino/manager/JSON/qnalistdata.jsp?searchOpt="+searchOption+"&&searchValue="+searchValue+"&&beginNumber="+beginNumber+"&&endNumber="+endNumber);

			xhr.send();
		}
		
		
	</script>
</body>
</html>