<%@page import="com.domino.dto.EtcOrderDto"%>
<%@page import="com.domino.dao.EtcDetailDao"%>
<%@page import="com.domino.dao.SideDetailDao"%>
<%@page import="com.domino.dto.SideOrderDto"%>
<%@page import="com.domino.dto.PizzaOrderDto"%>
<%@page import="com.domino.dao.PizzaDetailDao"%>
<%@page import="com.domino.vo.EtcOrder"%>
<%@page import="com.domino.vo.SideOrder"%>
<%@page import="com.domino.dao.BranchDao"%>
<%@page import="com.domino.dao.LocationDao"%>
<%@page import="com.domino.dao.OrderDao"%>
<%@page import="java.util.List"%>
<%@page import="com.domino.vo.Branch"%>
<%@page import="com.domino.vo.Order"%>
<%@page import="com.domino.vo.Location"%>
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
<style>
	div > p > strong {
		font-size: XX-large;
	}
	
</style>
<body>
<% String position = "order"; %>
<%@ include file="../common/navbar.jsp"%>
<div class="container">
	<div class="header">
		<div class="row">	
			<div class="col-4">
				<h4>결제하기</h4>
			</div>
			<div class="col-8">
				<ul class="nav justify-content-end">
				  <li class="nav-item">
				    <a class="nav-link active" href="#">홈</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">></a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link active" href="#">장바구니</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">></a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">결제하기</a>
				  </li>
				</ul>
			</div>
		</div>
		<div style="background-color: black; height: 2px;" class="mb-2"></div>
	</div>
	
	<%
			// 로그인된 userNo가 세션에 저장되어 있을 것
				int userNo = 100;
				// location도 세션에 있을 것
				int locationNo = 100;
				
				OrderDao orderDao = new OrderDao();
				Order cart = orderDao.getCartByUserNo(userNo);
				
				LocationDao locationDao = new LocationDao();
				Location location = locationDao.getLocationByNo(cart.getLocationNo());
				
				BranchDao branchDao = new BranchDao();
				Branch branch = branchDao.getBranchByNo(cart.getBranchNo());
				
				int allTotalPrice = 0;
				int allTotalDiscountPrice = 0;
		%>	
	
	<div class="row">
		<div class="col-12">
			<div>
				<div class="card">
					<div class="card-header" id="info-title" >
						<h5 class="font-weight-bold">수령인 정보</h5>
					</div>
					<div class="card-body" id="info-detail">
						<div id="receiver-addr" class="font-weight-bold">
							<p>
								<%=location.getAddrFirst() + " " + location.getAddrSecond() + " " + location.getAddrDetail()%>
							</p>							
						</div>
						<div id="branch-info">
							<div>
								<div>
									<button class="btn btn-outline-secondary btn-sm disabled"><%=branch.getName()%></button>
									<span class="text-muted"><%=branch.getTel()%></span>
								</div>
							</div>
						</div>
					<hr/>
					</div>
					<div class="card-body" id="payform-form">
						<form method="post" action='#'>
							<div class="form-group">
								<div class="custom-control custom-checkbox custom-control-inline">
									<input type="checkbox" class="custom-control-input" id="checkbox-same" name="same" value="<%=cart.getUserNo()%>" onclick="fillInputForm(event)" />
									<label class="custom-control-label" for="checkbox-same">주문자와 동일</label>
								</div>
							</div>
							<div class="form-group">
								<label>이름</label>
								<input type="text" class="form-control" id="input-name" name="receiver_name" onchange="toggleCheck()" />
							</div>
							<div class="form-group">
								<label>연락처</label>
								<div class="row">
									<div class="col-2">
										<select class="form-control" id="select-tel1" name="receiver_tel_1" onchange="toggleCheck()">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
										</select>
									</div>
									<div class="col-5">
										<input class="form-control" type="text" id="input-tel2" name="receiver_tel_2" onchange="toggleCheck()" />
									</div>
									<div class="col-5">
										<input class="form-control" type="text" id="input-tel3" name="receiver_tel_3" onchange="toggleCheck()" />
									</div>
								</div>
							</div>
							<div class="form-group" id="input-comment">
								<label for="request-select">요청사항</label>
								<select class="form-control" id="request-select" name="request" onchange="inputCheck(event)">
									<option value="" selected disabled>요청사항을 선택하세요.</option>
									<option value="" >문 앞에 놓아주세요.</option>
									<option value="" >피클은 빼주세요.</option>
									<option value="" >벨은 누르지 말아주세요.</option>
									<option value="self" >직접 입력</option>
								</select>
							</div>
							<div class="form-group" id="request-self" style="display: none;" >
								<input class="form-control" type="text" name="self_input" placeholder="주문시 요청사항을 입력하세요 (최대 25자까지 입력가능)" />
							</div>
						</form>
					</div>
				</div>
				<div style="background-color: black; height: 2px;" class="mt-5"></div>
				<div class="card" id="payform-orderlog">
					<div class="card-header" id="orderlog-title">
						<h5 class="font-weight-bold">주문내역</h5>
					</div>
					<div class="card-body">
						<!--for문을 돌려서 주문번호에 일치하는 모든 피자주문내역, 사이드주문내역, 기타주문내역 가져오기 -->
						<%
							int orderNo = cart.getNo();
							int orderSize = 0;	
						
							PizzaDetailDao pizzaDetailDao = new PizzaDetailDao();
							SideDetailDao sideDetailDao = new SideDetailDao();
							EtcDetailDao etcDetailDao = new EtcDetailDao();
							
							List<PizzaOrderDto> pol = pizzaDetailDao.getPizzaOrdersByOrderNo(orderNo);
							orderSize += pol.size();
							
							PizzaOrderDto first = pol.get(0);
							
							List<SideOrderDto> sol = sideDetailDao.getSideOrdersByOrderNo(orderNo);
							orderSize += sol.size();
							
							List<EtcOrderDto> eol = etcDetailDao.getEtcOrdersByOrderNo(orderNo);
							orderSize += eol.size();
						%>
								<div id="orderlog-main">
									<h5>
										<%=first.getPizzaName() %> <%=first.getDoughName() %> 
										<%=first.getPizzaSize() %> x <%=first.getOrderAmount() %> / <%=first.getPizzaPrice() %> 
						<%
									if (orderSize>0) {
						%>
										외 <%=orderSize-1 %>건
						<%				
									}
						%>				
									</h5>
									<hr/>
								</div>
								<div id="orderlog-detail">
						<%	
							if (!pol.isEmpty()) {
								for (PizzaOrderDto po : pol) {
									String pizzaName = po.getPizzaName() + " (" + po.getDoughName() + ")";
									String size = po.getPizzaSize();
									int price = po.getPizzaPrice();
									allTotalDiscountPrice += po.getDiscountPrice();
									allTotalPrice += price;
						%>
									<p><%=pizzaName %> <%=size %> x <%=po.getOrderAmount() %> / <%=price %> (가격에 토핑가격도 포함)</p>
						<%
									// Topping주문 리스트 뽑기
									//	 if (!tol.isempty) {
						%>			
									<p class="text-muted">+ 토핑명 (수량 X 피자 1)  // 토핑이 있을때만</p>
						<%		
									// }
								}
							}
							if (!sol.isEmpty()) {
								for (SideOrderDto so : sol) {
						%>
									<p> <%=so.getSideName() %> (사이드디시) x <%=so.getOrderAmount() %> / <%=so.getOrderPrice() %> </p>
						<%	
								}
							}
							if (!eol.isEmpty()) {
								for (EtcOrderDto eo : eol) {
						%>
									<p> <%=eo.getEtcName() %> (기타메뉴) x <%=eo.getOrderAmount() %> / <%=eo.getOrderPrice() %> </p>
						<%		
								}
							}
						%>
								</div>
					
					</div>	
				</div>
				<div style="background-color: black; height: 2px;" class="mt-5"></div>
				<div class="card" id="price-calculate">
					<div class="card-header">
						<h5 class="font-weight-bold">최종결제금액</h5>
					</div>
					<div class="row justify-content-center">
						<div class="col-2 text-center">
							<label class="small">총 상품금액</label>
							<p><strong><%=allTotalPrice %>원</strong></p>
						</div>
						<div class="col-2 text-center">
							<p></p>
							<p><strong>-</strong></p>
						</div>
						<div class="col-2 text-center">
							<label class="small">총 할인금액</label>
							<p style="color: red"><strong><%=allTotalPrice - allTotalDiscountPrice %></strong></p>
						</div>
						<div class="col-2 text-center">
							<p></p>
							<p><strong>=</strong></p>
						</div>
						<div class="col-2 text-center">
							<label class="small">총 결제금액</label>
							<p><strong><%=allTotalDiscountPrice %>원</strong></p>
						</div>
					</div>	
				</div>
				<div class="mt-5 mb-5">
					<div class="text-center">
						<button type="button" class="btn btn-danger btn-lg">결제하기</button>
					</div>			
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>

