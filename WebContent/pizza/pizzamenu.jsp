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
  
 <style type="text/css">
 .card-img-overlay {
 	padding: 0;
 }
 </style> <!-- 상세정보를 위한 카드 오버레이 패딩 값 수정 -->
 
</head>
<body>
<%@ include file="../common/navbar.jsp"%>
<div class="container">

	<div> <!-- 빨강 -->
		<div> <!-- 주황1 -->
			<div>
				<a>메뉴</a>
				<a>우측</a>
			</div>
			
			<div>
				<div class="row"><!-- 메뉴바 -->
					<div class="col-10"><!-- 상세메뉴 -->
						<div class="navbar navbar-expand-sm ">
							<!-- 링크들 (메뉴 중앙정렬) -->
							<ul class="navbar-nav">
								<li class="nav-item  d-flex justify-content-between align-itens-center"><a class="nav-link" href="../pizza/pizzamenu.jsp">피자</a></li>
								<li class="nav-item  d-flex justify-content-between align-itens-center"><a class="nav-link" href="">사이드디시</a></li>
								<li class="nav-item  d-flex justify-content-between align-itens-center"><a class="nav-link" href="">음료/기타</a></li>
							</ul>
						</div>
					</div>
					
					<div class="col-2"><!-- 더보기 -->
						<div class="navbar navbar-expand-sm ">
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="">맛있는핏자</a>
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
			<div class="d-flex justify-content-center">
				<p>프리미엄</p>
			</div>

			<div>
				<div class="row mt-3">
						<div class="col-12">
							<div class="card">
								<div class="card-header">새 상품을 확인해보세요</div>
								<div class="card-body">
									<div class="row">
										<!-- 상품 정보 시작 -->
										<div class="col-3">
											<!-- 상품정보를 포함하는 카드 시작 -->
											<div class="card" id="overlap1">
												<!-- 상품이미지 -->

												<!-- 사진 위에 사진 올리기 -->
												<div >
													<a href="" ><img class="card-img-top" src="../resource/images/pizza/20200120_ZlC0dSzU.jpg" /></a>
													<div class="card-img-overlay">
														<a href="#"><img  src="../resource/images/home/detailsee.png" /></a>
													</div>
												</div>
												
												<!-- 상품 컨텐츠정보 시작 -->
												<div class="card-body">
													<p class="font-weight-bold mb-1">시티 자전거</p>
													<!-- 가격정보 시작 -->
													<div class="mb-2">
														<div>
															<strong>소비자 가격: </strong> <del  class="float-right">150,000원</del>
														<div>
														</div>
															<strong class="text-danger">할인가격 가격: </strong> <span class="float-right font-weight-bolder">150,000원</span>
														</div>
													</div>
													<!-- 가격정보 끝 -->
													<div class="text-right">
														<a href="#" class="btn btn-secondary btn-sm">장바구니</a>
														<a href="#" class="btn btn-primary btn-sm">구매하기</a>
													</div>
													<div class="mt-3 mb-n3">
														<span class="badge badge-success">배송비무료</span>
														<span class="badge badge-info">New</span>
													</div>
												</div>
												<!-- 상품 컨텐츠정보 끝 -->
											</div>
											<!-- 상품정보를 포함하는 카드 끝 -->
										</div>
										<!-- 상품 정보 끝 -->
										
										<%//Dao 받아와서 for문 시작 %>
										<!-- 상품 정보 시작 -->
										<div class="col-3">
											<!-- 상품정보를 포함하는 카드 시작 -->
											<div class="card">
												<!-- 상품이미지 -->
												<!-- 사진 위에 사진 올리기? -->
												<div>
													<a href="" ><img class="card-img-top" src="<% // 피자 사진 받아오기 %>"></a> <!-- 사진 클릭하면 해당 사진 주문하러 가짐 -->
													<div class="card-img-overlay">
														<a href="#"><img  src="../resource/images/home/detailsee.png" /></a>
													</div>
												</div>
												
												<!-- 상품 컨텐츠정보 시작 -->
												<div class="card-body">
													<p class="font-weight-bold mb-1"><% // 피자 이름 받아오기 %></p>
													<!-- 가격정보 시작 -->
													<div class="mb-2">
														<div>
															<strong>L </strong> <del class="float-right"><% // 피자 가격 받아오기 %></del>
															<strong class="text-danger">R </strong> <span class="float-right font-weight-bolder"><% // 할인된 가격 받아오기 %></span>
														</div>
													</div>
													<!-- 가격정보 끝 -->
													<div class="mt-3 mb-n3">
														<span class="badge badge-success"><% // 태그도 디비로 받는건가? 아니면 그냥 하는건가? %></span>
														<span class="badge badge-info"><% // 태그도 디비로 받는건가? 아니면 그냥 하는건가? %></span>
													</div>
													<div class="">
														<p><%// 짧은 설명인데 받아오는건가? %></p>
														<p><%// 짧은 설명인데 받아오는건가? %></p>
													</div>

												</div>
												<!-- 상품 컨텐츠정보 끝 -->
											</div>
											<!-- 상품정보를 포함하는 카드 끝 -->
										</div>
										<!-- 상품 정보 끝 -->
										<%//for문 닫고 %>
										
									</div>
								</div>
							</div>
						</div>
					</div>
			</div>
		</div>	<!-- 주황2 -->
		
		<div>
			<p>　</p>
			<div class="d-flex justify-content-center">
				<p>클래식</p>
			</div>
			
			<div>
				<div class="row mt-3">
					<div class="col-12">
						<div class="card">
							<div class="card-header">새 상품을 확인해보세요</div>
								<div class="card-body">
									<div class="row">
										<%//Dao 받아와서 for문 시작 %>
										<!-- 상품 정보 시작 -->
										<div class="col-3">
										<!-- 상품정보를 포함하는 카드 시작 -->
										<div class="card">
											<!-- 상품이미지 -->
											<!-- 사진 위에 사진 올리기? -->
										<div>
											<a href="" ><img class="card-img-top" src="<% // 피자 사진 받아오기 %>"></a> <!-- 사진 클릭하면 해당 사진 주문하러 가짐 -->
											<div class="card-img-overlay">
												<a href="#"><img  src="../resource/images/home/detailsee.png" /></a>
											</div>
										</div>
													
											<!-- 상품 컨텐츠정보 시작 -->
											<div class="card-body">
												<p class="font-weight-bold mb-1"><% // 피자 이름 받아오기 %></p>
												<!-- 가격정보 시작 -->
													<div class="mb-2">
														<div>
															<strong>L </strong> <del  class="float-right"><% // 피자 가격 받아오기 %></del>
															<strong class="text-danger">R </strong> <span class="float-right font-weight-bolder"><% // 할인된 가격 받아오기 %></span>
														</div>
													</div>
													<!-- 가격정보 끝 -->
													<div class="mt-3 mb-n3">
														<span class="badge badge-success"><% // 태그도 디비로 받는건가? 아니면 그냥 하는건가? %></span>
														<span class="badge badge-info"><% // 태그도 디비로 받는건가? 아니면 그냥 하는건가? %></span>
													</div>
													<div class="">
														<p><%// 짧은 설명인데 받아오는건가? %></p>
														<p><%// 짧은 설명인데 받아오는건가? %></p>
													</div>

												</div>
												<!-- 상품 컨텐츠정보 끝 -->
											</div>
											<!-- 상품정보를 포함하는 카드 끝 -->
										</div>
										<!-- 상품 정보 끝 -->
										<%//for문 닫고 %>
									</div>
								</div>
							</div>
						</div>				
				</div>	<!-- 주황3 -->
			</div>
		</div>
		<div></div>	<!-- 주황4끝 -->
	
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>