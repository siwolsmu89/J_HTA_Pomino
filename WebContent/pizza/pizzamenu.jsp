<%@page import="com.domino.util.NumberUtil"%>
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
			<div class="header">
				<!-- 화면의 현재위치를 나타내는 부분 시작 -->
				<div class="row">
					<div class="col-4">
						<h4>메뉴</h4>
					</div>
			
					<div class="col-8">
						<ul class="nav justify-content-end small text-muted">
							<li class="nav-item">
								<a class="nav-link text-muted active pr-1"
									href="../common/home.jsp">홈
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link disabled pr-1" 
									href="#" tabindex="-1" aria-disabled="true">>
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link text-muted active pr-1"
									href="../pizza/pizzamenu.jsp">메뉴
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link disabled pr-1"
									href="#" tabindex="-1" aria-disabled="true">>
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link disabled text-dark font-weight-bold pr-1"
									href="#" tabindex="-1" aria-disabled="true">피자
								</a>
							</li>
						</ul>
					</div>
				</div>
				<!-- 화면의 현재위치를 나타내는 부분 끝 -->
				<div style="background-color: black; height: 2px;" class="mb-2"></div>
				
			</div>
			
			<script>/* 주석 처리
			<div>
				<!-- 메뉴바 -->
				<div class="row">
					<!-- 상세메뉴 -->
					<!--  -->
					<div class="col-10">
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
					%>
					
					<!-- 더보기 -->
					<div class="col-2">
						<div class="navbar navbar-expand-sm ">
							<!-- 1주일간 가장 많이 팔린 피자 받아와서 출력, 해당하는 링크로 이동 -->
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="">피자 목록</a>	
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
			*/</script>
			
		</div>	<!-- 주황1 끝-->
		<form id="my-form" method="post">
		<div>
			<div class="row mt-3">
					<div class="col-12">
						<div class="card">
							<div class="card-header d-flex justify-content-center">당신의 완벽한 한끼를 위해 포미노 피자는 언제나 노력하겠습니다 :)</div>
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
											<div class="jumbotron" style="background-image: url('<%=pizza.getImageSrc() %>');">
												
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
													   style="position:absolute; left:210px; bottom:182px; border:0; padding:0">
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
												        				<p class="text-muted" style="">모짜렐라, 페터크림 치즈, 갈릭크림 소스, 로스트 포테이토, 파인애플, 양파 청피망, 옥수수, 베이컨 칩, 파슬리, 호스래디시 스퀴드(오징어), 스위트 칠리크랩, 스위트 칠리크랩 소스, 오리엔탈 통새우</p>
												        				
												        				<div style="border-bottom: 1px solid black; padding-bottom:10px">
													        				<span><strong>원산지</strong></span>
													        			</div>
												        				<p class="text-muted">오리지널, 나폴리 도우(밀) : 미국산+캐나다산 / 씬 도우(밀) : 미국산 / 슈퍼시드 함유 도우(밀) : 미국산+캐나다산, (흑미) : 국내산 / 모차렐라 치즈 : 미국산 / 호스래디시 스퀴드(오징어) : 중국산 / 스위트 칠리크랩(붉은 대게) : 국내산 / 베이컨칩(돼지고기) : 미국산</p>
												        				
												        				<p class="text-center">
												        					<button type="button" data-toggle="modal" data-target="#modal-<%=pizza.getNo()%>" class="btn btn-outline-secondary btn-sm" role="button">영양성분 및 알레르기 유발성분</button>
												        					<!-- 각 피자마다 적어야되는데... 너무 이건;;
												        					&nbsp;&nbsp;&nbsp;
												        					<button class="btn btn-outline-secondary btn-sm" role="button">피자스토리</button>
												        					 -->
												        				</p>
												        				

												        				
											        					<div class="modal fade pizza-nut-allergy" id="modal-<%=pizza.getNo()%>" style="padding:0 33px 0 0" tabindex="-1" role="dialog" aria-labelledby="myAllergyModal" aria-hidden="true">
											        						<div class="modal-dialog modal-lg">
																				<div class="modal-content">
																					<div class="modal-header">
																						<h5 class="modal-title text-center col-12" id="exampleAllerhyModal" >영양성분 및 알레르기 유발성분</h5>
																					</div>
																					
																					<div class="modal-body">
																						<div class="row ">
																							<div class="col-12">
																								<!-- 탭 리스트 시작 -->
																								<ul class="nav nav-tabs nav-justified" role="tablist">
																					  				<li class="nav-item" role="presentation">
																					    				<a class="nav-link active" id="pizza-tab" data-toggle="tab" data-target="#modal1-<%=pizza.getNo() %>" href="#pizza" role="tab" aria-controls="pizza" aria-selected="true">피자</a>
																									</li>
																									<li class="nav-item" role="presentation">
																					    				<a class="nav-link" id="side-tab" data-toggle="tab" data-target="#modal2-<%=pizza.getNo() %>" href="#side" role="tab" aria-controls="side" aria-selected="true">사이드</a>
																									</li>
																								</ul>
																								<!-- 탭 리스트 끝 -->
																								<!-- 탭 컨텐츠 시작 -->
																								<div class="tab-content">
																									<!-- 새 상품 탭과 연관된 새 상품 컨텐츠 시작 -->
																									<div class="tab-pane fade show active" id="modal1-<%=pizza.getNo() %>" role="tabpanel" aria-labelledby="pizza-tab">
																										<div class="row mt-3">
																											<div class="col-12">
																												<div class="card">
																													<div class="card-header">피자에 대한 정보를 확인해보세요</div>
																													<div class="card-body">
																														<div class="row">
																															<div class="col-12">
																																<p>
																																	한국인에게 알레르기를 유발할 수 있는 12가지 식품에 대해 아래와 같이 제품별 상세 내용을 표기하여 안내해드립니다. (괄호 안 식품이 해당 토핑에 포함되어있는 알레르기 유발가능 식품)
																																</p>
																																<dt>
																																	* 알레르기 유발 가능 식품 :
																																</dt>
																																<dd>
																																	난류(가금류에 한한다), 우유, 메밀, 땅콩, 대두, 밀, 고등어, 게, 새우, 돼지고기, 복숭아, 토마토, 아황산류, 호두, 닭고기, 쇠고기, 오징어, 조개류(굴, 전복, 홍합포함), 잣
																																</dd>
																																<div>
																																	<h5>피자</h5>
																																</div>
																																<div>
																																	<p>피자 공통: 오리지널,나폴리, 슈퍼시드함유, 샌드 도우(우유, 밀, 대두), 씬, 더블 도우(밀), 더블치즈엣지(스트링 치즈(우유, 대두, 밀), 카망베르 크림치즈(우유))</p>
																																</div>
																																<div>
																																	<table class="table small">
																																	<caption>피자 재료중 알레르기 유발 가능 식품</caption>
																																		<colgroup>
																																			<col width="7%">
																																			<col width="24%">
																																			<col>
																																		</colgroup>
																																		<thead>
																																			<tr>
																																				<th>NO</th>
																																				<th>피자</th>
																																				<th>알레르기 유발성분 표기</th>
																																			</tr>
																																		</thead>
																																		<tbody>
																																			<tr>
																																				<td>1</td>
																																				<td>시리얼 칠리크랩</td>
																																				<td>모차렐라, 페터크림 치즈(우유), 토마토 소스(토마토, 대두), 갈릭 크림 소스(계란, 우유, 대두, 밀), 로스트 포테이토(대두), 베이컨칩(돼지고기), 호스래디시 스퀴드(오징어, 계란, 우유, 대두), 스위트 칠리크랩(게, 대두, 밀, 새우, 토마토, 닭고기, 오징어, 조개류(굴)), 오리엔탈 통새우(새우, 우유, 대두, 밀, 토마토, 닭고기, 쇠고기, 조개류(굴))</td>
																																			</tr>
																																			<tr>
																																				<td>2</td>
																																				<td>블랙타이거슈림프+직화스테이크</td>
																																				<td>
																																					모차렐라, 페터크림, 리코타 치즈, 로마노크림, 체더, 파르메산, 콰트로치즈퐁듀 치즈(우유),
																																					로스트포테이토(대두), 호스래디시소스(계란, 우유, 대두), 리얼불고기(대두,밀,쇠고기,조개류(굴)),
																																					블랙타이거 슈림프(새우), 아라비아타소스(계란,대두,밀,돼지고기,닭고기,토마토), 선드라이토마토(토마토),
																																					블랙앵거스 비프(쇠고기, 대두, 밀, 계란)
																																				</td>
																																			</tr>
																																			<tr>
																																				<td>3</td>
																																				<td>30치즈&뉴욕 스트립 스테이크+포테이토</td>
																																				<td>갈릭 크림 소스(계란, 우유, 대두, 밀), 뉴욕 스트립 스테이크(대두, 밀, 쇠고기), 모차렐라, 프로볼로네, 체더, 크리미 고르곤졸라(우유), 15가지 믹스 슈레드 치즈(우유, 대두), 11가지 믹스 옐로우 치즈(우유, 대두, 계란), 감자(대두,이산화황), 마요네즈(난류,대두), 베이컨(돼지고기), 토마토소스, 토마토 콩피(토마토)</td>
																																			</tr>
																																			<tr>
																																				<td>4</td>
																																				<td>블랙타이거 슈림프+블랙앵거스 스테이크</td>
																																				<td>모차렐라, 페터크림, 리코타 치즈, 로마노크림, 체더, 파르메산, 콰트로치즈퐁듀 치즈(우유), 로스트포테이토(대두), 호스래디시소스(계란, 우유, 대두), 리얼불고기(대두,밀,쇠고기,조개류(굴)), 블랙타이거 슈림프(새우), 아라비아타소스(계란,대두,밀,돼지고기,닭고기,토마토), 선드라이토마토(토마토), 블랙앵거스 비프(쇠고기, 대두, 밀, 계란)</td>
																																			</tr>
																																			<tr>
																																				<td>5</td>
																																				<td>30치즈&뉴욕 스트립 스테이크</td>
																																				<td>갈릭 크림 소스(계란, 우유, 대두, 밀), 뉴욕 스트립 스테이크(대두, 밀, 쇠고기), 모차렐라, 프로볼로네, 체더, 크리미 고르곤졸라(우유), 15가지 믹스 슈레드 치즈(우유, 대두), 11가지 믹스 옐로우 치즈(우유, 대두, 계란), 감자(대두,이산화황), 마요네즈(난류,대두), 베이컨(돼지고기), 토마토소스, 토마토 콩피(토마토)</td>
																																			</tr>
																																			<tr>
																																				<td>6</td>
																																				<td>치즈케이크 블랙타이거</td>
																																				<td>
																																					파르메산,모차렐라(우유), 선드라이토마토(토마토), 베이컨칩(돼지고기), 치즈케이크무스(계란,우유), 블랙타이거 슈림프(새우), 호스래디시소스(계란, 우유, 대두)
																																				</td>
																																			</tr>
																																			<tr>
																																				<td>7</td>
																																				<td>미트미트미트</td>
																																				<td>
																																					모차렐라, 페터크림 치즈, 체더 치즈(우유), 아라비아타소스(계란,대두,밀,돼지고기,닭고기,토마토), 리얼불고기(대두,밀,쇠고기,조개류(굴)), 비프 스테이크(대두, 밀, 토마토, 쇠고기), BBQ포크(대두, 밀, 토마토, 돼지고기, 쇠고기), 트러플크림(계란,우유,대두)
																																				</td>
																																			</tr>
																																			<tr>
																																				<td>8</td>
																																				<td>핫치킨</td>
																																				<td>
																																					스파이시 치킨(닭고기, 토마토, 대두, 밀, 우유, 아황산류), 스파이시마요(계란,우유,대두,밀), 특제 바비큐 소스(대두, 토마토), 체더, 파르메산, 모차렐라 치즈(우유), 베이컨칩(돼지고기),
																																				</td>
																																			</tr>
																																			<tr>
																																				<td>9</td>
																																				<td>리얼불고기</td>
																																				<td>
																																					리얼불고기(대두,밀,쇠고기,조개류(굴)), 불고기소스(우유,대두,밀,토마토,쇠고기,조개류(굴)), 체더, 모차렐라 치즈(우유)
																																				</td>
																																			</tr>
																																			<tr>
																																				<td>10</td>
																																				<td>치즈가든</td>
																																				<td>토마토 슬라이스(토마토), 리코타, 프로볼로네, 모차렐라 치즈(우유), 토마토소스(토마토, 대두))</td>
																																			</tr>
																																			<tr>
																																				<td>11</td>
																																				<td>문어밤 슈림프</td>
																																				<td>
																																					페터크림, 파르메산, 모차렐라 치즈(우유), 토마토소스(토마토, 대두), 호스래디시소스(계란, 우유, 대두), 딥치즈소스(우유, 대두), 문어(대두, 밀, 우유, 새우, 쇠고기, 조개류), 통새우(새우)
																																				</td>
																																			</tr>
																																			<tr>
																																				<td>12</td>
																																				<td>베스트 콰트로</td>
																																				<td>
																																					모차렐라, 페터크림, 리코타, 로마노크림치즈(우유), 로스트포테이토(대두), 호스래디시소스(계란,우유,대두), 아라비아타소스(계란,대두,밀,돼지고기, 닭고기,토마토), 블랙앵거스 비프 (쇠고기,대두,밀,계란), 리얼불고기(대두,밀,쇠고기,조개류(굴)), 블랙타이거 슈림프(새우), 감자(대두,이산화황), 마요네즈(난류,대두), 베이컨(돼지고기), 불고기(쇠고기,대두,밀,아황산류), 페퍼로니(돼지고기,쇠고기), 포크(돼지고기,쇠고기,대두,밀,계란), 햄(돼지고기,쇠고기,대두,계란)
																																				</td>
																																			</tr>
																																			<tr>
																																				<td>13</td>
																																				<td>더블크러스트 이베리코</td>
																																				<td>
																																					모차렐라, 리코타, 로마노크림치즈, 콰트로 치즈퐁듀(우유), 베이컨(돼지고기), New 고구마 무스(계란, 우유, 대두, 밀), 감자(대두,이산화황),마요네즈(난류,대두), 토마토소스(토마토, 대두), 선드라이토마토(토마토), 코코넛 허니버터 파우더(대두,밀,우유),이베리코 스테이크 (돼지고기,대두,밀)
																																				</td>
																																			</tr>
																																			<tr>
																																				<td>14</td>
																																				<td>우리 고구마</td>
																																				<td>
																																					모차렐라, 리코타, 체더, 카망베르 크림 치즈(우유), 트러플크림(계란,우유,대두), 리얼불고기(대두,밀,쇠고기,조개류(굴)), 베이컨(돼지고기), 고구마 무스(계란, 우유, 대두, 밀)
																																				</td>
																																			</tr>
																																			<tr>
																																				<td>15</td>
																																				<td>블랙앵거스 스테이크</td>
																																				<td>
																																					모차렐라, 페터크림, 리코타 치즈 (우유), 로스트포테이토(대두), 호스래디시소스(계란, 우유, 대두), 아라비아타소스(계란,대두,밀,돼지고기,닭고기,토마토), 선드라이토마토(토마토), 앵거스비프 (쇠고기, 대두, 밀, 계란)
																																				</td>
																																			</tr>
																																		</tbody>
																																	</table>
																																	<table class="table small">
																																		<thead>
																																			<tr>
																																				<th>제품명</th>
																																				<th>총 중량(g)</th>
																																				<th>1회분 기준</th>
																																				<th>1회분
																																				중량 (g)</th>
																																				<th>열량
																																				(kcal/1회분)</th>
																																				<th>단백질
																																				(g/1회분)</th>
																																				<th>포화지방
																																				(g/1회분)</th>
																																				<th>나트륨
																																				(mg/1회분)</th>
																																				<th>당류
																																				(g/1회분)</th>
																																			</tr>
																																		</thead>
																																		<tbody>
																																			<tr>
																																				<td>시리얼 칠리크랩(오리지널L)</td>
																																				<td>1100</td>
																																				<td>1조각</td>
																																				<td>138</td>
																																				<td>303</td>
																																				<td>14</td>
																																				<td>4</td>
																																				<td>583</td>
																																				<td>6</td>
																																			</tr>
																																			<tr>
																																				<td>시리얼 칠리크랩(오리지널M)</td>
																																				<td>704</td>
																																				<td>1조각</td>
																																				<td>117</td>
																																				<td>253</td>
																																				<td>12</td>
																																				<td>4</td>
																																				<td>524</td>
																																				<td>5</td>
																																			</tr>
																																			<tr>
																																				<td>시리얼 칠리크랩(나폴리L)</td>
																																				<td>910</td>
																																				<td>1조각</td>
																																				<td>114</td>
																																				<td>231</td>
																																				<td>12</td>
																																				<td>3</td>
																																				<td>530</td>
																																				<td>5</td>
																																			</tr>
																																			<tr>
																																				<td>시리얼 칠리크랩(나폴리M)</td>
																																				<td>582</td>
																																				<td>두조각</td>
																																				<td>194</td>
																																				<td>385</td>
																																				<td>19</td>
																																				<td>6</td>
																																				<td>914</td>
																																				<td>9</td>
																																			</tr>
																																			<tr>
																																				<td>시리얼 칠리크랩(씬크러스트L)</td>
																																				<td>752</td>
																																				<td>2조각</td>
																																				<td>188</td>
																																				<td>399</td>
																																				<td>21</td>
																																				<td>9</td>
																																				<td>919</td>
																																				<td>10</td>
																																			</tr>
																																			<tr>
																																				<td>시리얼 칠리크랩(씬크러스트M)</td>
																																				<td>493</td>
																																				<td>2조각</td>
																																				<td>164</td>
																																				<td>341</td>
																																				<td>17</td>
																																				<td>8</td>
																																				<td>817</td>
																																				<td>9</td>
																																			</tr>
																																			<tr>
																																				<td>시리얼 칠리크랩(슈퍼시드함유도우L)</td>
																																				<td>1119</td>
																																				<td>1조각</td>
																																				<td>140</td>
																																				<td>317</td>
																																				<td>15</td>
																																				<td>4</td>
																																				<td>613</td>
																																				<td>6</td>
																																			</tr>
																																			<tr>
																																				<td>시리얼 칠리크랩(오리지널L)</td>
																																				<td>1100</td>
																																				<td>1조각</td>
																																				<td>138</td>
																																				<td>303</td>
																																				<td>14</td>
																																				<td>4</td>
																																				<td>583</td>
																																				<td>6</td>
																																			</tr>
																																			<tr>
																																				<td>시리얼 칠리크랩(오리지널M)</td>
																																				<td>704</td>
																																				<td>1조각</td>
																																				<td>117</td>
																																				<td>253</td>
																																				<td>12</td>
																																				<td>4</td>
																																				<td>524</td>
																																				<td>5</td>
																																			</tr>
																																			<tr>
																																				<td>시리얼 칠리크랩(나폴리L)</td>
																																				<td>910</td>
																																				<td>1조각</td>
																																				<td>114</td>
																																				<td>231</td>
																																				<td>12</td>
																																				<td>3</td>
																																				<td>530</td>
																																				<td>5</td>
																																			</tr>
																																			<tr>
																																				<td>시리얼 칠리크랩(나폴리M)</td>
																																				<td>582</td>
																																				<td>두조각</td>
																																				<td>194</td>
																																				<td>385</td>
																																				<td>19</td>
																																				<td>6</td>
																																				<td>914</td>
																																				<td>9</td>
																																			</tr>
																																			<tr>
																																				<td>시리얼 칠리크랩(씬크러스트L)</td>
																																				<td>752</td>
																																				<td>2조각</td>
																																				<td>188</td>
																																				<td>399</td>
																																				<td>21</td>
																																				<td>9</td>
																																				<td>919</td>
																																				<td>10</td>
																																			</tr>
																																			<tr>
																																				<td>시리얼 칠리크랩(씬크러스트M)</td>
																																				<td>493</td>
																																				<td>2조각</td>
																																				<td>164</td>
																																				<td>341</td>
																																				<td>17</td>
																																				<td>8</td>
																																				<td>817</td>
																																				<td>9</td>
																																			</tr>
																																			<tr>
																																				<td>시리얼 칠리크랩(슈퍼시드함유도우L)</td>
																																				<td>1119</td>
																																				<td>1조각</td>
																																				<td>140</td>
																																				<td>317</td>
																																				<td>15</td>
																																				<td>4</td>
																																				<td>613</td>
																																				<td>6</td>
																																			</tr>
																																			<tr>
																																				<td>시리얼 칠리크랩(오리지널L)</td>
																																				<td>1100</td>
																																				<td>1조각</td>
																																				<td>138</td>
																																				<td>303</td>
																																				<td>14</td>
																																				<td>4</td>
																																				<td>583</td>
																																				<td>6</td>
																																			</tr>
																																			<tr>
																																				<td>시리얼 칠리크랩(오리지널M)</td>
																																				<td>704</td>
																																				<td>1조각</td>
																																				<td>117</td>
																																				<td>253</td>
																																				<td>12</td>
																																				<td>4</td>
																																				<td>524</td>
																																				<td>5</td>
																																			</tr>
																																			<tr>
																																				<td>시리얼 칠리크랩(나폴리L)</td>
																																				<td>910</td>
																																				<td>1조각</td>
																																				<td>114</td>
																																				<td>231</td>
																																				<td>12</td>
																																				<td>3</td>
																																				<td>530</td>
																																				<td>5</td>
																																			</tr>
																																			<tr>
																																				<td>시리얼 칠리크랩(나폴리M)</td>
																																				<td>582</td>
																																				<td>두조각</td>
																																				<td>194</td>
																																				<td>385</td>
																																				<td>19</td>
																																				<td>6</td>
																																				<td>914</td>
																																				<td>9</td>
																																			</tr>
																																			<tr>
																																				<td>시리얼 칠리크랩(씬크러스트L)</td>
																																				<td>752</td>
																																				<td>2조각</td>
																																				<td>188</td>
																																				<td>399</td>
																																				<td>21</td>
																																				<td>9</td>
																																				<td>919</td>
																																				<td>10</td>
																																			</tr>
																																			<tr>
																																				<td>시리얼 칠리크랩(씬크러스트M)</td>
																																				<td>493</td>
																																				<td>2조각</td>
																																				<td>164</td>
																																				<td>341</td>
																																				<td>17</td>
																																				<td>8</td>
																																				<td>817</td>
																																				<td>9</td>
																																			</tr>
																																			<tr>
																																				<td>시리얼 칠리크랩(슈퍼시드함유도우L)</td>
																																				<td>1119</td>
																																				<td>1조각</td>
																																				<td>140</td>
																																				<td>317</td>
																																				<td>15</td>
																																				<td>4</td>
																																				<td>613</td>
																																				<td>6</td>
																																			</tr>
																																			<tr>
																																				<td>시리얼 칠리크랩(오리지널L)</td>
																																				<td>1100</td>
																																				<td>1조각</td>
																																				<td>138</td>
																																				<td>303</td>
																																				<td>14</td>
																																				<td>4</td>
																																				<td>583</td>
																																				<td>6</td>
																																			</tr>
																																			<tr>
																																				<td>시리얼 칠리크랩(오리지널M)</td>
																																				<td>704</td>
																																				<td>1조각</td>
																																				<td>117</td>
																																				<td>253</td>
																																				<td>12</td>
																																				<td>4</td>
																																				<td>524</td>
																																				<td>5</td>
																																			</tr>
																																			<tr>
																																				<td>시리얼 칠리크랩(나폴리L)</td>
																																				<td>910</td>
																																				<td>1조각</td>
																																				<td>114</td>
																																				<td>231</td>
																																				<td>12</td>
																																				<td>3</td>
																																				<td>530</td>
																																				<td>5</td>
																																			</tr>
																																			<tr>
																																				<td>시리얼 칠리크랩(나폴리M)</td>
																																				<td>582</td>
																																				<td>두조각</td>
																																				<td>194</td>
																																				<td>385</td>
																																				<td>19</td>
																																				<td>6</td>
																																				<td>914</td>
																																				<td>9</td>
																																			</tr>
																																			<tr>
																																				<td>시리얼 칠리크랩(씬크러스트L)</td>
																																				<td>752</td>
																																				<td>2조각</td>
																																				<td>188</td>
																																				<td>399</td>
																																				<td>21</td>
																																				<td>9</td>
																																				<td>919</td>
																																				<td>10</td>
																																			</tr>
																																			<tr>
																																				<td>시리얼 칠리크랩(씬크러스트M)</td>
																																				<td>493</td>
																																				<td>2조각</td>
																																				<td>164</td>
																																				<td>341</td>
																																				<td>17</td>
																																				<td>8</td>
																																				<td>817</td>
																																				<td>9</td>
																																			</tr>
																																			<tr>
																																				<td>시리얼 칠리크랩(슈퍼시드함유도우L)</td>
																																				<td>1119</td>
																																				<td>1조각</td>
																																				<td>140</td>
																																				<td>317</td>
																																				<td>15</td>
																																				<td>4</td>
																																				<td>613</td>
																																				<td>6</td>
																																			</tr>
																																		</tbody>
																																	</table>
																																</div>
																															</div>
																														</div>
																													</div>
																												</div>
																											</div>
																										</div>
																									</div>
																									<!-- 새 상품 탭과 연관된 새 상품 컨텐츠 끝 -->
																									<!-- 베스트 상품 탭과 연관된 베스트 상품 컨텐츠 시작 -->
																									<div class="tab-pane fade" id="modal2-<%=pizza.getNo() %>" role="tabpanel" aria-labelledby="side-tab">
																										<div class="row mt-3">
																											<div class="col-12">
																												<div class="card">
																													<div class="card-header">사이드메뉴에 대한 정보를 확인해보세요.</div>
																													<div class="card-body">
																														<div class="row">
																															<div class="col-12">
																																<p>
																																	한국인에게 알레르기를 유발할 수 있는 12가지 식품에 대해 아래와 같이 제품별 상세 내용을 표기하여 안내해드립니다. (괄호 안 식품이 해당 토핑에 포함되어있는 알레르기 유발가능 식품)
																																</p>
																																<dt>
																																	* 알레르기 유발 가능 식품 :
																																</dt>
																																<dd>
																																	난류(가금류에 한한다), 우유, 메밀, 땅콩, 대두, 밀, 고등어, 게, 새우, 돼지고기, 복숭아, 토마토, 아황산류, 호두, 닭고기, 쇠고기, 오징어, 조개류(굴, 전복, 홍합포함), 잣
																																</dd>
																																<table class="table small">
																																	<caption>사이드디시 재료중 알레르기 유발 가능 식품</caption>
																																		<colgroup>
																																			<col width="7%">
																																			<col width="24%">
																																			<col>
																																		</colgroup>
																																	<thead>
																																		<tr>
																																			<th>NO</th>
																																			<th>사이드디시</th>
																																			<th>알레르기 유발성분 표기</th>
																																		</tr>
																																	</thead>
																																	<tbody>
																																		<tr>
																																			<td>1</td>
																																			<td>갈릭&허브윙스</td>
																																			<td>닭고기,대두,밀,우유,토마토</td>
																																		</tr>
																																		<tr>
																																			<td>2</td>
																																			<td>코울슬로</td>
																																			<td>계란,대두</td>
																																		</tr>
																																		<tr>
																																			<td>3</td>
																																			<td>콘샐러드</td>
																																			<td>계란,대두</td>
																																		</tr>
																																		<tr>
																																			<td>4</td>
																																			<td>화이트 크림 스파게티</td>
																																			<td>스파게티면(밀),크림소스(계란,우유,대두,밀,돼지고기,닭고기,조개류(굴)),베이컨(돼지고기),베이컨칩(돼지고기),모차렐라(우유)</td>
																																		</tr>
																																		<tr>
																																			<td>5</td>
																																			<td>New 치즈볼로네즈 스파게티</td>
																																			<td>스파게티면(밀),볼로네즈소스(우유,대두,밀,토마토,조개류(굴),쇠고기),모차렐라(우유)</td>
																																		</tr>
																																		<tr>
																																			<td>6</td>
																																			<td>H&H(New 치볼_화이트크림)</td>
																																			<td>스파게티면(밀),볼로네즈소스(우유,대두,밀,토마토,조개류(굴),쇠고기),모차렐라(우유), 크림소스(계란,우유,대두,밀,돼지고기,닭고기,조개류(굴)),베이컨(돼지고기)</td>
																																		</tr>
																																		<tr>
																																			<td>7</td>
																																			<td>트러플 크림 리조또</td>
																																			<td>베이컨칩(돼지고기), 풍기크림소스(조개류(굴,바지락)), 우유, 밀, 대두), 쌀 (우유, 대두), 모차렐라치즈(우유)</td>
																																		</tr>
																																		<tr>
																																			<td>8</td>
																																			<td>슈퍼곡물 치킨</td>
																																			<td>밀, 우유, 대두, 계란, 땅콩, 토마토, 닭고기, 쇠고기</td>
																																		</tr>
																																		<tr>
																																			<td>9</td>
																																			<td>펜네 파스타</td>
																																			<td>펜네파스타면(밀), 크림소스(계란,우유,대두,밀,돼지고기,닭고기,조개류(굴)), 베이컨칩(돼지고기), 모차렐라, 파르메산 치즈(우유)</td>
																																		</tr>
																																		<tr>
																																			<td>10</td>
																																			<td>샐러드 가든</td>
																																			<td>혼합간장(대두), 발효식초(밀), 방울 토마토, 치킨엑기스분말(닭고기)</td>
																																		</tr>
																																		<tr>
																																			<td>11</td>
																																			<td>한돈 빠에야</td>
																																			<td>쌀(우유, 대두), 토마토 빠에야 소스(계란, 우유, 대두, 밀), 한돈 포크(대두, 돼지고기, 토마토, 쇠고기), 모차렐라 치즈(우유)</td>
																																		</tr>
																																		<tr>
																																			<td>12</td>
																																			<td>크리스피 핫 순살치킨</td>
																																			<td>닭고기,대두,밀,쇠고기,계란</td>
																																		</tr>
																																	</tbody>
																																</table>
																																<table class="table small">
																																	<colgroup>
																																		<col width="7%">
																																		<col width="24%">
																																		<col>
																																	</colgroup>
																																	<thead>
																																		<tr>
																																			<th>NO</th>
																																			<th>제품명</th>
																																			<th>알레르기 유발성분 표기</th>
																																		</tr>
																																	</thead>
																																	<tbody>
																																		<tr>
																																			<td>1</td>
																																			<td>갈릭 디핑 소스</td>
																																			<td>계란,우유,대두</td>
																																		</tr>
																																		<tr>
																																			<td>2</td>
																																			<td>도미노 시리얼</td>
																																			<td>계란,우유,대두</td>
																																		</tr>
																																	</tbody>
																																</table>
																																<table class="table small">
																																	<thead>
																																		<tr>
																																			<th>제품명</th>
																																			<th>총 중량(g)</th>
																																			<th>열량(kcal/1회분)</th>
																																			<th>단백질(g/1회분)</th>
																																			<th>포화지방(g/1회분)</th>
																																			<th>나트륨(mg/1회분)</th>
																																			<th>당류(g/1회분)</th>
																																		</tr>
																																	</thead>
																																	<tbody>
																																		<tr>
																																			<td>크리스피 핫 순살 치킨(8조각)</td>
																																			<td>127</td>
																																			<td>262</td>
																																			<td>25</td>
																																			<td>2</td>
																																			<td>966</td>
																																			<td>1</td>
																																		</tr>
																																		<tr>
																																			<td>한돈 빠에야</td>
																																			<td>344</td>
																																			<td>555</td>
																																			<td>21</td>
																																			<td>12</td>
																																			<td>1742</td>
																																			<td>13</td>
																																		</tr>
																																		<tr>
																																			<td>갈릭&허브윙스(8조각)</td>
																																			<td>315</td>
																																			<td>595</td>
																																			<td>47</td>
																																			<td>9</td>
																																			<td>964</td>
																																			<td>3</td>
																																		</tr>
																																		<tr>
																																			<td>샐러드 가든</td>
																																			<td>141</td>
																																			<td>525</td>
																																			<td>2</td>
																																			<td>0</td>
																																			<td>301</td>
																																			<td>5</td>
																																		</tr>
																																		<tr>
																																			<td>슈퍼곡물 치킨(10조각)</td>
																																			<td>178</td>
																																			<td>481</td>
																																			<td>36</td>
																																			<td>4</td>
																																			<td>1,025</td>
																																			<td>4</td>
																																		</tr>
																																		<tr>
																																			<td>트러플 리조또</td>
																																			<td>285</td>
																																			<td>650</td>
																																			<td>17</td>
																																			<td>26</td>
																																			<td>1,123</td>
																																			<td>8</td>
																																		</tr>
																																		<tr>
																																			<td>펜네 파스타</td>
																																			<td>366</td>
																																			<td>723</td>
																																			<td>25</td>
																																			<td>23</td>
																																			<td>1,270</td>
																																			<td>8</td>
																																		</tr>
																																		<tr>
																																			<td>프레시 코울슬로</td>
																																			<td>100</td>
																																			<td>133</td>
																																			<td>1</td>
																																			<td>4</td>
																																			<td>158</td>
																																			<td>9</td>
																																		</tr>
																																		<tr>
																																			<td>프레시 콘샐러드</td>
																																			<td>100</td>
																																			<td>135</td>
																																			<td>2</td>
																																			<td>4</td>
																																			<td>315</td>
																																			<td>11</td>
																																		</tr>
																																		<tr>
																																			<td>하프&하프 스파게티 (NEW 치즈 & 화이트 크림)</td>
																																			<td>395</td>
																																			<td>705</td>
																																			<td>28</td>
																																			<td>18</td>
																																			<td>1,347</td>
																																			<td>11</td>
																																		</tr>
																																		<tr>
																																			<td>화이트 크림 스파게티</td>
																																			<td>392</td>
																																			<td>851</td>
																																			<td>29</td>
																																			<td>29</td>
																																			<td>1,258</td>
																																			<td>9</td>
																																		</tr>
																																		<tr>
																																			<td>NEW 치즈 볼로네즈 스파게티</td>
																																			<td>399</td>
																																			<td>599</td>
																																			<td>27</td>
																																			<td>7</td>
																																			<td>1,444</td>
																																			<td>13</td>
																																		</tr>
																																	</tbody>
																																</table>
																															</div>
																														</div>
																													</div>
																												</div>
																											</div>
																										</div>
																									</div>
																									<!-- 베스트 상품 탭과 연관된 베스트 상품 컨텐츠 끝 -->
																								</div>
																								<!-- 탭 컨텐츠 끝 -->
																								
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
											        					</div>
												        					
												        			</div>
												        		</div>
												        	</div> <!-- (모달1 몸통)노랑1 끝 -->
												        
									        				<div class="d-flex justify-content-center">
									        					<button class="btn btn-danger btn-lg" onclick="pizzaDetail(event)" id="<%=pizza.getNo()%>">주문하러 가기</button>
									        				</div>												        
												        
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
														<div class="col-6" style="padding:5px"><strong class="text-danger float-left">L</strong><strong>　<%=NumberUtil.numberWithComma(pizza.getLprice()) %>원~</strong></div>
														<div class="col-6" style="padding:5px"><strong class="text-danger float-left">M</strong><strong>　<%=NumberUtil.numberWithComma(pizza.getMprice()) %>원~</strong></div>
													</div>
												</div>
												<!-- 가격정보 끝 -->
												<div class="mt-3 mb-n3">
												
													<span class="badge badge-success"><%=pizza.getRegDate() %> 출시!</span>
													<span class="badge badge-info">Best!</span>
													<%
														EventDao eventDao = new EventDao();
														Event event = eventDao.getEventByPizzaNo(pizza.getNo());
														
														if (event != null) {
													%>
													<a class="badge badge-danger" href="/domino/event/eventdetail.jsp?eventno=<%=event.getNo() %>"><%=event.getName() %></a>
													<%
														} else {
													%>
													<a class="badge badge-secondary" >이벤트 없음</a>
													<%
														}
													%>
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
				<br/>
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
								일부 리조트 및 특수매장은 상기 가격과 차이가 있으며 모든 사진은 이미지 컷이므로 실제 제품과 다를 수 있습니다.
							</small>
						</li>
					</ul>
					<br/>
				</div><!-- 초록2 끝 -->
			</div> <!-- 노랑1 끝 -->
			
			<div class="col-6 d-flex justify-content-center">
				<div>
					<br/>
					<br/>
					<div>
						<small>
							제품의 영양성분 및 알레르기 유발성분을 먼저 확인하세요.
						</small>
					</div>
					<br/>
					
					<div>
						<a type="button" data-toggle="modal" data-target="#modal-allergy"> 
							<img src="../resource/images/home/ingredient_plus.png">
						</a>
						<%@include file="../common/allergy.jsp" %>
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

		var url = 'detail.jsp?no=';
		
		var no = event.target.id;
		var form = document.querySelector("#my-form");
		
		form.setAttribute("action", url + no);
		form.submit();

	}
	
</script>
</body>
</html>