<%@page import="com.domino.dao.EtcDao"%>
<%@page import="com.domino.vo.Etc"%>
<%@page import="com.domino.vo.Topping"%>
<%@page import="com.domino.dao.ToppingDao"%>
<%@page import="com.domino.vo.Side"%>
<%@page import="com.domino.dao.SideDao"%>
<%@page import="com.domino.vo.Dough"%>
<%@page import="java.util.List"%>
<%@page import="com.domino.dao.DoughDao"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@page import="com.domino.vo.Pizza"%>
<%@page import="com.domino.dao.PizzaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	div.sticky {
  		position: -webkit-sticky; /* Safari */
  		position: sticky;
  		top: 0;
	}
</style>
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
	<style>
		br {
			padding-bottom : 10px;
		}
	</style>
</head>
<body>

	<%
		String position = "detail";
	
		int no = NumberUtil.stringToInt(request.getParameter("no"));
	%>
	
	<%@ include file="../common/navbar.jsp"%>
	<%
		if (session.getAttribute("savedLocationNo") == null) {
			response.sendRedirect("/domino/order/selectlocation.jsp?err=deny");
			return;
		}
	%>


<div class="container"> <!-- 빨강1 시작 -->
	<div> <!-- 주황1 시작-->
		<div class="header"> <!-- 노랑1 시작 -->
			<!-- 화면의 현재위치를 나타내는 부분 시작 -->
			<div class="row">
				<div class="col-4">
					<h4>메뉴</h4>
				</div>
				<%
					double discountRate = 0;
				    if (request.getParameter("discountrate") != null) {
						discountRate = NumberUtil.stringToDouble(request.getParameter("discountrate"));
				    }
					PizzaDao pizzaDao = new PizzaDao();
					Pizza pizza = pizzaDao.getPizzaByNo(no);
					List<Pizza> pizzas = pizzaDao.getAllPizza();
					
					DoughDao doughDao = new DoughDao();
					List<Dough> doughs = doughDao.getAllDough();
				%>
				<div class="col-8" style="padding: 0 0 0 0">
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
								href="#" tabindex="-1" aria-disabled="true"><%=pizza.getName()%>
							</a>
						</li>
					</ul>
					
				</div>
			</div>
		<div style="background-color: black; height: 2px;" class="mb-2"></div>
			<!-- 화면의 현재위치를 나타내는 부분 끝 -->
			
		</div> <!-- 노랑1 끝 -->
		
		<!-- 안쓰는 라인 주석 처리 -->
<%--
		<div> <!-- 노랑2 끝 -->
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
						<!-- 원래 계획 : 1주일간 가장 많이 팔린 피자 받아와서 출력, 해당하는 링크로 이동 -->
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
		</div> <!-- 노랑2 끝 -->
