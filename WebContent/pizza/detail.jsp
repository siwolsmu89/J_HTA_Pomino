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

	<%
		String position = "detail";
	%>
	
	<%@ include file="../common/navbar.jsp"%>

<div class="container">

	<div>
		<div> <!-- 주황1 -->
			<div>
				<!-- 화면의 현재위치를 나타내는 부분 시작 -->
				<div class="row">
					<div class="col-9">
						<a class="display-4"><small>메뉴</small></a>
					</div>
			
					<div class="col-3">
						<p>　</p>
						<ul class="breadcrumb">
							<li class="breadcrumb-item"><a href="../common/home.jsp">홈</a></li>
							<li class="breadcrumb-item"><a href="#">메뉴</a></li>
							<li class="breadcrumb-item"><a <%//해당피자이름%>><strong>해당 피자</strong></a></li>
						</ul>
					</div>
				</div>
				<!-- 화면의 현재위치를 나타내는 부분 끝 -->
			</div>
			
			<div>
				<div class="row"><!-- 메뉴바 -->
					<div class="col-10"><!-- 상세메뉴 -->
						<div class="navbar navbar-expand-sm ">
							<!-- 링크들 (메뉴 중앙정렬) -->
							<ul class="navbar-nav">
								<li class="nav-item d-flex justify-content-between align-items-center"><a class="nav-link" href="../pizza/pizzamenu.jsp">피자</a></li>
								<li class="nav-item d-flex justify-content-between align-items-center"><a class="nav-link" href="">사이드디시</a></li>
								<li class="nav-item d-flex justify-content-between align-items-center"><a class="nav-link" href="">음료/기타</a></li>
							</ul>
						</div>
					</div>
					
					<div class="col-2"><!-- 더보기 -->
						<div class="navbar navbar-expand-sm ">
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="">맛있는핏자</a>	<!-- 1주일간 가장 많이 팔린 피자 받아와서 출력, 해당하는 링크로 이동 -->
							<div class="dropdown-menu">
								<a class="dropdown-item" href="">짱</a>
								<a class="dropdown-item" href="">맛있는</a>
								<a class="dropdown-item" href="">피자</a>
								<a class="dropdown-item" href="">리스트</a>
								<a class="dropdown-item" href="">피자먹고싶다</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>	<!-- 주황1 끝-->
		<div>
			<div class="row">	<!-- 노랑1 시작 -->
				<div class="col-7 img-responsive "> <!-- 초록1 시작 -->
					<div class="float-left" > <!-- 파랑1 시작 -->
						<img src="../resource/images/pizza/20200120_ZlC0dSzU.jpg" class="img-fluid"/>
						<div class="float-right">
							<a><strong>자세히</strong></a>
							<a href="#"><img src="../resource/images/home/detailsee.png"></a>
						</div>
					</div> <!-- 파랑1 끝 -->
						
					<div> <!-- 파랑2 시작 -->
						<ul>
							<li><small>모든 사진은 이미지컷으로 실제 제품과 다를 수 있습니다</small></li>
							<li><small>원산지 정보는 사진 우측하단 돋보기 메뉴를 통해 확인 가능합니다</small></li>
						</ul>
					</div> <!-- 파랑2 끝 -->
				</div> <!-- 초록1 끝 -->
				
				<div class="col-1"></div>	<!-- 여백 조금만 -->
				
				
				<div class="col-4 "> <!-- 초록2 시작 -->
					<div> <!-- 파랑1 시작 -->
						<div> <!-- 하늘1 시작 -->
							<div class="mt-3 mb-n3">
								<span class="badge badge-primary">New</span>
								<span class="badge badge-primary">온라인 배달 25% 할인</span>
								<% // 얘네도 짧은 정보로 테이블에서 받아오는건가? %>
							</div>
						</div> <!-- 하늘1 끝 -->
						
						<div> <!-- 하늘2 시작 -->
							<div class="display-4"><p><small><%// 피자 이름 받아오기 %>시리얼 칠리크랩</small></p></div>
						</div> <!-- 하늘2 끝 -->
						
						<div>	
							<div><small>#주문시 사이드디시 반값</small></div>
							<div><small>#도미노 시리얼 제공</small></div>
							<p>　</p>
							<% // 얘네도 짧은 정보로 받아오는건가? %>
						</div> <!-- 하늘3 끝 -->
						
						<div>
							<div class="text-center">
								<a href="#" class="btn btn-outline-secondary btn-lg" role="button">영양성분 및 알레르기 유발성분</a>
								<p>　</p>
							</div>
						</div> <!-- 하늘4 끝 -->
					</div> <!-- 파랑1 끝 -->
					
					<div> <!-- 파랑2 시작 -->
						<form method="post" action="#">
							<div class="form-group"> <!-- 하늘1 시작 -->
								<h4><strong>사이즈 선택</strong></h4>
								<div>
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" class="custom-control-input" name="size" id="size-L" value="라지" checked>
										<label class="custom-control-label" for="size-L">L<% //해당 피자 가격 %></label>
									</div>
									
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" class="custom-control-input" name="size" id="size-M" value="미디움">
										<label class="custom-control-label" for="size-M">M<% //해당 피자 가격 %></label>
									</div>									
								</div>
							</div> <!-- 하늘1 끝 -->
							
							<div class="form-group"> <!-- 하늘2 시작 -->
								<h4><strong>도우 선택</strong></h4>
								<div>
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" class="custom-control-input" name="dou" id="dou1" value="도우1" checked>
										<label class="custom-control-label text-justify" for="dou1">이건 나중에 지우고 +5000원<% // 도우 테이블 가져오기%></label>
									</div>
									
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" class="custom-control-input" name="dou" id="dou2" value="도우2">
										<label class="custom-control-label" for="dou2">이건 나중에 지우고<% // 도우 테이블 가져오기%></label>
									</div>

									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" class="custom-control-input" name="dou" id="dou3" value="도우3">
										<label class="custom-control-label" for="dou3">이건 나중에 지우고<% // 도우 테이블 가져오기%></label>
									</div>
									
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" class="custom-control-input" name="dou" id="dou4" value="도우4">
										<label class="custom-control-label" for="dou4">이건 나중에 지우고<% // 도우 테이블 가져오기%></label>
									</div>
									
									<div class="custom-control custom-radio custom-control-inline">
										<input type="radio" class="custom-control-input" name="dou" id="dou5" value="도우5">
										<label class="custom-control-label" for="dou5">이건 나중에 지우고<% // 도우 테이블 가져오기%></label>
									</div>
								</div>
							</div> <!-- 하늘2 끝 -->
							
							<div></div> <!-- 하늘3 끝 -->
							<div></div> <!-- 하늘4 끝 -->
							<div></div> <!-- 하늘5 끝 -->
							<div></div> <!-- 하늘6 끝 -->
							<div></div> <!-- 하늘7 끝 -->
							<div></div> <!-- 하늘8 끝 -->
							<div></div> <!-- 하늘9 끝 -->
							<div></div> <!-- 하늘10 끝 -->
							<div></div> <!-- 하늘11 끝 -->
							<div></div> <!-- 하늘12 끝 -->
							<div></div> <!-- 하늘13 끝 -->
						</form>
					</div> <!-- 파랑2 끝 -->
				</div> <!-- 초록2 끝 -->
			</div> <!-- 노랑1 끝 -->
		</div> <!-- 주황2 끝 -->
		<div>
			
		</div> <!-- 주황3 끝 -->
	</div> <!-- 빨강 끝 -->

</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>