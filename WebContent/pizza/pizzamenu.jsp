<%@page import="com.domino.vo.Pizza"%>
<%@page import="java.util.List"%>
<%@page import="com.domino.dao.PizzaDao"%>
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
		String position = "pizzamenu";
	%>
	
	<%@ include file="../common/navbar.jsp"%>
	

<div class="container">

	<div> <!-- 빨강 -->
		<div> <!-- 주황1 -->
			<div>
				<!-- 화면의 현재위치를 나타내는 부분 시작 -->
				<div class="row">
					<div class="col-9">
						<a class="display-4"><small>메뉴</small></a>
					</div>
			
					<div class="col-3">
						<ul class="breadcrumb">
							<li class="breadcrumb-item"><a href="../common/home.jsp">홈</a></li>
							<li class="breadcrumb-item"><a href="../pizza/pizzamenu.jsp">메뉴</a></li>
							<li class="breadcrumb-item"><a><strong>피자</strong></a></li>
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
								<li class="nav-item  d-flex justify-content-between align-itens-center"><a class="nav-link" href="../pizza/pizzamenu.jsp">피자</a></li>
								<li class="nav-item  d-flex justify-content-between align-itens-center"><a class="nav-link" href="#">사이드디시</a></li>
								<li class="nav-item  d-flex justify-content-between align-itens-center"><a class="nav-link" href="#">음료/기타</a></li>
							</ul>
						</div>
					</div>
					
					<div class="col-2"><!-- 더보기 -->
						<div class="navbar navbar-expand-sm ">
						<!-- 1주일간 가장 많이 팔린 피자 받아와서 출력, 해당하는 링크로 이동 -->
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="">맛있는핏자</a>	
							<div class="dropdown-menu">
								<a class="dropdown-item" href="">짱<% %></a>
								<a class="dropdown-item" href="">맛있는<% %></a>
								<a class="dropdown-item" href="">피자<% %></a>
								<a class="dropdown-item" href="">리스트<% %></a>
								<a class="dropdown-item" href="">피자먹고싶다<% %></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>	<!-- 주황1 끝-->
		
		<div>
			<div class="row mt-3">
					<div class="col-12">
						<div class="card">
							<div class="card-header d-flex justify-content-center">프리미엄</div>
							<div class="card-body">
								<div class="row">
								
								
								
									<!-- 상품 정보 시작 -->
									<div class="col-3">
										<!-- 상품정보를 포함하는 카드 시작 -->
										<div class="card">
											<!-- 상품이미지 -->

											<!-- 사진 위에 사진 올리기 -->
											<div >
												<a href="../pizza/detail.jsp" ><img class="card-img-top" src="../resource/images/pizza/20200120_ZlC0dSzU.jpg" /></a>
												<div class="float-right">
													<a><strong>자세히</strong></a>
													<a href="#"><img  src="../resource/images/home/detailsee.png"/></a>	<!-- ajax로 해당 피자 상세정보 화면에 출력 -->
												</div>
											</div>
											
											<!-- 상품 컨텐츠정보 시작 -->
											<div class="card-body">
												<p class="font-weight-bold mb-1">견본입니다 이거아니에요</p>
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
													<a href="#" class="btn btn-secondary btn-sm">장바구니 아님</a>
													<a href="#" class="btn btn-primary btn-sm">구매하기 아님</a>
												</div>
												<div class="mt-3 mb-n3">
													<span class="badge badge-success">배송비무료 아님</span>
													<span class="badge badge-info">New 아님</span>
												</div>
											</div>
											<!-- 상품 컨텐츠정보 끝 -->
										</div>
										<!-- 상품정보를 포함하는 카드 끝 -->
									</div>
									<!-- 상품 정보 끝 -->
									
									
									<!-- Dao 먼저 받기 -->
									<%
										PizzaDao pizzaDao = new PizzaDao();
										List<Pizza> pizzas = pizzaDao.getAllPizza();
									%>
									<!-- for문 시작 -->
									<%
										for(Pizza pizza : pizzas) {
									%>
									
									<style type="text/css">
										.jumbotron {
											background-size: 100%;
											width: 242px;
											height: 242px;
											padding: 0px 0px 0px 0px;
										}
									</style>								

									<!-- 상품 정보 시작 -->
									<div class="col-3">
										<!-- 상품정보를 포함하는 카드 시작 -->
										<div class="card">
											<!-- 상품이미지 -->
											<!-- 사진 위에 사진 올리기? -->
											<div class="jumbotron" style="background-image: url('<%=pizza.getImageSrc() %>'); ">
												
											<!-- 사진 클릭하면 해당 사진 주문하러 가짐 -->
											<!-- 피자 더미데이터 소스 ../로 변경하기 -->
											<!-- 피자 이미지 받아오기 -->
													<p><a class="btn btn-primary-outline btn-block" style="position:absolute; height:242px" href="#"></a></p>
													<a href="" style="position:absolute; left:210px; bottom:134px;"><img src="../resource/images/home/detailsee.png"/></a>	<!-- ajax로 해당 피자 상세정보 화면에 출력 -->

											</div>
											
											<!-- 상품 컨텐츠정보 시작 -->
											<!-- 피자 이름 받아오기 -->
											<div class="card-body">
												<p class="font-weight-bold mb-1"><%=pizza.getName() %></p>
												<!-- 가격정보 시작 -->
												<div class="mb-2">
													<div class="row">
													<!-- 피자 L, M 가격 받기 -->
														<div class="col-6" style="padding:5px"><strong class="text-danger float-left">L</strong><strong>　<%=pizza.getLprice() %>원~</strong></div>
														<div class="col-6" style="padding:5px"><strong class="text-danger float-left">M</strong><strong>　<%=pizza.getMprice() %>원~</strong></div>
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
									<% //for문 닫고
										}
									%>
									
								</div>
							</div>
						</div>
					</div>
				</div>

		</div>	<!-- 주황2 끝-->
		
		<div>
			<div class="row mt-3">
				<div class="col-12">
					<div class="card">
						<div class="card-header d-flex justify-content-center">클래식</div>
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
												<a href="#"><img  src="../resource/images/home/detailsee.png" /></a>	<!-- ajax로 해당 피자 상세정보 화면에 출력 -->
											</div>
										</div>
													
											<!-- 상품 컨텐츠정보 시작 -->
											<div class="card-body">
												<p class="font-weight-bold mb-1"><% // 피자 이름 받아오기 %></p>
												<!-- 가격정보 시작 -->
													<div class="mb-2">
														<div>
															<strong>L </strong> <del  class="float-right"><% // 피자 가격 받아오기 %></del>
															<strong class="text-danger">M </strong> <span class="float-right font-weight-bolder"><% // 할인된 가격 받아오기 %></span>
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
		</div> <!-- 주황3 끝-->

		<div class="row">
			<div class="col-6">
				<div>　</div>
				<div>유의사항</div><!-- 초록1 끝 -->
				<div>
					<ul>
						<li>
							<small> 
								단종으로 인한 상품권 사용 안내 : 동일 가격 또는 더 높은 가격의 제품으로 대체 주문 가능 (상품권에 명시된 제품보다 더 높은 가격대의 제품 주문 시, 금액 추가 발생)
								(단, 상품권에 명시된 제품보다 저렴한 제품 주문 시 발생하는 차액에 대해서는 환불 처리 불가)
							</small>
						<li>
							<small> 
								일부 리조트 및 특수매장은 상기 가격과 차이가 있음
								모든 사진은 이미지 컷이므로 실제 제품과 다를 수 있습니다.
							</small>
						</li>
					</ul>
					<div> 　</div>
				</div><!-- 초록2 끝 -->
			</div> <!-- 노랑1 끝 -->
			
			<div class="col-6 d-flex justify-content-center">
				<div>
					<div>　</div>
					<div>　</div>
					<div>
						<small>
								제품의 영양성분 및 알레르기 유발성분을 먼저 확인하세요.
						</small>
					</div>
					<div> 　</div>
					
					<div>
						<a href=""><img src="../resource/images/home/ingredient_plus.png"></a> <!-- ajax로 성분표 화면에 띄우기 -->
					</div>
				</div>

			</div> <!-- 노랑2 끝 -->
			
		</div>	<!-- 주황4끝 -->
		
	</div> <!-- 빨강 끝 -->
</div> <!-- 컨테이너 끝 -->
<%@ include file="../common/footer.jsp" %>
</body>
</html>