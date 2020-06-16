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
								class="nav-link text-muted" href="orderlist.jsp">주문</a></li>
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
			<div class="row">

				<div class="col-12">
					<!-- 검색조건, 정렬기준, 테이블, 페이지처리 내용을 포함하는 card 시작 -->

					<!-- 검색조건, 정렬기준 입력 폼 시작 -->
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
								<th>활성화여부</th>
								<th>할인율</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>129</td>
								<td>피맥타임</td>
								<td>2020-06-01</td>
								<td>2020-09-30</td>
								<td>Y</td>
								<td>15%</td>
								<td>
									<button class="btn btn-primary">수정</button>
								</td>
								<td>
									<button class="btn btn-danger">비활성</button>
								</td>
							</tr>
							<tr>
								<td>50</td>
								<td>도미노10주년</td>
								<td>2019-01-01</td>
								<td>2019-12-31</td>
								<td>N</td>
								<td>20%</td>
								<td>
									<button class="btn btn-primary">수정</button>
								</td>
								<td>
									<button class="btn btn-success">활성</button>
								</td>
							</tr>
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