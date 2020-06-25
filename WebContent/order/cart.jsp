<%@page import="com.domino.vo.Location"%>
<%@page import="com.domino.dao.LocationDao"%>
<%@page import="com.domino.dto.EtcOrderDto"%>
<%@page import="com.domino.dao.EtcDetailDao"%>
<%@page import="com.domino.dto.SideOrderDto"%>
<%@page import="com.domino.dao.SideDetailDao"%>
<%@page import="com.domino.dao.ToppingDetailDao"%>
<%@page import="com.domino.dto.ToppingOrderDto"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@page import="com.domino.vo.Pizza"%>
<%@page import="java.util.List"%>
<%@page import="com.domino.dao.PizzaDetailDao"%>
<%@page import="com.domino.dto.PizzaOrderDto"%>
<%@page import="com.domino.vo.Branch"%>
<%@page import="com.domino.dao.BranchDao"%>
<%@page import="com.domino.dao.OrderDao"%>
<%@page import="com.domino.vo.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<style>
	div > p > small{
		font-size: small;
		color : gray;
	}
	div > p > strong{
		font-size: XX-large;
	}
</style>
<head>
  <title>포미노피자 - 당신의 인생에 완벽한 한끼! Life Food,Pomino's</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<%@include file="../common/logincheck.jsp" %>
<body>
<%
	String position = "order";