<script type="text/javascript">
	function fillInputForm(event) {
		var userNo = event.target.value;
		
		var checked = event.target.checked;
		
		if (checked) {
			var xhr = new XMLHttpRequest();
			
			xhr.onreadystatechange = function () {
				if (xhr.readyState ==4 && xhr.status == 200) {
					var text = xhr.responseText;
					var user = JSON.parse(text);
					
					document.querySelector("#input-name").value = user.name;
					var options = document.querySelectorAll("#select-tel1 option");
					for (var i = 0; i<options.length; i++) {
						if (options[i].value == user.tel1) {
							options[i].setAttribute("selected", "selected");
						}
					}
					document.querySelector("#input-tel2").value = user.tel2;
					document.querySelector("#input-tel3").value = user.tel3;
				}
			}
			
			xhr.open("GET", "receiverdata.jsp?userno=" + userNo);
			
			xhr.send();
		}
	}
	
	function inputCheck(event) {
		var selectBox = event.target;
		var value = selectBox.options[selectBox.selectedIndex].value;
		if ("self"==value) {
			document.querySelector("#request-self").style = "display: block";
		} else {
			document.querySelector("#request-self").style = "display: none";
		}
		
	}
	
	function toggleCheck() {
		var checkbox = document.querySelector("#checkbox-same");
		if (checkbox.checked) {
			checkbox.checked = false;
		}
		
	}
</script>
</body>
</html>