--%>
		<!-- 주석처리 끝 -->

	</div>	<!-- 주황1 끝-->
	
	<div> <!-- 주황2 시작 -->
		<div class="row"> <!-- 노랑1 시작 -->
			<div class="col-6 img-responsive "> <!-- 초록1 시작 -->
				<div class="sticky"> <!-- 파랑1 시작 -->
					<img src="<%=pizza.getImageSrc() %>" class="sticky mt-5" width="540px;"/>
					
					<script>/*
					<div class="float-right">
						<a><strong>자세히</strong></a>
						<a href="#"><img src="../resource/images/home/detailsee.png"></a>
					</div>
					*/</script>
					
				</div> <!-- 파랑1 끝 -->
				
				<div> <!-- 파랑2 시작 -->
					<ul>
						<li style=" list-style:none;">&emsp;</li>
						<!-- <li class="text-muted"><small>원산지 정보는 사진 우측하단 돋보기 메뉴를 통해 확인 가능합니다</small></li> 돋보기 삭제로 인한 주석 처리 -->
						<li class="text-muted"><small>모든 사진은 이미지컷으로 실제 제품과 다를 수 있습니다</small></li>
					</ul>
				</div> <!-- 파랑2 끝 -->
			</div> <!-- 초록1 끝 -->
	
			<div class="col-6"> <!-- 초록2 시작 --> <!-- offset으로 1만큼 왼쪽 마진 줌 -->
				<div> <!-- 파랑1 시작 -->
					<div> <!-- 하늘1 시작 -->
						<div class="mt-3 mb-n3">
							<span class="badge badge-primary"><%=pizza.getRegDate() %> 출시!</span>
							<span class="badge badge-success">Best!</span>
							<!-- <a class="badge badge-danger" href="#">해당 링크를 클릭하시면 이벤트 가격에!</a> -->
						</div>
					</div> <!-- 하늘1 끝 -->
					
					<br/>
					
					<div> <!-- 하늘2 시작 -->
						<div class="display-4"><p><small><%=pizza.getName() %></small></p></div>
					</div> <!-- 하늘2 끝 -->
					
					<div> <!-- 하늘3 시작 -->
						<div class="text-muted"><small>#<%=pizza.getName() %>는 진리다</small></div>
						<div class="text-muted"><small>#도미노의 자신작</small></div>
						<br/>
						<% // 얘네도 짧은 정보로 받아오는건가? %>
					</div> <!-- 하늘3 끝 -->
					
					<div> <!-- 하늘4 시작 -->
						<div class="text-center">
							<a class="btn btn-outline-secondary btn-lg text-secondary" type="button" data-toggle="modal" data-target="#modal-allergy">영양성분 및 알레르기 유발성분</a>
							<%@include file="../common/allergy.jsp" %>
							<br/>
							<br/>
							<br/>
						</div>
						<div style="background-color: black; height: 2px;" class="mb-2"></div>
					</div> <!-- 하늘4 끝 -->
				</div> <!-- 파랑1 끝 -->
				
				<br/>
				
				<div> <!-- 파랑2 시작 -->
					<form id="my-form" method="post" action=""> <!-- 주문 정보는 pizzaOrderDto로 보내야되는거같은데 -->
						<div class="form-group"> <!-- 하늘1 시작 -->
							<h4><strong>사이즈 선택</strong></h4>
							<div>
								<div class="row">
									<div class="col-6">
										<div class="custom-control custom-radio custom-control-inline float-left">
											<input type="radio" class="custom-control-input" name="size" id="L" value="<%=(pizza.getLprice() - (int)(pizza.getLprice() * discountRate)) %>" onchange="changePizzaInfoValue(); changePizza();" checked >
											<label class="custom-control-label" for="L"><strong class="text-danger">L</strong><strong>&emsp;<%=(int)(pizza.getLprice() - (pizza.getLprice() * discountRate)) %>원&emsp;&emsp;&emsp;&emsp;&emsp;</strong></label>
										</div>
									</div>
									<div class="col-6">
										<div class="custom-control custom-radio custom-control-inline float-left">
											<input type="radio" class="custom-control-input" name="size" id="M" value="<%=(pizza.getMprice() - (int)(pizza.getMprice() * discountRate)) %>" onchange="changePizzaInfoValue(); changePizza();">
											<label class="custom-control-label" for="M"><strong class="text-danger">M</strong><strong>&emsp;<%=(int)(pizza.getMprice() - (pizza.getMprice() * discountRate)) %>원&emsp;&emsp;&emsp;&emsp;</strong></label>
										</div>									
									</div>
								</div>
							</div>
							
						</div> <!-- 하늘1 끝 -->
						
						<br/>
						<div style="background-color: black; height: 2px;" class="mb-2"></div>
						<br/>
						
						<div class="form-group"> <!-- 하늘2 시작 -->
							<div><!-- float-left : 좌측정렬 , right는 우측정렬 -->
								<h4 class="float-left"><strong>도우 선택</strong></h4>
								<!-- 그냥 뺄까 -->
								<!-- <h5 class="float-right "><a href="#" class="text-warning"><small>ⓘ 도우의 특징</small></a></h5> -->
							</div>
							
							<div>
								<p>&emsp;</p> <!-- 생략하면 라디오버튼 배열 이상해짐 -->
								<%
									int i = 0;
									for (Dough dough : doughs) {
								%>
									<div class="custom-control custom-radio">
										<div class=row>
											<div class="col-6">
												<input type="radio" <%=i==0 ? "checked" : "" %> class="custom-control-input" name="dou" data-doughno="<%=dough.getNo() %>" id="<%=dough.getName() %>" value="<%=dough.getPrice() %>" onchange="changePizzaInfoValue(); changePizza();">
												<label class="custom-control-label" for="<%=dough.getName()%>"> <strong><%= dough.getName()%></strong></label>
											</div>
											<div class="col-6">
												<a class="float-right"> + <strong class="text-danger"><%=dough.getPrice()%></strong>원</a>
											</div>
										</div>
									</div>
								<%
										i++;
									}
								%>
							</div>
							
							<br/>
						</div> <!-- 하늘2 끝 -->
						
						<div style="background-color: black; height: 2px;" class="mb-2"></div>
						
						<div> <!-- 하늘3 시작 -->
							<br/>
							<h4 class="float-left"><strong>토핑추가</strong></h4>
							
							<!-- <h5 class="float-right"><a href="#" class="text-warning"><small>ⓘ 토핑 알레르기 유발성분</small></a></h5> -->
						</div> <!-- 하늘3 끝 -->
						
						<br/>
						<br/>
						
						<div> <!-- 하늘4 끝 -->
							<!-- <p class="text-danger"><small> * 토핑추가는 피자 한판 당 5개까지 추가 가능</small></p> -->
						</div> <!-- 하늘4 끝 -->
						
						<%
							ToppingDao toppingDao = new ToppingDao();
							List<Topping> mainToppings = toppingDao.getMainToppingList();
							List<Topping> cheezeToppings = toppingDao.getCheezeToppingList();
							List<Topping> afterToppings = toppingDao.getAfterToppingList();
						%>

						<div> <!-- 하늘5 시작 -->
							<ul class="nav nav-tabs nav-justified">
								<li class="nav-item"><a class="nav-link text-danger active" data-toggle="tab"  href="#topping1">메인</a></li>
								<li class="nav-item"><a class="nav-link text-danger" data-toggle="tab" href="#topping2">치즈</a></li>
								<li class="nav-item"><a class="nav-link text-danger" data-toggle="tab" href="#topping3">애프터</a></li>
							</ul>
							
							<div class="tab-content">
								<div class="tab-pane container active" id="topping1">
									<div class="row">
										<div class="col-sm-12">
											<ul class="" >
											<%
												for (Topping topping : mainToppings) {
											%>
												<li class="" style="list-style-type:none; float:left; padding:3px">
													<img src="<%=topping.getImageSrc()%>"/>
													<div>
														<div class="text-center" style="width:150px; height:25px" id="topping-no-1-<%=topping.getNo() %>"><%=topping.getName() %></div>
														<div class="text-center" style="width:150px; height:35px" ><strong class="text-danger" id="topping-price-1-<%=topping.getNo() %>"><%=topping.getPrice() %></strong>원</div>
														<div class="text-center"style="width:150px;">
															<!-- 버튼 -->
															<input  type="number" name="topping" class="w-60 text-right" 
																	id="topping-amount-1-<%=topping.getNo() %>" style="align:right" value="0" min="0" max="9" placeholder="최대 9" maxlength="1" oninput="numberMaxLength(this);"
																	data-tno="<%=topping.getNo() %>" 
																	data-tn="<%=topping.getName() %>" 
																	data-tp="<%=topping.getPrice() %>"
 																	onchange="changePizza(event)" >
														</div>
													</div>
												</li>
											<%
												}
											%>
											</ul>
										</div>
									</div>
								</div> <!-- topping1 끝 -->

								<div class="tab-pane container fade" id="topping2">
									<div class="row">
										<div class="col-sm-12">
											<ul class="" >
											<%
												for (Topping topping : cheezeToppings) {
											%>
												<li class="" style="list-style-type:none; float:left; padding:3px">
													<img src="<%=topping.getImageSrc()%>"/>
													<div>
														<div class="text-center" style="width:150px; height:25px" id="topping-no-2-<%=topping.getNo() %>"><%=topping.getName() %></div>
														<div class="text-center" style="width:150px; height:35px" ><strong class="text-danger" id="topping-price-2-<%=topping.getNo() %>"><%=topping.getPrice() %></strong>원</div>
														<div class="text-center" style="width:150px;">
															<!-- 버튼 -->
															<input  type="number" name="topping" class="w-60 text-right" 
																	id="topping-amount-2-<%=topping.getNo() %>" style="align:right" value="0" min="0" max="9" placeholder="최대 9" maxlength="1" oninput="numberMaxLength(this);"
																	data-tno="<%=topping.getNo() %>" 
																	data-tn="<%=topping.getName() %>" 
																	data-tp="<%=topping.getPrice() %>"
 																	onchange="changePizza(event)" >
														</div>
													</div>
												</li>
											<%
												}
											%>
											</ul>
										</div>
									</div>
								</div> <!-- topping2 끝 -->

								<div class="tab-pane container fade" id="topping3">
									<div class="row">
										<div class="col-sm-12">
											<ul class="" >
											<%
												for (Topping topping : afterToppings) {
											%>
												<li class="" style="list-style-type:none; float:left; padding:3px">
													<img src="<%=topping.getImageSrc()%>"/>
													<div>
														<div class="text-center" style="width:150px; height:25px" id="topping-no-3-<%=topping.getNo() %>"><%=topping.getName() %></div>
														<div class="text-center" style="width:150px; height:35px" ><strong class="text-danger" id="topping-price-2-<%=topping.getNo() %>"><%=topping.getPrice() %></strong>원</div>
														<div class="text-center"style="width:150px;">
															<!-- 버튼 -->
															<input  type="number" name="topping" class="w-60 text-right" 
																	id="topping-amount-3-<%=topping.getNo() %>" style="align:right" value="0" min="0" max="9" placeholder="최대 9" maxlength="1" oninput="numberMaxLength(this);"
																	data-tno="<%=topping.getNo() %>" 
																	data-tn="<%=topping.getName() %>" 
																	data-tp="<%=topping.getPrice() %>"
 																	onchange="changePizza(event)" >
														</div>
													</div>
												</li>
											<%
												}
											%>
											</ul>
										</div>
									</div>
								</div> <!-- topping3 끝 -->
							</div> <!-- tap content 끝? -->
							
							<br/>
							<br/>
							<div style="background-color: black; height: 2px;" class="mb-2"></div>
							
						</div> <!-- 하늘5 끝 (topping 끝)-->
						
						<div> <!-- 하늘6 시작 -->
							<br/>
							<h4 class="float-left"><strong>수량선택</strong></h4>
							<br/>
							<br/>
							<input  type="number" name="" class="w-100 text-center" 
									style="align:right" value="1" min="1" max="999" placeholder="최대 999" maxlength="3" oninput="numberMaxLength(this);" id="pizza-order-amount"
									onchange="changePizzaInfoValue(); changePizza();">
							<br/>
							<br/>
							<br/>
						</div> <!-- 하늘6 끝 -->
						
						<div style="background-color: black; height: 2px;" class="mb-2"></div>
					
						<%
							SideDao sideDao = new SideDao();
							List<Side> sides = sideDao.getAllSide();
						%>
					
						<div> <!-- 하늘7 시작 -->
							<div> <!-- 보라1 시작 -->
								<br/>
								<h4 class="float-left"><strong>사이드디시</strong></h4>
								<br/>
								<br/>
							</div> <!-- 보라2 시작 -->
							
							<div> <!-- 하늘8 시작 -->
								<div> <!-- 보라1 시작 -->
									<div>
										<div class="row">
											<div class="col-sm-12">
												<ul class="" >
													<%
														for (Side side : sides) {
													%>
													<li class="" style="list-style-type:none; float:left; padding:3px">
														<img src="<%=side.getImageSrc()%>" style="width:150px"/>
														<div>
															<div class="text-center" style="width:150px; height:25px" id="side-no-<%=side.getNo() %>"><%=side.getName() %></div>
															<div class="text-center" style="width:150px; height:35px" ><strong class="text-danger" id="side-price-<%=side.getNo() %>"><%=side.getPrice() %></strong>원</div>
															<div class="text-center" style="width:150px;">
																	<!-- 버튼 -->
																	<input  type="number" name="side" class="w-60 text-right" 
																			id="side-amount-<%=side.getNo() %>" style="align:right" value="0" min="0" max="999" placeholder="최대 999" maxlength="3" oninput="numberMaxLength(this);"
																			data-sno="<%=side.getNo() %>" 
																			data-sn="<%=side.getName() %>" 
																			data-sp="<%=side.getPrice() %>"
																			onchange="changeSide(event)" >
															</div>
														</div>
													</li>
													<%
														}
													%>
												</ul>													
											</div>
										</div>
									</div>
								</div> <!-- 보라1 끝 -->
							</div> <!-- 하늘8 끝 -->
							<br/>
							<br/>
							<div style="background-color: black; height: 2px;" class="mb-2"></div>
							<br/>
							
						</div> <!-- 하늘7 끝 -->				
						
						<%
							EtcDao ectDao = new EtcDao();
							List<Etc> etcs = ectDao.getAllEtc();
						%>

						<div> <!-- 하늘8 시작 -->
							<div> <!-- 보라1 시작 -->
								<h4 class="float-left"><strong>음료 & 기타</strong></h4>
							</div> <!-- 보라2 시작 -->
							
							<br/>
							<br/>

							<div> <!-- 보라2 시작 -->
								<div> <!-- 분홍1 시작 -->							
									<div class="row">
										<div class="col-sm-12">
											<ul>
												<%
													for (Etc etc : etcs) {
												%>
												<li class="" style="list-style-type:none; float:left; padding:3px">
													<img src="<%=etc.getImageSrc()%>" style="width:150px"/>
													<div>
														<div class="text-center" style="width:150px; height:25px" id="etc-no-<%=etc.getNo() %>"><%=etc.getName() %></div>
														<div class="text-center" style="width:150px; height:35px" ><strong class="text-danger" id="etc-price-<%=etc.getNo() %>"><%=etc.getPrice() %></strong>원</div>
														<div class="text-center" style="width:150px;" >
															<!-- 버튼 -->
															<input  type="number" name="etc" class="w-60 text-right" 
																	id="etc-amount-<%=etc.getNo() %>" style="align:right" value="0" min="0" max="999" placeholder="최대 999" maxlength="3" oninput="numberMaxLength(this);"
																	data-eno="<%=etc.getNo() %>"
																	data-en="<%=etc.getName() %>"
																	data-ep="<%=etc.getPrice() %>"
																	onchange="changeEtc(event)" >
														</div>																														
													</div>
												</li>
												<%
													}
												%>
											</ul>													
										</div>
									</div>
								</div> <!-- 분홍1 끝 -->
							</div> <!-- 보라2 끝 -->
						</div> <!-- 하늘8 끝 -->
					</form>
					
					<div class="fixed-bottom row bg-light"> <!-- 하단 가격 고정 -->
						<div class="col-12">
							<form method="POST" action="register.jsp">
								<table class="table" >
									<colgroup>
										<col width="27%">
										<col width="27%">
										<col width="27%">
										<col width="19%">
									</colgroup>
									<thead>
										<tr class="text-center">
											<th>피자</th>
											<th>사이드디시</th>
											<th>음료 & 기타</th>
											<th>총 금액</th>
										</tr>
									</thead>
									<%
										String defaultPizzaInfo = "" + pizza.getNo()
																+ "+" + "L" + "+" + "100" + "+" + "0" + "+" + "1"
																+ "+" + pizza.getLprice() + "+"
																+ (int) (pizza.getLprice() * (1-discountRate));
									%>
									
									<!-- 피자는 보내진 거 하나만이니까 no -->
									<tbody>
										<tr id="pizza-receive-info" class="text-center">
											<td class="text">
												<a><small id="pizza-receive-name" data-pizzano="<%=pizza.getNo() %>"><%=pizza.getName()%></small> <small>x</small> <small id="pizza-receive-count">1</small></a>
												<br/>
												<p>
													<small class="text-secondary" id="pizza-receive-dou" > 기본 </small>
													<small class="text-secondary"> / </small>
													<small class="text-secondary" id="pizza-receive-size" >L</small>
													<input name="pizzainfo" type="hidden" value="<%=defaultPizzaInfo %>" >
												</p>
												
												<p id="topping-receive-kinds">
													<small></small>
												</p>
											</td>


											<!-- 사이드 제한 없음 -->
											<!-- 사이드 메뉴 클릭 시 추가됨 -->
											<td class="text" id="ordered-side">
												<p id="side-receive-kinds">
													<small></small> 
												</p>
											</td>
			
											<!-- 기타 메뉴 클릭 시 추가됨 -->
											<td class="text" id="ordered-etc">
												<p id="etc-receive-kinds">
													<small></small>
												</p>
											</td>

											<td class="text">
												<!-- 피자 -->	<input type="hidden" id="pizza-total-order-price" value="<%=(int)(pizza.getLprice() - (pizza.getLprice() * discountRate)) %>"  min="0">
												<!-- 사이드 -->	<input type="hidden" id="side-order-price" value="0" min="0">
												<!-- 기타 -->	<input type="hidden" id="etc-order-price" value="0" min="0">
												<p><strong id="order-price" ><%=NumberUtil.numberWithComma((int)(pizza.getLprice() - (pizza.getLprice() * discountRate)))%></strong>원</p>
												<button class="btn btn-primary btn-lg" type="submit">주문하기</button>
											</td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
					</div> <!-- 하단 가격 고정 끝 -->
					
				</div> <!-- 파랑2 끝 -->

					
			</div> <!-- 초록2 끝 -->
		</div> <!-- 노랑1 끝 -->
	</div> <!-- 주황2 끝 -->
