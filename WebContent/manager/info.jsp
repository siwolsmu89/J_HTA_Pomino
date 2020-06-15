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
						<li class="nav-item"><a class="nav-link active" href="#">메인</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="row ">
			<div class="col-12">
				<ul class="nav nav-tabs justify-content-around">
					<li class="nav-item"><a class="nav-link active" href="#">메인</a></li>
					<li class="nav-item"><a class="nav-link" href="#">주문</a></li>
					<li class="nav-item"><a class="nav-link" href="#">메뉴</a></li>
					<li class="nav-item"><a class="nav-link" href="#">이벤트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">1:1문의</a></li>
					<li class="nav-item"><a class="nav-link" href="#">가맹점</a></li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-4">
				<div class="card">
					<div class="card-header">오늘 주문현황</div>
					<div class="card-body">160건</div>
				</div>
			</div>
			<div class="col-4">
				<div class="card">
					<div class="card-header">현재 주문현황</div>
					<div class="card-body">30건</div>
				</div>
			</div>
			<div class="col-4">
				<div class="card">
					<div class="card-header">오늘 총 매출</div>
					<div class="card-body">9,745,000원</div>
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

						<!-- The slideshow -->
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="이벤트1" alt="이벤트1">
							</div>
							<div class="carousel-item">
								<img src="이벤트2" alt="이벤트2">
							</div>
							<div class="carousel-item">
								<img src="이벤트3" alt="이벤트3">
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
				<div class="card">
					<div class="card-body">
						<table class="table text-center">
							<colgroup>
								<col width="10%">
								<col width="20%">
								<col width="20%">
								<col width="*%">
								<col width="15%">
							</colgroup>
							<thead class="thead">
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
										<button class="btn btn-secondary">답변완료</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>