%>
<%@ include file="../common/navbar.jsp"%>
<div class="container">
	<div class="header">
		<div class="row">
			<div class="col-4">
				<h4>장바구니</h4>
			</div>
			<div class="col-8">
				<ul class="nav justify-content-end small text-muted">
					<li class="nav-item"><a
						class="nav-link text-muted active pr-1" href="/domino/common/home.jsp">홈</a>
					</li>
					<li class="nav-item"><a class="nav-link disabled pr-1"
						href="#" tabindex="-1" aria-disabled="true">></a></li>
					<li class="nav-item"><a
						class="nav-link disabled text-dark font-weight-bold pr-1"
						href="#" tabindex="-1" aria-disabled="true">장바구니</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="body">
		<%
			OrderDao orderDao = new OrderDao();
			Order order = orderDao.getCartByUserNo(loginUserNo);
			if (session.getAttribute("savedLocationNo") == null) {
				response.sendRedirect("selectlocation.jsp");
				return;
			}	

			if (order != null) {
				BranchDao branchDao = new BranchDao();
				Branch branch = branchDao.getBranchByNo(order.getBranchNo());

				
				LocationDao ld = new LocationDao();
				int locationNo = (int) session.getAttribute("savedLocationNo");
				
				Location location = ld.getLocationByNo(locationNo);
		
				if (branch != null) {
					PizzaDetailDao pizzaDetailDao = new PizzaDetailDao();
					List<PizzaOrderDto> pizzaOrders = pizzaDetailDao.getPizzaOrdersByOrderNo(order.getNo());
		%>
		<div style="background-color: black; height: 3px;" class="mt-2"></div>
		<div class="row">
			<div class="col-12">
				<div class="card-header">
					<h5 class="mt-2 ml-2 font-weight-bold">배달주문</h5>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-9">
				<p class="mt-4">
					&emsp;
					<%=location.getAddrFirst() + " " + location.getAddrSecond() + " " + location.getAddrDetail()%></p>
				&emsp;
				<button class="btn btn-outline-secondary btn-sm" disabled><%=branch.getName()%></button>
				<span><%=branch.getTel()%></span>
			</div>
			<div class="col-2 text-right mt-4 ml-5">
				<a href="selectlocation.jsp"><button
						class="btn  btn-outline-secondary btn-sm"
						style="border-radius: 14px; padding: 0 13px; height: 30px;">수정</button></a>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div style="background-color: black; height: 3px; width: 100%"
					class="mt-4"></div>
				<div class="card-header">
					<div class="row">
						<div class="col-10">
							<h5 class="mt-2 ml-2 font-weight-bold">주문내역</h5>
						</div>
						<div class="text-right col-2">
							<button class="btn btn-danger" name="all"
								onclick="allRemoveCheck()">전체삭제</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<table class="table">
					<colgroup>
						<col width="37%">
						<col width="40%">
						<col width="4%">
						<col width="12%">
						<col width="7%">
					</colgroup>
					<thead>
						<tr class="text-center">
							<th>상품정보</th>
							<th>추가토핑</th>
							<th>수량</th>
							<th>금액</th>
							<th></th>
						</tr>
					</thead>
					<%
						int totalPrice = 0;
						for (PizzaOrderDto pizzaOrderDao : pizzaOrders) {
					%>
					<tbody>
						<tr class="text-center">
							<td class="text">
								<p>
									<img class="tm-5 rm-5 float-left" alt="<%=pizzaOrderDao.getPizzaName() %>" width="90px;"
										src="<%=pizzaOrderDao.getImageSrc() %>">
									<%=pizzaOrderDao.getPizzaName()%><br/> 
									<small style="color: gray; font-size: 14px;"><%=pizzaOrderDao.getPizzaSize()%></small><br/>
									<%=NumberUtil.numberWithComma(pizzaOrderDao.getDiscountPrice())%>원
								</p>
							</td>
							<td>
					<%
							int orderPrice = pizzaOrderDao.getDiscountPrice();
							ToppingDetailDao dao = new ToppingDetailDao();
							List<ToppingOrderDto> toppingOrderDtos = dao.getToppingOrdersByPizzaNo(pizzaOrderDao.getNo());
							for (ToppingOrderDto tol : toppingOrderDtos) {
							orderPrice += tol.getOrderPrice() * pizzaOrderDao.getOrderAmount();
					%>
								<div class="row justify-content-center">
									<div class="col-7" style="font-size: 14px;">
										<%=tol.getName()%>(+<%=tol.getPrice()%>)x<%=tol.getOrderAmount()%>
									</div>
									<div class="col-1">
										<button class="btn btn-sm"
											onclick="toppingRemoveCheck(<%=tol.getNo()%>)">x</button>
									</div>
								</div>
					<%
							}
					%>
							</td>
							<td><br/>
								<div class="">
									<input type="number" name="pizza"
										style="width: 60px; text-align: center; height: 30px;"
										onchange="modifyAmount(event, <%=pizzaOrderDao.getNo()%>)"
										value="<%=pizzaOrderDao.getOrderAmount()%>" min="1">
								</div></td>
							<td><br/><%=NumberUtil.numberWithComma(orderPrice)%> 원</td>
							<td><br/>
								<button class="btn btn-light" name="pizza"
									onclick="removeCheck(<%=pizzaOrderDao.getNo()%>)">X</button></td>
						</tr>
						<%
							totalPrice += orderPrice;
							}
							SideDetailDao sideDetailDao = new SideDetailDao();
							List<SideOrderDto> sdl = sideDetailDao.getSideOrdersByOrderNo(order.getNo());
							for (SideOrderDto sod : sdl) {
						%>
						<tr id="side" class="text-center">
							<td>
								<p>
									<img class=" tm-5 rm-5 float-left" alt="<%=sod.getSideName() %>"
										width="90px;" style=""
										src="<%=sod.getImageSrc() %>">
									<%=sod.getSideName()%><br/>
									<%=NumberUtil.numberWithComma(sod.getSidePrice())%>원
								</p>
							</td>
							<td></td>
							<td><br/>
								<div class="">
									<input type="number" name="side"
										style="width: 60px; text-align: center; height: 30px;"
										onchange="modifyAmount(event, <%=sod.getNo()%>)"
										value="<%=sod.getOrderAmount()%>" min="1">
								</div></td>
							<td><br/><%=NumberUtil.numberWithComma(sod.getOrderPrice())%>원</td>
							<td><br/><button class="btn btn-light" name="side" onclick="removeCheck(<%=sod.getNo()%>)">X</button></td>
						</tr>
						<%
							totalPrice += sod.getOrderPrice();
							}

							EtcDetailDao etcDetailDao = new EtcDetailDao();
							List<EtcOrderDto> edl = etcDetailDao.getEtcOrdersByOrderNo(order.getNo());
							for (EtcOrderDto edd : edl) {
						%>
						<tr class="text-center">
							<td>
								<p>
									<img class=" tm-5 rm-5 float-left" alt="<%=edd.getEtcName() %>"
										width="90px;" src="<%=edd.getImageSrc() %>">
									<%=edd.getEtcName()%><br/>
									<%=NumberUtil.numberWithComma(edd.getEtcPrice())%>원
								</p>
							</td>
							<td></td>
							<td>
								<div class="">
									<br/><input type="number"
										style="width: 60px; text-align: center; height: 30px;"
										name="etc" onchange="modifyAmount(event, <%=edd.getNo()%>)"
										value="<%=edd.getOrderAmount()%>" min="1">
								</div>
							</td>
							<td><br/><%=NumberUtil.numberWithComma(edd.getOrderPrice())%>원</td>
							<td><br/>
								<button class="btn btn-light" name="etc"
									onclick="removeCheck(<%=edd.getNo()%>)">X</button></td>
						</tr>
						<%
							totalPrice += edd.getOrderPrice();
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
		<div style="background-color: black; height: 2px;" class="mb-3"></div>
		<div class="row">
			<div class="col-6 mb-5">
				<br/>
				<p>
					<small>&ensp;&ensp;* 할인적용은 다음 단계에서 가능합니다.<br/>
						&ensp;&ensp;* 피클&소스는 구매하셔야합니다.<br/>
						&ensp;&ensp;- 메뉴>음료&기타 추가구매가능
					</small>
				</p>
			</div>
			<div class="col-6 text-right lm-5">
				<p>
					총 금액 <strong>&ensp;<%=NumberUtil.numberWithComma(totalPrice)%>원
					</strong>
				</p>
			</div>
		</div>
		<div style="background-color: gray; height: 1px;" class="mb-5"></div>
		<div class="text-center mb-5 row">
			<div class="col-12">
				<a href="../pizza/pizzamenu.jsp"><button
						class="btn btn-outline-secondary btn-lg"
						style="width: 200px; height: 65px;"> + 메뉴 추가하기</button></a>&ensp;
				<a href="payform.jsp"><button class="btn btn-primary btn-lg"
						style="width: 200px; height: 65px;">주문하기</button></a>
			</div>
		</div>
						<%
								}
							} else {
						%>
		<div class="row">
			<div class="col-12">
				<hr />
				<div class="text-center mt-5">
					<img alt="카트그림" width="200"
						src="../resource/images/order/cart.PNG">
				</div>
				<div class="text-center mt-2">
					<h4>장바구니가 비어 있습니다.</h4>
				</div>
				<div class="text-center mt-2">
					<h6>도미노피자의 맛있는 메뉴를 마음껏 골라 담으세요</h6>
				</div>
				<div class="text-center mt-3">
					<a href="../pizza/pizzamenu.jsp">
						<button
						   class="btn btn-outline-secondary btn-lg"
						   style="width: 200px; height: 65px;"> + 메뉴 추가하기
					   </button>
					</a>
				</div>
			</div>
		</div>
						<%
							}
						%>
		<hr />
	</div>
	<div class="mb-3"></div>
</div>
<%@ include file="../common/footer.jsp"%>
<script type="text/javascript">
	function modifyAmount(event, no) {
		var type = event.target.name;
		var amount = event.target.value;
		location.href="modifycart.jsp?no=" + no + "&amount=" + amount + "&type=" + type;
	}

	function removeCheck(no) {
		 if (confirm("해당 제품을 장바구니에서 삭제하시겠습니까?")){
			 var type = event.target.name;
		     location.href="delcart.jsp?no=" + no+ "&type=" + type;
		 }	
	}

	function toppingRemoveCheck(no) {
		if (confirm("선택하신 토핑을 삭제하시겠습니까?")){
		     location.href="delcart.jsp?type=topping&no=" + no;
		}
	}
	
	function allRemoveCheck() {
		 if (confirm("모든 제품을 삭제하시겠습니까?")){
			 var type = event.target.name;
		     location.href="delcart.jsp?type=" + type;
		 }	
	}
</script>
</body>
</html>