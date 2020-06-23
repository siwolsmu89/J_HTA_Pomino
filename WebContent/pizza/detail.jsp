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
	
		int no = NumberUtil.stringToInt(request.getParameter("no"));
	%>
	
	<%@ include file="../common/navbar.jsp"%>



<div class="container"> <!-- 빨강1 시작 -->
	<div> <!-- 주황1 시작-->
		<div class="header"> <!-- 노랑1 시작 -->
			<!-- 화면의 현재위치를 나타내는 부분 시작 -->
			<div class="row">
				<div class="col-4">
					<h4>메뉴</h4>
				</div>
	
				<%
					double discountRate = NumberUtil.stringToDouble("discountrate");
					PizzaDao pizzaDao = new PizzaDao();
					Pizza pizza = pizzaDao.getPizzaByNo(no);
					List<Pizza> pizzas = pizzaDao.getAllPizza();
					
					DoughDao doughDao = new DoughDao();
					List<Dough> doughs = doughDao.getAllDough();
				%>
		
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
								href="#" tabindex="-1" aria-disabled="true"><%=pizza.getName()%>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- 화면의 현재위치를 나타내는 부분 끝 -->
		</div> <!-- 노랑1 끝 -->
			
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
	</div>	<!-- 주황1 끝-->
	
	<div> <!-- 주황2 시작 -->
		<div class="row"> <!-- 노랑1 시작 -->
			<div class="col-6 img-responsive "> <!-- 초록1 시작 -->
				<div class="float-left" > <!-- 파랑1 시작 -->
					<img src="<%=pizza.getImageSrc() %>" class="img-fluid"/>
					<div class="float-right">
						<a><strong>자세히</strong></a>
						<a href="#"><img src="../resource/images/home/detailsee.png"></a>
					</div>
				</div> <!-- 파랑1 끝 -->
					
				<div> <!-- 파랑2 시작 -->
					<ul>
						<li class="text-muted"><small>모든 사진은 이미지컷으로 실제 제품과 다를 수 있습니다</small></li>
						<li class="text-muted"><small>원산지 정보는 사진 우측하단 돋보기 메뉴를 통해 확인 가능합니다</small></li>
					</ul>
				</div> <!-- 파랑2 끝 -->
			</div> <!-- 초록1 끝 -->
	
			<div class="col-6"> <!-- 초록2 시작 --> <!-- offset으로 1만큼 왼쪽 마진 줌 -->
				<div> <!-- 파랑1 시작 -->
					<div> <!-- 하늘1 시작 -->
						<div class="mt-3 mb-n3">
							<span class="badge badge-primary"><%=pizza.getRegDate() %> 출시!</span>
							<span class="badge badge-success">Best!</span>
							<a class="badge badge-danger" href="#">해당 링크를 클릭하시면 이벤트 가격에!</a>
						</div>
					</div> <!-- 하늘1 끝 -->
					
					<span>　</span>
					
					<div> <!-- 하늘2 시작 -->
						<div class="display-4"><p><small><%=pizza.getName() %></small></p></div>
					</div> <!-- 하늘2 끝 -->
					
					<div> <!-- 하늘3 시작 -->
						<div class="text-muted"><small>#<%=pizza.getName() %>는 진리다</small></div>
						<div class="text-muted"><small>#도미노의 자신작</small></div>
						<p>　</p>
						<% // 얘네도 짧은 정보로 받아오는건가? %>
					</div> <!-- 하늘3 끝 -->
					
					<div> <!-- 하늘4 시작 -->
						<div class="text-center" style="border-bottom: 3px solid black; padding-bottom : 20px">
							<a href="#" class="btn btn-outline-secondary btn-lg" role="button">영양성분 및 알레르기 유발성분</a>
							<br style="padding-bottom : 10px"/>
							<br style="padding-bottom : 10px"/>
						</div>
					</div> <!-- 하늘4 끝 -->
				</div> <!-- 파랑1 끝 -->
				
				<br style="padding-bottom : 10px"/>
				<br style="padding-bottom : 10px"/>
				
				<div> <!-- 파랑2 시작 -->
					<form id="my-form" method="post" action="../order/cart.jsp"> <!-- 주문 정보는 pizzaOrderDto로 보내야되는거같은데 -->
						<div class="form-group" style="border-bottom: 3px solid black; padding-bottom : 20px"> <!-- 하늘1 시작 -->
							<h4><strong>사이즈 선택</strong></h4>
							<%
								discountRate = 0.1;	// 더미데이터
								
							%>
							
							
							<div class="checks">
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" class="custom-control-input" name="size" id="size-L" value="<%=(int)(pizza.getLprice() - (pizza.getLprice() * discountRate)) %>" onchange="changePizza()" checked >
									<label class="custom-control-label" for="size-L"><strong class="text-danger">L</strong><strong>　<%=(int)(pizza.getLprice() - (pizza.getLprice() * discountRate)) %>원</strong></label>
								</div>
								
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" class="custom-control-input" name="size" id="size-M" value="<%=(int)(pizza.getMprice() - (pizza.getMprice() * discountRate)) %>" onchange="changePizza()">
									<label class="custom-control-label" for="size-M"><strong class="text-danger">M</strong><strong>　<%=(int)(pizza.getMprice() - (pizza.getMprice() * discountRate)) %>원</strong></label>
								</div>									
							</div>
							
							<br style="padding-bottom : 10px"/>
							<br style="padding-bottom : 10px"/>
						</div> <!-- 하늘1 끝 -->

						<div class="form-group" style="border-bottom: 3px solid black; padding-bottom : 20px"> <!-- 하늘2 시작 -->
							<div><!-- float-left : 좌측정렬 , right는 우측정렬 -->
								<h4 class="float-left"><strong>도우 선택</strong></h4>
								<!-- 그냥 뺄까 -->
								<h5 class="float-right "><a href="#" class="text-warning"><small>ⓘ 도우의 특징</small></a></h5>
							</div>
							
							<div class="checks">
							<p>　</p> <!-- 생략하면 라디오버튼 배열 이상해짐 -->
							<%
								int i = 0;
								for (Dough dough : doughs) {
							%>
								<div class="custom-control custom-radio checks">
									
									<input type="radio" <%=i==0 ? "checked" : "" %> class="custom-control-input" name="dou" id="dou<%=dough.getNo() %>" value="<%=dough.getPrice() %>" onchange="changePizza()">
									<label class="custom-control-label" for="dou<%=dough.getNo()%>"><strong><%= dough.getName()%></strong>
										+ <strong class="text-danger"><%=dough.getPrice()%></strong>원 
									</label>
								</div>
							<%
									i++;
								}
								
							%>
							</div>
							<br style="padding-bottom : 10px"/>
							<br style="padding-bottom : 10px"/>
						</div> <!-- 하늘2 끝 -->

						<div > <!-- 하늘3 시작 -->
							<h4 class="float-left"><strong>토핑추가</strong></h4>
							<h5 class="float-right"><a href="#" class="text-warning"><small>ⓘ 토핑 알레르기 유발성분</small></a></h5>
						</div> <!-- 하늘3 끝 -->
						
						<div> <!-- 하늘4 끝 -->
							<br style="padding-bottom : 10px"/>
							<br style="padding-bottom : 10px"/>
							<p class="text-danger"><small> * 토핑추가는 피자 한판 당 5개까지 추가 가능</small></p>
						</div> <!-- 하늘4 끝 -->
						
						<%
							ToppingDao toppingDao = new ToppingDao();
							List<Topping> mainToppings = toppingDao.getMainToppingList();
							List<Topping> cheezeToppings = toppingDao.getCheezeToppingList();
							List<Topping> afterToppings = toppingDao.getAfterToppingList();
						%>

						<div style="border-bottom: 3px solid black; padding-bottom : 20px"> <!-- 하늘5 시작 -->
							<ul class="nav nav-tabs ">
								<li class="nav-item"><a class="nav-link active" data-toggle="tab"  href="#topping1">메인</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#topping2">치즈</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#topping3">애프터</a></li>
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
														<div class="text-center" style="width:150px" id="topping-no-1-<%=topping.getNo() %>"><%=topping.getName() %></div>
														<div class="text-center" style="width:150px" ><strong id="topping-price-1-<%=topping.getNo() %>"><%=topping.getPrice() %></strong></div>
														<div style="width:100px; float:right">
															<!-- 버튼 -->
															<input  type="number" name="topping" class="w-50 text-right" 
																	id="topping-amount-1-<%=topping.getNo() %>" style="align:right" value="0" min="0" max="5"
 																	onchange="changePizza()" >
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
														<div class="text-center" style="width:150px" id="topping-no-2-<%=topping.getNo() %>"><%=topping.getName() %></div>
														<div class="text-center" style="width:150px" ><strong  id="topping-price-2-<%=topping.getNo() %>"><%=topping.getPrice() %></strong></div>
														<div style="width:100px; float:right">
															<!-- 버튼 -->
															<input  type="number" name="topping" class="w-50 text-right" 
																	id="topping-amount-2-<%=topping.getNo() %>" style="align:right" value="0" min="0" max="5"
																	onchange="changePizza()" >
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
														<div class="text-center" style="width:150px" id="topping-no-3-<%=topping.getNo() %>"><%=topping.getName() %></div>
														<div class="text-center" style="width:150px" ><strong  id="topping-price-3-<%=topping.getNo() %>"><%=topping.getPrice() %></strong></p></div>
														<div style="width:100px; float:right">
															<!-- 버튼 -->
															<input  type="number" name="topping" class="w-50 text-right" 
																	id="topping-amount-3-<%=topping.getNo() %>" style="align:right" value="0" min="0" 
																	onchange="changePizza()" >
														
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
			
							</div>
							<br style="padding-bottom : 10px"/>
							<br style="padding-bottom : 10px"/>
						</div> <!-- 하늘5 끝 -->
	
						<!-- for문 -->
						
						<div style="border-bottom: 3px solid black; padding-bottom : 20px"> <!-- 하늘6 끝 -->
							<br style="padding-bottom : 10px"/>
							<h4 class="float-left"><strong>수량선택</strong></h4>
							<br style="padding-bottom : 10px"/>
							<input  type="number" name="" class="w-100 text-right" 
									style="align:right" value="1" min="1" id="pizza-order-amount"
									onchange="changePizza()">
						</div> <!-- 하늘6 끝 -->

						<br style="padding-bottom : 10px"/>
					
						<%
							SideDao sideDao = new SideDao();
							List<Side> sides = sideDao.getAllSide();
						%>
					
						<div> <!-- 하늘7 시작 -->
							<div> <!-- 보라1 시작 -->
								<h4 class="float-left"><strong>사이드디시</strong></h4>
								
								<br style="padding-bottom : 10px"/>
								<br style="padding-bottom : 10px"/>
							
							</div> <!-- 보라2 시작 -->
							
							<div style="border-bottom: 3px solid black; padding-bottom : 20px"> <!-- 하늘8 시작 -->
								<div> <!-- 보라1 시작 -->
									<div class="" >
										<div class="" >
											<div class="row">
												<div class="col-sm-12">
													<ul class="" >
														<%
															for (Side side : sides) {
														%>
														<li class="" style="list-style-type:none; float:left; padding:3px">
															<img src="<%=side.getImageSrc()%>"/>
															<div>
																<div class="text-center" style="width:150px" id="side-no-<%=side.getNo() %>"><%=side.getName() %></div>
																<div class="text-center" style="width:150px" ><strong  id="side-price-<%=side.getNo() %>"><%=side.getPrice() %></strong></div>
																<div style="width:100px; float:right">
																	<!-- 버튼 -->
																	<input  type="number" name="topping" class="w-50 text-right" 
																			id="side-amount-<%=side.getNo() %>" style="align:right" value="0" min="0" 
																			onchange="changeSide()" >
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
									</div>
								</div> <!-- 보라1 끝 -->
							</div> <!-- 하늘8 끝 -->
						</div> <!-- 하늘7 끝 -->				
								
						<br style="padding-bottom : 10px"/>
						
						<%
							EtcDao ectDao = new EtcDao();
							List<Etc> etcs = ectDao.getAllEtc();
						%>

						<div> <!-- 하늘9 시작 -->
							<div> <!-- 보라1 시작 -->
								<h4 class="float-left"><strong>음료&기타</strong></h4>
								
								<br style="padding-bottom : 10px"/>
								<br style="padding-bottom : 10px"/>

							</div> <!-- 보라2 시작 -->
							
							<div> <!-- 하늘8 시작 -->
								<div> <!-- 보라1 시작 -->
									<div class="" >
										<div class="" >
										
											<div class="row">
												<div class="col-sm-12">
													<ul class="" >
														<%
															for (Etc etc : etcs) {
														%>
														<li class="" style="list-style-type:none; float:left; padding:3px">
															<img src="<%=etc.getImageSrc()%>"/>
															<div>
																<div class="text-center" style="width:150px" id="etc-no-<%=etc.getNo() %>"><%=etc.getName() %></div>
																<div class="text-center" style="width:150px" ><strong id="etc-price-<%=etc.getNo() %>"><%=etc.getPrice() %></strong></div>
																<div style="width:100px; float:right">
																	<!-- 버튼 -->
																	<input  type="number" name="topping" class="w-50 text-right" 
																			id="etc-amount-<%=etc.getNo() %>" style="align:right" value="0" min="0" 
																			onchange="changeEtc()" >
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
									</div>
								</div> <!-- 보라1 끝 -->
							</div> <!-- 하늘8 끝 -->
						</div> <!-- 하늘9 끝 -->
						
						<div class="fixed-bottom row bg-light"> <!-- 하단 가격 고정 -->
							<div class="col-12">
								<table class="table">
									<thead>
										<tr class="text-center">
											<th>피자</th>
											<th>사이드디시</th>
											<th>음료 & 기타</th>
											<th>총 금액</th>
										</tr>
									</thead>
									
									<!-- 피자는 보내진 거 하나만이니까 no -->
									<tbody>
										<!-- 토핑 최대 5개 -->
										<tr id="pizza-<%=pizza.getNo() %>" class="text-center">
											<td class="text">
												<a><small><%=pizza.getName()%></small></a>
												<br>
												<p><small class="text-secondary" id="price-<%=pizza.getNo() %>">기본도우<% // 라디오로 선택된 도우 %>　/　<% // 라디오로 선택된 사이즈%>L</small></p>
											</td>


										<!-- 사이드 제한 없음 -->
										<!-- 체크된 게 더 있으면 사이드이름 라인이 하나씩 추가되야 되는데... -->
											<td class="text" id="ordered-side">
												
											</td>


										<!-- 음료 최대 2개, 기타는 제한 없음 -->			
										<!-- 체크된 게 더 있으면 음료나 기타 라인이 하나씩 추가되야 되는데... -->
											<td class="text">
												<p><small>음료 꿀꺽<% // 버튼이 카운트된 음료 이름%>x<%//음료에 버튼 누를때마다 카운트 증가 %></small></p>
												<p><small>기타 팅팅<% // 버튼이 카운트된 기타 이름%>x<%//기타에 버튼 누를때마다 카운트 증가 %></small></p>
											</td>

											<td class="text">
												 피자 <input type="number" id="pizza-total-order-price" value="<%=(int)(pizza.getLprice() - (pizza.getLprice() * discountRate)) %>"  min="0"><br />
												사이드 <input type="number" id="side-order-price" value="0" min="0"><br />
												기타 <input type="number" id="etc-order-price" value="0" min="0"><br />
												<p><strong id="order-price" ><%=(int)(pizza.getLprice() - (pizza.getLprice() * discountRate)) %></strong>원</p>
												<a href="../order/cart.jsp">주문하기</a>
											</td>
										</tr>

									</tbody>
								</table>
							</div>
						</div>
					</form>
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
	function changePizza() {
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
	}
	
	// 사이드 메뉴의 수량이 변경될 때 마다 실행되는 함수다.
	function changeSide() {
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
	}
	
	// 기타 메뉴의 수량이 변경될 때마다 실행되는 함수다.
	function changeEtc() {
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
	}
	
	// 총구매가격을 갱신한다.
	function refreshTotalOrderPrice() {
		var pizzaPrice = document.getElementById("pizza-total-order-price").value;
		var sidePrice = document.getElementById("side-order-price").value;
		var etcPrice = document.getElementById("etc-order-price").value;
		
		document.getElementById("order-price").textContent = numberToCurrency(parseInt(pizzaPrice) + parseInt(sidePrice) + parseInt(etcPrice));
	}
</script>

</body>
</html>