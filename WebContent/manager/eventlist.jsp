<%@page import="com.domino.util.NumberUtil"%>
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
					    <a class="nav-link disabled text-dark font-weight-bold pr-1" href="#" tabindex="-1" aria-disabled="true">이벤트</a>
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

				EventDao eventDao = new EventDao();
				List<Event> events = eventDao.getAllEvent(beginNumber, endNumber);
				rowCount = eventDao.getEventsCount();
			%>
			<div class="row">

				<div class="col-12">

					<div class="row">

						<div class="col-6">
							<form action="">
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<select class="form-control" name="searchoption">
											<option value="eventno">이벤트번호</option>
											<option value="eventname">이벤트명</option>
										</select>
									</div>
									<input id="searchValue" type="text" class="form-control"
										placeholder="검색어를 입력하세요" onkeyup="eventListData()">
									<div class="input-group-append">
										<button class="btn btn-outline-secondary" type="button"
											onclick="eventListData()">조회</button>
									</div>
								</div>
							</form>

						</div>
						
					</div>

					
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
								<th colspan='2'><a class="btn-sm btn-block btn-light" href="eventform.jsp"
									onclick="alertcompleteToInsertForm(event)">신규 이벤트 등록</a></th>
							</tr>
						</thead>
						<tbody id="event-body">
							<%
								if(events.isEmpty()) {
							%>
									<tr class="font-weight-bold text-center">
										<td colspan='8'>이벤트가 존재하지 않습니다.</td>
									</tr>
							<%
								} else {
									for (Event event : events) {
							%>
								<tr
							<%
										if ("n".equalsIgnoreCase(event.getDisableYn())) {
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
									<td><%=event.getNo()%></td>
									<td><%=event.getName()%></td>
									<td><%=event.getStartDate()%></td>
									<td><%=event.getEndDate()%></td>
									<td><%=("N".equals(event.getDisableYn())) ? "아니오" : "예"%></td>
									<td><%=(0 == event.getDiscountRate() * 100) ? 0 : event.getDiscountRate() * 100 + "%"%></td>
									<td><a class="btn btn-primary btn-block text-light"
										href="eventmodifyform.jsp?yn=n&eventno=<%=event.getNo()%> " onclick="alertcompleteToModifyForm(event)">수정</a></td>
							<%
										if ("N".equalsIgnoreCase(event.getDisableYn())) {
							%>
									<td>
										<form method="post" action="eventmodify.jsp"
											enctype="multipart/form-data">
											<input type="hidden" name="yn" value="y"> <input
												type="hidden" name="eventno" value=<%=event.getNo()%>>
											<button class="btn btn-secondary btn-block text-light" type="submit" onclick="alertcompleteToModify(event)">
												비활성</button>
										</form>
									</td>
							<%
										} else {
							%>
									<td>
										<form method="post" action="eventmodify.jsp"
											enctype="multipart/form-data">
											<input type="hidden" name="yn" value="yn"> <input
												type="hidden" name="eventno" value=<%=event.getNo()%>>
											<button class="btn btn-danger btn-block text-light" type="submit" onclick="alertcompleteToModify(event)">
												활성</button>
										</form>
									</td>
							<%
										}
							%>
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
		// 조건 - 개별검색 
		function eventListData() {
			var beginNumber = "<%=beginNumber%>";
			var endNumber = "<%=endNumber%>";
			// 검색 옵션
			var searchOption = document.querySelector("select[name=searchoption]").value;
			// 검색 값
			var searchValue = document.querySelector("#searchValue").value;
			
			var xhr = new XMLHttpRequest();

			xhr.onreadystatechange = function() {

				if (xhr.readyState == 4 && xhr.status == 200) {
					var text = xhr.responseText;
					var events = JSON.parse(text);

					
					var rows = "";
					
					for(var i=0; i<events.length; i++){
						var event = events[i];
						
						// 출력문 작성
						if('N'== event.disableYn){
							rows += "<tr class='font-weight-bold'>";
						} else {
							rows += "<tr class='text-muted'>";
						}
						rows += "<td>"+event.no+"</td>";
						rows += "<td>"+event.name+"</td>";
						rows += "<td>"+event.startDate+"</td>";
						rows += "<td>"+event.endDate+"</td>";
						if('N' == event.disableYn){
							rows += "<td>아니오</td>";
						} else {
							rows += "<td>예</td>";
						}
						if(0 == event.discountRate * 100){
							rows += "<td>0</td>";
						} else {
							rows += "<td>"+event.discountRate*100+"</td>";
						}
						rows += "<td><a class='btn btn-primary btn-block text-light' href='eventmodifyform.jsp?yn=n&eventno="+event.no+"'>수정</a></td>";										
						if('N' == event.disableYn){
							rows += "<td><form method='post' action='eventmodify.jsp' enctype='multipart/form-data'>";
							rows += "<input type='hidden' name='yn' value='y'> <input type='hidden' name='eventno' value="+event.no+">";
							rows += "<button class='btn btn-secondary btn-block text-light' type='submit'>비활성</button></form></td>";
						} else {
							rows += "<td><form method='post' action='eventmodify.jsp' enctype='multipart/form-data'>"
							rows += "<input type='hidden' name='yn' value='yn'> <input type='hidden' name='eventno' value="+event.no+">";
							rows += "<button class='btn btn-danger btn-block text-light' type='submit'>활성</button></form></td>";
						}					
						rows += "</tr>";
					}
					
					
					// 브라우저 출력
					document.getElementById("event-body").innerHTML = rows;
				}
			}

			xhr.open("GET", "/domino/manager/JSON/eventlistdata.jsp?searchOpt="
					+ searchOption + "&&searchValue=" + searchValue+"&&beginNumber="+beginNumber+"&&endNumber="+endNumber);

			xhr.send();
		}
		
		function alertcompleteToModify(event) {
			
			if(confirm('상태를 바꾸시겠습니까?')){
			
			} else {
				event.preventDefault();			
			}
		}
		
		
		function alertcompleteToModifyForm(event) {
			
			if(confirm('수정하시겠습니까?')){
			
			} else {
				event.preventDefault();			
			}
		}
		
		function alertcompleteToInsertForm(event) {
			if(confirm('신규 이벤트를 등록하시겠습니까?')){
				
			} else {
				event.preventDefault();			
			}
		}
	</script>
</body>
</html>



























