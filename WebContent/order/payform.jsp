<%@page import="com.domino.util.NumberUtil"%>
<%@page import="com.domino.util.StringUtil"%>
<%@page import="com.domino.dao.GradeDao"%>
<%@page import="com.domino.vo.Grade"%>
<%@page import="com.domino.vo.User"%>
<%@page import="com.domino.dao.UserDao"%>
<%@page import="com.domino.dto.ToppingOrderDto"%>
<%@page import="com.domino.dao.ToppingDetailDao"%>
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
  <title>포미노 피자</title>
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
			<div class="col-8"><!-- 홈>회원가입 같은 형태 바꿔서 사용하기(나중에 javascript로...) -->
				<ul class="nav justify-content-end small text-muted">
				  <li class="nav-item">
				    <a class="nav-link text-muted active pr-1" href="/domino/common/home.jsp">홈</a>	
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled pr-1" href="#" tabindex="-1" aria-disabled="true">></a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link text-muted active pr-1" href="/domino/order/cart.jsp">장바구니</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled pr-1" href="#" tabindex="-1" aria-disabled="true">></a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled text-dark font-weight-bold pr-1" href="#" tabindex="-1" aria-disabled="true">결제하기</a>
				  </li>
				</ul>
			</div>
		</div>
		<div style="background-color: black; height: 2px;"></div>
	</div>
	
	<%
				int userNo = loginUserNo;
			// location도 세션에 있을 것
				if (session.getAttribute("savedLocationNo") == null) {
					response.sendRedirect("selectlocation.jsp");
					return;
				}
				int locationNo = (int) session.getAttribute("savedLocationNo");
				
				OrderDao orderDao = new OrderDao();
				Order cart = orderDao.getCartByUserNo(userNo);
				
				if (cart == null) {
					response.sendRedirect("cart.jsp");
					return;
				}
				
				LocationDao locationDao = new LocationDao();
				Location location = locationDao.getLocationByNo(locationNo);
				
				BranchDao branchDao = new BranchDao();
				Branch branch = branchDao.getBranchByNo(cart.getBranchNo());
				double branchDC = branch.getDiscountRate();
				
				// 사용자의 등급할인율 가져오기
				UserDao userDao = new UserDao();
				User user = userDao.getUserByNo(userNo);
				String gradeName = StringUtil.nullToValue(user.getGradeName(), "regular");
				
				GradeDao gradeDao = new GradeDao();
				Grade grade = gradeDao.getGradeByName(gradeName);
				double gradeDC = 0;
				if (grade != null) {
					gradeDC = grade.getDiscountRate();
				}
				
				double totalDC = (gradeDC > branchDC) ? gradeDC : branchDC;

				int allTotalPrice = 0;
				int allTotalDiscountPrice = 0;
		%>	
	
	<div class="row">
		<div class="col-12">
			<form id="payform-form" method="post" action='pay.jsp'>
				<div>
					<div class="card mt-0">
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
										<button type="button" disabled class="btn btn-outline-secondary btn-sm disabled"><%=branch.getName()%></button>
										<span class="text-muted"><%=branch.getTel()%></span>
									</div>
								</div>
							</div>
						<hr class="mb-0"/>
						</div>
						<div class="card-body">
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
								<select class="form-control" id="request-select" name="request_detail" onchange="inputCheck(event)">
									<option value="" selected disabled>요청사항을 선택하세요.</option>
									<option value="문 앞에 놓아주세요." >문 앞에 놓아주세요.</option>
									<option value="피클은 빼주세요." >피클은 빼주세요.</option>
									<option value="벨은 누르지 말아주세요." >벨은 누르지 말아주세요.</option>
									<option value="self" >직접 입력</option>
								</select>
							</div>
							<div class="form-group" id="request-self" style="display: none;" >
								<input class="form-control" type="text" name="self_input" placeholder="주문시 요청사항을 입력하세요 (한글 최대 100자까지 입력가능)" value=" " />
							</div>
						</div>
					</div>
					<div style="background-color: black; height: 2px;" class="mt-5"></div>
					<div class="card" id="payform-orderlog">
						<div class="card-header" id="orderlog-title">
							<h5 class="font-weight-bold">주문내역</h5>
						</div>
						<div class="card-body">
							<%
								int orderNo = cart.getNo();
								int orderSize = 0;	
								
								PizzaDetailDao pizzaDetailDao = new PizzaDetailDao();
								SideDetailDao sideDetailDao = new SideDetailDao();
								EtcDetailDao etcDetailDao = new EtcDetailDao();
								
								List<PizzaOrderDto> pol = pizzaDetailDao.getPizzaOrdersByOrderNo(orderNo);
								orderSize += pol.size();
								
								List<SideOrderDto> sol = sideDetailDao.getSideOrdersByOrderNo(orderNo);
								orderSize += sol.size();
								
								List<EtcOrderDto> eol = etcDetailDao.getEtcOrdersByOrderNo(orderNo);
								orderSize += eol.size();

								String firstOrderName = "";
								if (!pol.isEmpty()) {
									PizzaOrderDto first = pol.get(0);
									firstOrderName += first.getPizzaName() + "(" + first.getDoughName() + ")";
								} else if (!sol.isEmpty()) {
									SideOrderDto first = sol.get(0);
									firstOrderName += first.getSideName();
								} else if (!eol.isEmpty()) {
									EtcOrderDto first = eol.get(0);
									firstOrderName += first.getEtcName();
								}
								
								String firstOrderAmount = orderSize > 1 ? "외 " + (orderSize - 1) + "건" : "";
								
							%>
									<div id="orderlog-main">
										<h5>
											<%=firstOrderName %> 
											<%=firstOrderAmount %> 
										</h5>
										<hr/>
									</div>
									<div id="orderlog-detail">
							<%	
								if (!pol.isEmpty()) {
									for (PizzaOrderDto po : pol) {
										String pizzaName = po.getPizzaName() + " (" + po.getDoughName() + ")";
										String size = po.getPizzaSize();
										int discountPrice = po.getDiscountPrice();
										ToppingDetailDao toppingDetailDao = new ToppingDetailDao();
										List<ToppingOrderDto> tol = toppingDetailDao.getToppingOrdersByPizzaNo(po.getNo());
										int toppingPrice = 0;
										for (ToppingOrderDto to : tol) {
											toppingPrice += to.getOrderPrice();
										}
										toppingPrice *= po.getOrderAmount();
										allTotalPrice += discountPrice + toppingPrice;
										allTotalDiscountPrice += discountPrice + toppingPrice;
							%>
										<p class="small font-weight-bold"><%=pizzaName %> <%=size %> x <%=po.getOrderAmount() %> / <%=NumberUtil.numberWithComma(discountPrice) %>원 </p>
							<%
										for (ToppingOrderDto to : tol) {
							%>			
										<p class="small text-muted">+ <%=to.getName() %> x <%=to.getOrderAmount() %> / <%=to.getOrderPrice() %> (피자 1판 당)</p>
							<%		
										}
									}
								}
								if (!sol.isEmpty()) {
									for (SideOrderDto so : sol) {
										allTotalPrice += so.getOrderPrice();
										allTotalDiscountPrice += so.getOrderPrice();
							%>
										<p> <%=so.getSideName() %> (사이드디시) x <%=so.getOrderAmount() %> / <%=NumberUtil.numberWithComma(so.getOrderPrice()) %>원 </p>
							<%	
									}
								}
								if (!eol.isEmpty()) {
									for (EtcOrderDto eo : eol) {
										allTotalPrice += eo.getOrderPrice();
										allTotalDiscountPrice += eo.getOrderPrice();
							%>
										<p> <%=eo.getEtcName() %> (기타메뉴) x <%=eo.getOrderAmount() %> / <%=NumberUtil.numberWithComma(eo.getOrderPrice()) %>원 </p>
							<%		
									}
								}
								allTotalDiscountPrice = (int) (allTotalDiscountPrice * (1 - totalDC));
							%>
									</div>
							<div class="form-group">
								<input type="hidden" name="totalprice" value="<%=allTotalPrice %>">
								<input type="hidden" name="totaldiscount" value="<%=allTotalDiscountPrice %>">
							</div>
						</div>	
					</div>
					<div style="background-color: black; height: 2px;" class="mt-5"></div>
					<div class="card" id="price-calculate">
						<div class="card-header">
							<h5 class="font-weight-bold">최종결제금액</h5>
						</div>
						<div class="row justify-content-center mt-2">
							<div class="col-2 text-center">
								<label class="small font-weight-bold">총 상품금액</label>
								<p><strong><%=NumberUtil.numberWithComma(allTotalPrice) %>원</strong></p>
							</div>
							<div class="col-2 text-center">
								<p></p>
								<p><strong>-</strong></p>
							</div>
							<div class="col-2 text-center">
								<label class="small font-weight-bold">총 할인금액</label>
								<p><strong style="color: red"><%=NumberUtil.numberWithComma(allTotalPrice - allTotalDiscountPrice) %>원</strong></p>
							</div>
							<div class="col-2 text-center">
								<p></p>
								<p><strong>=</strong></p>
							</div>
							<div class="col-2 text-center">
								<label class="small font-weight-bold">총 결제금액</label>
								<p><strong><%=NumberUtil.numberWithComma(allTotalDiscountPrice) %>원</strong></p>
							</div>
						</div>	
					</div>
					<div class="mt-5 mb-5">
						<div class="text-center">
							<button type="button" class="btn btn-danger btn-lg" onclick="checkFormsAndSubmit()" style="width: 200px; height: 65px;">결제하기</button>
						</div>			
					</div>
			</div>
			</form>
		</div>
	</div>
	<div class="mb-3"></div>
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
	
	function checkFormsAndSubmit() {
		var forms = document.querySelectorAll("#payform-form input");
		for (var i = 0; i < forms.length; i++) {
			if (!forms[i].value) {
				alert("값이 비어 있는 입력창이 있습니다. 먼저 입력창을 모두 채워주세요.");
				return;
			} 
		}
		document.getElementById("payform-form").submit();
	}
</script>
</body>
</html>