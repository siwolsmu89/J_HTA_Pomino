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
						<li class="nav-item"><a class="nav-link disabled" href="#">메인</a></li>
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
								class="nav-link text-dark font-weight-bold" href="info.jsp">메인</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-muted" href="orderlist.jsp">주문</a></li>
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
								class="nav-link text-muted" href="branchlist.jsp">가맹점</a></li>
						</ul>
					</div>
				</div>
			</div>

		</div>
		
		<div class="body">
			<div class="row">
			<div class="col-12">
				<div class="jumbotron bg-dark text-white ">
					<div class="row text-center">
						<div class="col-4">
							<p>
								<a class="" href="#">오늘 주문현황</a>
							</p>
							<p class="display-4 text-center font-weight-bold">160건</p>
						</div>
						<div class="col-4"
							style="border-left: 1px solid white; border-right: 1px solid white;">
							<p>
								<a class="" href="#">현재 주문현황</a>
							</p>
							<p class="display-4 text-center font-weight-bold">30건</p>
						</div>
						<div class="col-4">
							<p>
								<a class="" href="#">오늘 총 매출</a>
							</p>
							<p class="display-4 text-center font-weight-bold">9,745,000원</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-12 ">
				<div class="row justify-content-center">

					<div id="myCarousel" class="carousel slide" data-ride="carousel">

						<!-- Indicators -->
						<ul class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
						</ul>


						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="https://unsplash.com/photos/jFCViYFYcus" alt="이벤트1"
									width="1100px" height="400px">
							</div>
							<div class="carousel-item">
								<img src="https://unsplash.com/photos/jFCViYFYcus" alt="이벤트2">
							</div>
							<div class="carousel-item">
								<img src="https://unsplash.com/photos/jFCViYFYcus" alt="이벤트3">
							</div>
						</div>

						<!-- Left and right controls -->
						<a class="carousel-control-prev" href="#myCarousel"
							data-slide="prev"> <span class="carousel-control-prev-icon"></span>
						</a> <a class="carousel-control-next" href="#myCarousel"
							data-slide="next"> <span class="carousel-control-next-icon"></span>
						</a>
					</div>
				</div>



			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<table class="table text-center">
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
							<th>카테고리</th>
							<th>작성자</th>
							<th>문의제목</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>108</td>
							<td>서비스</td>
							<td>홍길동</td>
							<td>xxx매장 직원 불친절 신고</td>
							<td>
								<button class="btn btn-primary">답변대기</button>
							</td>
						</tr>
						<tr>
							<td>1021</td>
							<td>품질</td>
							<td>강감찬</td>
							<td>피자맛 관련해서 xx매장 문의드렸는데 ...</td>
							<td>
								<button class="btn btn-primary">답변대기</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		</div>
		
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>