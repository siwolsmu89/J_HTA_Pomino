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
						<li class="nav-item"><a class="nav-link disabled" href="#">메뉴</a></li>
					</ul>
				</div>
		</div>
		<div class="row ">
			<div class="col-12">
				<ul class="nav nav-tabs justify-content-around">
					<li class="nav-item"><a class="nav-link " href="#">메인</a></li>
					<li class="nav-item"><a class="nav-link" href="#">주문</a></li>
					<li class="nav-item"><a class="nav-link active" href="#">메뉴</a></li>
					<li class="nav-item"><a class="nav-link" href="#">이벤트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">1:1문의</a></li>
					<li class="nav-item"><a class="nav-link" href="#">가맹점</a></li>
				</ul>
			</div>
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
									<div class="dropdown">
									  <button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown">
									  	- 메뉴 선택 -
									  </button>
									  <div class="dropdown-menu">
									    <a class="dropdown-item" href="#">피자메뉴</a>
									    <a class="dropdown-item" href="#">사이드메뉴</a>
									    <a class="dropdown-item" href="#">도우메뉴</a>
									    <a class="dropdown-item" href="#">토핑메뉴</a>
									    <a class="dropdown-item" href="#">기타메뉴</a>
									  </div>
									</div>
									 
								</div>
								<!-- 정렬기준 선택 끝  -->
							</div>
						</form>
						<!-- 피자 메뉴 -->
						<table id="pizza-menu" class="table text-center">
							<colgroup>
								<col width="10%">
								<col width="10%">
								<col width="20%">
								<col width="10%">
								<col width="10%">
								<col width="15%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							<thead class="thead-dark">
								<tr>
									<th>번호</th>
									<th>이름</th>
									<th>L가격</th>
									<th>M가격</th>
									<th>단종여부</th>
									<th>이벤트</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>불고기피자</td>
									<td>23000원</td>
									<td>18000원</td>
									<td>N</td>
									<td>여름방학시즌</td>
									<td>
										<button class="btn btn-primary">수정</button>
									</td>
									<td>
										<button class="btn btn-danger">비활성</button>
									</td>
								</tr>
								<tr>
									<td>2</td>
									<td>고구마</td>
									<td>24000원</td>
									<td>18500원</td>
									<td>N</td>
									<td>어버이날</td>
									<td>
										<button class="btn btn-primary">수정</button>
									</td>
									<td>
										<button class="btn btn-danger">비활성</button>
									</td>
								</tr>
								<tr>
									<td>3</td>
									<td>포티이토피자</td>
									<td>22000원</td>
									<td>17500원</td>
									<td>N</td>
									<td>-</td>
									<td>
										<button class="btn btn-primary">수정</button>
									</td>
									<td>
										<button class="btn btn-danger">비활성</button>
									</td>
								</tr>
								<tr>
									<td>4</td>
									<td>페퍼로니피자</td>
									<td>20000원</td>
									<td>1300원</td>
									<td>Y</td>
									<td>-</td>
									<td>
										<button class="btn btn-secondary">수정</button>
									</td>
									<td>
										<button class="btn btn-secondary">비활성</button>
									</td>
								</tr>									
							</tbody>
						</table>
						
						<!-- 사이드 메뉴 -->
						<table id="side-menu" class="table text-center">
							<colgroup>
								<col width="20%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							<thead class="thead-dark">
								<tr>
									<th>번호</th>
									<th>이름</th>
									<th>가격</th>
									<th>단종여부</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>크리스피 핫 순살 치킨(8조각)</td>
									<td>4,800원</td>
									<td>N</td>
									<td>
										<button class="btn btn-primary">수정</button>
									</td>
									<td>
										<button class="btn btn-danger">비활성</button>
									</td>
								</tr>									
							</tbody>
						</table>
						
						<!-- 도우 메뉴 -->
						<table id="doughs-menu" class="table text-center">
							<colgroup>
								<col width="20%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							<thead class="thead-dark">
								<tr>
									<th>번호</th>
									<th>이름</th>
									<th>가격</th>
									<th>단종여부</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>슈퍼시드 함유 도우</td>
									<td>2,000원</td>
									<td>N</td>
									<td>
										<button class="btn btn-primary">수정</button>
									</td>
									<td>
										<button class="btn btn-danger">비활성</button>
									</td>
								</tr>
								<tr>
									<td>2</td>
									<td>오리지널 도우</td>
									<td>0원</td>
									<td>N</td>
									<td>
										<button class="btn btn-primary">수정</button>
									</td>
									<td>
										<button class="btn btn-danger">비활성</button>
									</td>
								</tr>																	
							</tbody>
						</table>
						
						<!-- 토핑 메뉴 -->
						<table id="topping-menu" class="table text-center">
							<colgroup>
								<col width="10%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							<thead class="thead-dark">
								<tr>
									<th>번호</th>
									<th>이름</th>
									<th>카테고리</th>
									<th>가격</th>
									<th>단종여부</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>오리엔탈 통새우</td>
									<td>메인</td>
									<td>3,500원</td>
									<td>N</td>
									<td>
										<button class="btn btn-primary">수정</button>
									</td>
									<td>
										<button class="btn btn-danger">비활성</button>
									</td>
								</tr>																
							</tbody>
						</table>
						
						<!-- 기타 메뉴 -->
						<table id="etc-menu" class="table text-center">
							<colgroup>
								<col width="20%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							<thead class="thead-dark">
								<tr>
									<th>번호</th>
									<th>이름</th>
									<th>가격</th>
									<th>단종여부</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>코카콜라1.25L</td>
									<td>2,000원</td>
									<td>N</td>
									<td>
										<button class="btn btn-primary">수정</button>
									</td>
									<td>
										<button class="btn btn-danger">비활성</button>
									</td>
								</tr>
																								
							</tbody>
						</table>
						<!-- 페이지 처리 시작 -->
						<ul class="pagination justify-content-center" style="margin:20px 0">
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
				<!-- 검색조건, 정렬기준, 테이블, 페이지처리 내용을 포함하는 card 끝 -->
			</div>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>