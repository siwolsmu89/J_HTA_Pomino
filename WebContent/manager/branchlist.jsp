<%@page import="com.domino.util.NumberUtil"%>
<%@page import="com.domino.vo.Branch"%>
<%@page import="java.util.List"%>
<%@page import="com.domino.dao.BranchDao"%>
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
					    <a class="nav-link disabled text-dark font-weight-bold pr-1" href="#" tabindex="-1" aria-disabled="true">가맹점</a>
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
								class="nav-link text-muted" href="qnaboard.jsp">1:1문의</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-dark font-weight-bold"
								href="branchlist.jsp">가맹점</a></li>
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
					<!-- 검색조건, 정렬기준, 테이블, 페이지처리 내용을 포함하는 card 시작 -->
					<!-- 검색조건, 정렬기준 입력 폼 시작 -->
					<div class="row">
						<!-- 검색조건 입력폼 시작 -->
						<div class="col-6">
							<form action="">
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<select class="form-control" name="searchoption">
											<option value="branchno">가맹점번호</option>
											<option value="branchname">가맹점명</option>
											<option value="branchaddr">지역(대분류)</option>
										</select>
									</div>
									<input id="searchValue" type="text" class="form-control"
										placeholder="검색어를 입력하세요" onkeyup="branchListData(event)">
									<div class="input-group-append">
										<button class="btn btn-outline-secondary" type="button"
										onclick="branchListData(event)">조회</button>
									</div>
								</div>
							</form>

						</div>
					</div>
					<!-- 검색조건, 정렬기준 입력 폼 끝 -->
					<%
						BranchDao branchDao = new BranchDao();
						List<Branch> branchs = branchDao.getAllBranch(beginNumber, endNumber);
						rowCount = branchDao.getBranchsCount();
					%>
					<table class="table text-center table-hover">
						<colgroup>
							<col width="10%">
							<col width="15%">
							<col width="20%">
							<col width="20%">
							<col width="20%">
							<col width="15%">
						</colgroup>
						<thead class="thead-dark">
							<tr>
								<th>번호</th>
								<th>가맹점명</th>
								<th>주소(first)</th>
								<th>주소(second)</th>
								<th>전화번호</th>
								<th colspan='2'><a class="btn-sm btn-block btn-light"
									href="branchform.jsp" onclick="alertcompleteToInsertForm(event)">가맹점 등록</a></th>
							</tr>
						</thead>
						<tbody id="branch-body">
						<%
							if(branchs.isEmpty()) {
						%>
								<tr class="font-weight-bold text-center">
									<td colspan='6'>가맹점이 존재하지 않습니다.</td>
								</tr>
						<%
							} else {
								for(Branch branch : branchs) {
						%>
								<tr data-toggle="modal" data-target="#<%=branch.getName() %>"
						<%
										if ("n".equalsIgnoreCase(branch.getQuitYn())){ 
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
									<td><%=branch.getNo() %></td>
									<td><%=branch.getName() %></td>
									<td><%=branch.getAddrFirst() %></td>
									<td><%=branch.getAddrSecond() %></td>
									<td><%=branch.getTel() %></td>
									<td>
						<%
										String yn = branch.getQuitYn();
										if("N".equals(yn)) {
						%>					
										<a type="button"  class="btn btn-success btn-block text-light"
										href="branchmodifyform.jsp?branchno=<%=branch.getNo()%>">
											영업중
										</a>
						<%
										} else {
						%>
										<a type="button"  class="btn btn-dark btn-block text-light"
										href="branchmodifyform.jsp?branchno=<%=branch.getNo()%>">
											영업종료
										</a>
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
		function branchListData(event) {
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
					var branchs = JSON.parse(text);
					
					
					
					var rows = "";
					
					for(var i=0; i<branchs.length; i++) {
						var branch = branchs[i];
						
						
						
						rows += "";
						
						if('N' == branch.quitYn){
							rows += "<tr data-toggle='modal' data-target='#"+branch.name+"' class='font-weight-bold'>";
						} else {
							rows += "<tr data-toggle='modal' data-target='#"+branch.name+"' class='text-muted'>";
						}
						rows += "<td>"+branch.no+"</td>";
						rows += "<td>"+branch.name+"</td>";
						rows += "<td>"+branch.addrFirst+"</td>";
						rows += "<td>"+branch.addrSecond+"</td>";
						rows += "<td>"+branch.tel+"</td>";
						
						if('N' == branch.quitYn){
							rows += "<td><a type='button'  class='btn btn-success text-light' href='branchmodifyform.jsp?branchno="+branch.no+"'>영업중</a></td>";
						} else {
							rows += "<td><a type='button'  class='btn btn-dark text-light text-light' href='branchmodifyform.jsp?branchno="+branch.no+"'>영업종료</a></td>";
						}
						
						rows += "</tr>";
						
						
						
					}					
					// 브라우저 출력
					document.getElementById("branch-body").innerHTML = rows;
				}
			}
			xhr.open("GET", "/domino/manager/JSON/branchlistdata.jsp?searchOpt="+searchOption+"&&searchValue="+searchValue+"&&beginNumber="+beginNumber+"&&endNumber="+endNumber);

			xhr.send();
		}
		
		function alertcompleteToInsertForm(event) {
			if(confirm('신규 가맹점을 등록하시겠습니까?')){
				
			} else {
				event.preventDefault();			
			}
		}
	</script>
</body>
</html>




