</div> <!-- 빨강1 끝 -->
<%@ include file="../common/footer.jsp" %>

<script type="text/javascript">
	
// 숫자를 가격텍스트로 변환한다. (1300000 ---> "1,300,000")
	function numberToCurrency(number) {
		return new Number(number).toLocaleString();
	}

// 가격텍스트를 숫자로 변환한다.("1,300,000" ---> 1300000)
	function currencyToNumber(currency) {
		return parseInt(currency.replace(/,/g, ''));
	}
	
	function strToNumber(str) {
		try {
			return parseInt(str);
		} catch (e) {
			return 0;
		}
	}
	
	// 피자, 도우, 토핑이 변경될 때 마다 실행되는 함수다.
	function changePizza(event) {
		// 주문수량을 조회한다.
		var amount = document.getElementById("pizza-order-amount").value;

		// 피자와 도우의 가격을 조회하고, 선택된 수량을 곱해서 각각의 가격을 계산한다.
		var pizzaOrderPrice = document.querySelector("input[name=size]:checked").value * amount;
		var doughOrderPrice = document.querySelector("input[name=dou]:checked").value * amount;

		// 모든 토핑의 가격을 계산한다.
		var priceList = document.querySelectorAll("[id^=topping-price]");
		var amountList = document.querySelectorAll("[id^=topping-amount]");
		var toppingOrderPrice = 0;
		for (var i=0; i<priceList.length; i++) {
			var toppingPrice = parseInt(priceList[i].textContent);
			var toppingAmount = parseInt(amountList[i].value);
			
			toppingOrderPrice += toppingPrice*toppingAmount;
		}
		// 계산된 모든 토핑의 가격에 주문수량을 곱해서 총 토핑가격을 계산한다.		
		toppingOrderPrice = toppingOrderPrice*amount;
		
		// 피자, 도우, 토핑에 대한 가격을 모두 더해서 히든 필드에 저장한다.
		document.getElementById("pizza-total-order-price").value = pizzaOrderPrice + doughOrderPrice + toppingOrderPrice;
		
		// 총구매가격을 갱신시킨다.
		refreshTotalOrderPrice();

		var sizeName = document.querySelector("input[name=size]:checked").id;
		var douName = document.querySelector("input[name=dou]:checked").id;
		var amountName = document.getElementById("pizza-order-amount").value;
				
		document.getElementById("pizza-receive-size").textContent = sizeName;
		document.getElementById("pizza-receive-dou").textContent = douName;
		document.getElementById("pizza-receive-count").textContent = amountName;
		
		writeToppingSmallTag(event);
	}
	
	function changePizzaInfoValue() {
		var pizzaNo = <%=pizza.getNo() %>;
		var pizzaSize = document.querySelector("input[name=size]:checked").id;
		var doughNo = document.querySelector("input[name=dou]:checked").dataset.doughno
		var doughPrice = document.querySelector("input[name=dou]:checked").value;
		var pizzaAmount = document.getElementById("pizza-order-amount").value;
		var pizzaDcPrice = document.querySelector("input[name=size]:checked").value;
		var pizzaPrice;
		if ("M"==pizzaSize) {
			pizzaPrice = <%=pizza.getMprice() %>;
		} else {
			pizzaPrice = <%=pizza.getLprice() %>;
		}
		
		if(pizzaAmount <= 0) {
			alert("피자는 한 판 이상 주문하셔야 합니다.");
			document.querySelector("#pizza-order-amount").value = 1;
			return;
		}
		
		var pizzaInfoValue = pizzaNo + "+" + pizzaSize + "+" + doughNo + "+" + doughPrice + "+" + pizzaAmount + "+" + pizzaPrice + "+" + pizzaDcPrice;
		document.querySelector("input[name=pizzainfo]").value = pizzaInfoValue;
	}
	
	function writeToppingSmallTag(event) {
		var smallTag = document.createElement("SMALL");
		smallTag.setAttribute("class", "text-muted");
		
		var toppingNo = event.target.dataset.tno;
		var toppingName = event.target.dataset.tn;
		var toppingPrice = event.target.dataset.tp;
		var toppingAmount = event.target.value;
		
		smallTag.setAttribute("id", toppingName);

		var textValue = toppingName + " / " + toppingAmount;
		smallTag.textContent = textValue;
		var textTarget = document.querySelector("#topping-receive-kinds");
		
		var existingTags = document.querySelectorAll("#topping-receive-kinds small");
		var found = false;
		for (var i = 0; i<existingTags.length; i++) {
			if (existingTags[i].id == toppingName) {
				if(toppingAmount == 0) {
					existingTags[i].nextElementSibling.nextElementSibling.remove();
					existingTags[i].nextElementSibling.remove();
					existingTags[i].remove();
				}
				existingTags[i].textContent = textValue;
				existingTags[i].nextElementSibling.value = toppingNo + "+" + toppingAmount + "+" + toppingPrice;
				found = true;
			}
		}
		
		if (!found) {
			var hiddenInput = document.createElement("input");
			hiddenInput.setAttribute("type", "hidden");
			hiddenInput.setAttribute("name", "toppinginfo");
			hiddenInput.value = toppingNo + "+" + toppingAmount + "+" + toppingPrice;

			textTarget.appendChild(smallTag);
			textTarget.appendChild(hiddenInput);
			textTarget.appendChild(document.createElement("BR"));
			
		}
	}	
	
	// 사이드 메뉴의 수량이 변경될 때 마다 실행되는 함수다.
	function changeSide(event) {
		// 모든 사이드 메뉴의 가격을 계산한다.
		var priceList = document.querySelectorAll("[id^=side-price]");
		var amountList = document.querySelectorAll("[id^=side-amount]");
		
		var orderPrice = 0;
		for (var i=0; i<priceList.length; i++) {
			var price = parseInt(priceList[i].textContent);
			var amount = parseInt(amountList[i].value);
			
			orderPrice += price*amount;
		}
		// 계산된 총 사이드메뉴 가격을 히든 필드에 저장한다.
		document.getElementById("side-order-price").value = orderPrice;
		
		// 총구매가격을 갱신시킨다.
		refreshTotalOrderPrice();
	
		writeSideSmallTag(event);
	}
	
	function writeSideSmallTag(event) {
		var smallTag = document.createElement("SMALL");
		
		var sideNo = event.target.dataset.sno;
		var sideName = event.target.dataset.sn;
		var sidePrice = event.target.dataset.sp;
		var sideAmount = event.target.value;
		
		smallTag.setAttribute("id", sideName);

		var textValue = sideName + " / " + sideAmount;
		smallTag.textContent = textValue;
		var textTarget = document.querySelector("#side-receive-kinds");
		
		var existingTags = document.querySelectorAll("#side-receive-kinds small");
		var found = false;
		for (var i = 0; i<existingTags.length; i++) {
			if (existingTags[i].id == sideName) {
				if(sideAmount == 0) {
					existingTags[i].nextElementSibling.nextElementSibling.remove();
					existingTags[i].nextElementSibling.remove();
					existingTags[i].remove();
				}
				existingTags[i].textContent = textValue;
				existingTags[i].nextElementSibling.value = sideNo+"+"+sideAmount+"+"+sidePrice;
				found = true;
			}
		}
		
		if (!found) {
			var hiddenInput = document.createElement("input");
			hiddenInput.setAttribute("type", "hidden");
			hiddenInput.setAttribute("name", "sideinfo");
			hiddenInput.value = sideNo+"+"+sideAmount+"+"+sidePrice;

			textTarget.appendChild(smallTag);
			textTarget.appendChild(hiddenInput);
			textTarget.appendChild(document.createElement("BR"));
			
		}
	}
	
	// 기타 메뉴의 수량이 변경될 때마다 실행되는 함수다.
	function changeEtc(event) {
		// 모든 기타 메뉴의 가격을 계산한다.
		var priceList = document.querySelectorAll("[id^=etc-price]");
		var amountList = document.querySelectorAll("[id^=etc-amount]");
		
		var orderPrice = 0;
		for (var i=0; i<priceList.length; i++) {
			var price = parseInt(priceList[i].textContent);
			var amount = parseInt(amountList[i].value);
			
			orderPrice += price*amount;
		}
		// 계산된 총 기타메뉴 가격을 히든 필드에 저장한다.
		document.getElementById("etc-order-price").value = orderPrice;
		
		// 총구매가격을 갱신시킨다.
		refreshTotalOrderPrice();
		
		writeEtcSmallTag(event);
	}
	
	function writeEtcSmallTag(event) {
		
		// 엘리먼트 태그 생성 (small 태그)
		var smallTag = document.createElement("SMALL");
		
		// 이벤트를 사용해서 각 id값을 가져오고, 각각의 변수 생성
		var etcNo = event.target.dataset.eno;
		var etcName = event.target.dataset.en;
		var etcPrice = event.target.dataset.ep;
		var etcAmount = event.target.value;
		
		// small 태그에 키와 값을 셋팅
		smallTag.setAttribute("id", etcName);
		
		// 이름/수량 을 담는 변수 생성
		var textValue = etcName + " / " + etcAmount;
		
		// 이름/수량을 small 태그의 내용에 작성
		smallTag.textContent = textValue;
		
		// etc-receive-kinds라는 아이디를 가진 태그를 가져와 textTarget 변수로 생성
		var textTarget = document.querySelector("#etc-receive-kinds");
		
		// etc-receive-kinds 아이디 안의 small 태그를 전부 가져와 existingTags라는 변수에 대입
		var existingTags = document.querySelectorAll("#etc-receive-kinds small");
		
		// 참/거짓 판별하는 변수 생성
		var found = false;
		
		// small 태그 수 만큼 for문 수행
		for (var i = 0; i<existingTags.length; i++) {
			if (existingTags[i].id == etcName) {	// 셋팅된 i번째 small태그 id와 지금 클릭된 etc 이름이 같은 경우
				if (etcAmount == 0) {
					existingTags[i].nextElementSibling.nextElementSibling.remove();
					existingTags[i].nextElementSibling.remove();
					existingTags[i].remove();
				} else {
					existingTags[i].textContent = textValue; // 이름/양을 가진 textValue 변수를 small태그의 내용으로 갱신
					// 이름/양을 가진 i번째 small태그의 다음 태그 value를 번호+양+가격 으로 갱신
					existingTags[i].nextElementSibling.value = etcNo + "+" + etcAmount + "+" + etcPrice; 
				}
				// 다음 if를 수행하지 않도록 셋팅
				found = true;
			}
		}
		
		// 위의 if문이 수행되지 않았을 경우 실행됨
		if (!found) {
			// input 태그를 생성해서 hiddenInput 변수에 삽입
			var hiddenInput = document.createElement("input");
			
			// 숨겨진 hidden 태그에 키,값을 셋팅함
			hiddenInput.setAttribute("type", "hidden");
			// 숨겨진 hidden 태그에 키, 값을 셋팅함
			hiddenInput.setAttribute("name", "etcinfo");
			
			// 숨겨진 hidden 태그의 값을 번호+양+가격 으로 셋팅
			hiddenInput.value = etcNo + "+" + etcAmount + "+" + etcPrice;
			
			// 이름/양을 가진 태그의 뒤에 br 태그를 생성해서 붙임
			// 이름/양을 가진 태그의 뒤에 small 태그를 생성해서 붙임
			textTarget.appendChild(smallTag);
			// 이름/양을 가진 태그의 뒤에  셋팅한 hidden 태그를 붙임
			textTarget.appendChild(hiddenInput);
			textTarget.appendChild(document.createElement("BR"));
			
		}
	}
	
	// 총구매가격을 갱신한다.
	function refreshTotalOrderPrice() {
		var pizzaPrice = document.getElementById("pizza-total-order-price").value;
		var sidePrice = document.getElementById("side-order-price").value;
		var etcPrice = document.getElementById("etc-order-price").value;
		
		document.getElementById("order-price").textContent = numberToCurrency(parseInt(pizzaPrice) + parseInt(sidePrice) + parseInt(etcPrice));
	}
	
	function numberMaxLength(e){
        if(e.value.length > e.maxLength){
            e.value = e.value.slice(0, e.maxLength);
        }
    }
	
</script>

</body>
</html>