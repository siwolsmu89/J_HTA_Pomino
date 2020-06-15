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
						<li class="nav-item"><a class="nav-link disabled" href="#">주문</a></li>
					</ul>
				</div>
		</div>
		
	</div>
	<div class="row">
		<div class="col-12">
				<ul class="nav nav-tabs justify-content-around">
					<li class="nav-item"><a class="nav-link" href="#">메인</a></li>
					<li class="nav-item"><a class="nav-link active" href="#">주문</a></li>
					<li class="nav-item"><a class="nav-link" href="#">메뉴</a></li>
					<li class="nav-item"><a class="nav-link" href="#">이벤트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">1:1문의</a></li>
					<li class="nav-item"><a class="nav-link" href="#">가맹점</a></li>
				</ul>
			</div>
	</div>
	<div class="row">
		
			<div class="col-12">
				<!-- 검색조건, 정렬기준, 테이블, 페이지처리 내용을 포함하는 card 시작 -->
				<div class="card">
					<div class="card-body">
						<!-- 검색조건, 정렬기준 입력 폼 시작 -->
						<form>
							<div class="row">
								<!-- 검색조건 입력폼 시작 -->
								<div class="col-6">
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<select class="form-control" name="searchOption">
			    								<option value="title"> 주문번호 </option>
											    <option value="writer"> 매장이름 </option>
											    <option value="content"> 메뉴 </option>
			  								</select>
			  							</div>
		    							<input type="text" class="form-control" placeholder="검색어를 입력하세요">
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
		    								<option value="title"> 전체보기 </option>
										    <option value="writer"> 완료된 주문 </option>
										    <option value="content"> 진행중인 주문 </option>
		  								</select>
	  								</div>
								</div>
								<!-- 정렬기준 선택 끝  -->
							</div>
						</form>
						<!-- 검색조건, 정렬기준 입력 폼 끝 -->
						<table class="table text-center">
							<colgroup>
								<col width="15%">
								<col width="15%">
								<col width="25%">
								<col width="15%">
								<col width="15%">
								<col width="15%">
							</colgroup>
							<thead class="thead-dark">
								<tr>
									<th>주문번호</th>
									<th>매장이름</th>
									<th>주문한메뉴</th>
									<th>총금액</th>
									<th>배달요청시간</th>
									<th>주문상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>129</td>
									<td>종로3가점</td>
									<td>시푸드피자</td>
									<td>56,000원</td>
									<td>21:50</td>
									<td>
										<button class="btn btn-success">배달중</button>
									</td>
								</tr>
								<tr>
									<td>129</td>
									<td>종로3가점</td>
									<td>시푸드피자</td>
									<td>56,000원</td>
									<td>21:50</td>
									<td>
										<button class="btn btn-secondary">배달완료</button>
									</td>
								</tr>	
								<tr>
									<td>129</td>
									<td>종로3가점</td>
									<td>시푸드피자</td>
									<td>56,000원</td>
									<td>21:50</td>
									<td>
										<button class="btn btn-primary">조리중</button>
									</td>
								</tr>									
							</tbody>
						</table>
						<!-- 페이지 처리 시작 -->
						<ul class="pagination justify-content-center" style="margin:20px 0">
	  						<li class="page-item"><a class="page-link" href="#">이전</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item active"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#">다음</a></li>
						</ul>
						<!-- 페이지 처리 끝 -->
					</div>
				</div>
				<!-- 검색조건, 정렬기준, 테이블, 페이지처리 내용을 포함하는 card 끝 -->
			</div>
		
	</div>

</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>