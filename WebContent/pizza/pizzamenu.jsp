<%@page import="com.domino.vo.Event"%>
<%@page import="com.domino.dao.EventDao"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
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
<style type="text/css">
	.jumbotron {
		background-size: 100%;
		width: 242px;
		height: 242px;
		padding: 0px 0px 0px 0px;
	}
</style>	 

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
								<li class="nav-item d-flex justify-content-between align-items-center"><a class="nav-link" href="../pizza/pizzamenu.jsp">피자</a></li>
								<li class="nav-item d-flex justify-content-between align-items-center"><a class="nav-link" href="#">사이드디시</a></li>
								<li class="nav-item d-flex justify-content-between align-items-center"><a class="nav-link" href="#">음료/기타</a></li>
							</ul>
						</div>
					</div>
					
					<!-- Dao 먼저 받기 -->					
					<%
						PizzaDao pizzaDao = new PizzaDao();
						List<Pizza> pizzas = pizzaDao.getAllPizza();
						// EventDao eventDao = new EventDao(); 이벤트 번호와 피자 번호를 연결해주는 것이 필요할 것 같은데..
					%>
					
					<div class="col-2"><!-- 더보기 -->
						<div class="navbar navbar-expand-sm ">
						<!-- 1주일간 가장 많이 팔린 피자 받아와서 출력, 해당하는 링크로 이동 -->
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="">맛있는핏자</a>	
							<div class="dropdown-menu">
							<%
								for (Pizza pizzaList : pizzas) {
							%>
								<a class="dropdown-item" href="../pizza/detail.jsp?no=<%=pizzaList.getNo() %>"><%=pizzaList.getName() %></a>
							<%
								}
							%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>	<!-- 주황1 끝-->
		<form id="my-form" action="" method="post">
		<div>
			<div class="row mt-3">
					<div class="col-12">
						<div class="card">
							<div class="card-header d-flex justify-content-center">당신의 완벽한 한끼를 위해 도미노 피자는 언제나 노력하겠습니다 :)</div>
							<div class="card-body">
								<div class="row">
									<!-- for문 시작 -->
									<%
										for (Pizza pizza : pizzas) {
											
									%>

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
												
												<button type="button" class="btn btn-primary-outline btn-block" 
														id="<%=pizza.getNo() %>" value="<% %>" style="position:absolute; height:242px"
														onclick="pizzaDetail(event)"></button>
												<!-- response.sendRedirect("loginform.jsp?error=fail"); -->

												<button type="button" 
													   data-toggle="modal"
													   data-target=".pizza-<%=pizza.getNo() %>"
													   style="position:absolute; left:210px; bottom:198px; border:0; padding:0">
													   <img src="../resource/images/home/detailsee.png">
												</button>
												
												<div class="modal fade pizza-<%=pizza.getNo() %>" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
												  <div class="modal-dialog modal-lg">
												    <div class="modal-content">
												    
												      <div class="modal-header ">
												        <h5 class="modal-title text-center col-12" id="exampleModalLabel" ><%=pizza.getName() %></h5>
												      </div> <!-- col-12 빼면 가운데 정렬 안됨 -->
												        
											          <div class="modal-body">
												        <div> <!-- (모달1 머리)주황 몸통 -->
												        
												        	<div> <!-- (모달1 몸통)노랑1 시작 -->
												        		<div class="row">
												        			<div class="col-6"><img id="src" src="<%=pizza.getImageSrc() %>" style="weight:45%; height:45%">
												        				<p class="text-muted"><small> * 모든 사진은 이미지컷으로 실제 제품과 다를 수 있습니다.</small></p><!--  -->
												        				
												        				<!-- 모달2 버튼 -->
												        				<button type="button" 
																		   data-toggle="modal"
																		   data-target=".pizza-big-pic-<%=pizza.getNo() %>"
																		   style="position:absolute; left:336px; bottom:434px; border:0; padding:0">
																		   <img src="../resource/images/home/pic_enlargement.png">
																		</button>
																		
																		<!-- 모달2 내용 -->
																		<!-- 큰일났다 사진 하나밖에 못가져온다ㅋㅋ -->
																		<div class="modal fade pizza-big-pic-<%=pizza.getNo() %>" style="padding:0 33px 0 0" tabindex="-1" role="dialog" aria-labelledby="myAllergyModal" aria-hidden="true">
																			<div class="modal-dialog modal-lg">
																				<div class="modal-content">
																					<div class="modal-header">
																						<h5 class="modal-title text-center col-12" id="exampleBigModal" >확대</h5>
																					</div>
																					
																					<div class="modal-body">
																						<div>
																							<div>
																								<div class="row ">
																									<img class="col-12" src="<%=pizza.getImageSrc() %>">
																								</div>
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																		<!-- 모달2 내용 끝 -->
																		
												        			</div>
												        			<div class="col-6">
													        			<div style="border-bottom: 1px solid black; padding-bottom:10px">
													        				<span><strong>메인 토핑</strong></span>
													        			</div>
												        				<p class="text-muted" style="">모짜렐라, 페터크림 치즈, 갈릭크림 소스, 로스트 포테이토, 파인애플, 양파, 뭐 등등</p>
												        				
												        				<div style="border-bottom: 1px solid black; padding-bottom:10px">
													        				<span><strong>원산지</strong></span>
													        			</div>
												        				<p class="text-muted">오리지널, 나폴리 도우(밀):미국산+캐나다산</p>
												        				
												        				<p class="text-center">
												        					<button type="button" data-toggle="modal" data-target=".pizza-nut-allergy" class="btn btn-outline-secondary btn-sm" role="button">영양성분 및 알레르기 유발성분</button>
												        					<!-- 각 피자마다 적어야되는데... 너무 이건;;
												        					&nbsp;&nbsp;&nbsp;
												        					<button class="btn btn-outline-secondary btn-sm" role="button">피자스토리</button>
												        					 -->
												        				</p>
												        				
											        					<div class="modal fade pizza-nut-allergy" style="padding:0 33px 0 0" tabindex="-1" role="dialog" aria-labelledby="myAllergyModal" aria-hidden="true">
											        						<div class="modal-dialog modal-lg">
																				<div class="modal-content">
																					<div class="modal-header">
																						<h5 class="modal-title text-center col-12" id="exampleAllerhyModal" >영양성분 및 알레르기 유발성분</h5>
																					</div>
																					
																					<div class="modal-body">
																						<div class="row ">
																							<div class="col-12">
																								<ul class="nav nav-tabs nav-justified">
																								
																									<li class="nav-item dropdown">
																										<a class="nav-link active dropdown-toggle" data-toggle="dropdown" href="#nutrient" role="button" aria-haspopup="true" aria-expanded="false">영양성분</a>
																										<div class="dropdown-menu w-100">
																									      <a class="dropdown-item text-center" href="#pizza-nut">피자</a>
																									      <a class="dropdown-item text-center" href="#side-nut">사이드</a>
																								      </div>
																									</li>

																									<li class="nav-item dropdown">
																										<a class="nav-link active dropdown-toggle" data-toggle="dropdown" href="#allergy" role="button" aria-haspopup="true" aria-expanded="false">알레르기</a>
																										<div class="dropdown-menu w-100">
																									      <a class="dropdown-item text-center" href="#pizza-allergy">피자</a>
																									      <a class="dropdown-item text-center" href="#side-allergy">사이드</a>
																								      </div>
																									</li>
																									
																								</ul>
																								
																								<div class="dropdown-content">
																									<div class="dropdown-pane container active" id="pizza-nut">
																										<div class="row">
																											<div class='col-12'>
																												<p>하하하하하하하</p>
																											</div>
																										</div>
																									</div>
																									<div class="tab-pane container active" id="side-nut">
																										<div class="row">
																											<div class='col-12'>
																												<p>이히히히히히힣</p>
																											</div>
																										</div>
																									</div>																									
																								</div>
																								
																								
																								
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
											        					</div>
												        					
												        			</div>
												        		</div>
												        	</div> <!-- (모달1 몸통)노랑1 끝 -->
												        
												        </div> <!-- (모달1 머리)주황 몸통 끝 -->
												      </div>

												    </div>
												  </div>
												</div> <!-- 모달1 끝 -->

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
												
													<%
														// Reg+30 (등록 날짜에서 30일 지났으면) 신상 아님
													%>
													
													<span class="badge badge-success"><%=pizza.getRegDate() %> 출시!</span>
													<span class="badge badge-info">Best!<% // 태그도 디비로 받는건가? 아니면 그냥 하는건가? %></span>
													<a class="badge badge-danger" href="#">해당 링크를 클릭하시면 이벤트 가격에!</a>
								
													<%
														
													%>
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
	</form>


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
								일부 리조트 및 특수매장은 상기 가격과 차이가 있으며	모든 사진은 이미지 컷이므로 실제 제품과 다를 수 있습니다.
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
<script type="text/javascript">

	function pizzaDetail(event) {
		
		event.preventDefault();
		
		//var type = event.target.name;
		//var amount = event.target.value;
			
		//location.href="detail.jsp?no=" + no
				
		var url = 'detail.jsp?no=';
		// var url2 = '&discountrate=';
		
		var no = event.target.id;
		// var dis = event.target.value;
		var form = document.querySelector("#my-form");
		
		form.setAttribute("action", url + no);
//		form.setAttribute("action", url + no + url2 + dis);
		form.submit();

	}

	function push() {
		
		alert("dsksk");
	}
</script>
</body>
</html>