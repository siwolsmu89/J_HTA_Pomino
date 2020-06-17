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
	div > h6 {
		font-size: 4px;
		color : gray;
	}
	div > p > small{
		font-size: small;
	}
	div > p > strong{
		font-size: XX-large;
	}
</style>
<head>
  <title>도미노피자 - 당신의 인생에 완벽한 한끼! Life Food,Domino's</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<% String position = "order"; %>
<%@ include file="../common/navbar.jsp"%>
<div class="container">
	<div class="header">
		<div class="row">	
			<div class="col-4"><!-- 페이지명 바꿔서 사용하기 -->
				<h4>장바구니</h4>
			</div>
			<div class="col-8"><!-- 홈>회원가입 같은 형태 바꿔서 사용하기(나중에 javascript로...) -->
				<ul class="nav justify-content-end small text-muted">
				  <li class="nav-item">
				    <a class="nav-link text-muted active pr-1" href="../common/home.jsp">홈</a>	<!--text-muted pr-1  -->
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled pr-1" href="#" tabindex="-1" aria-disabled="true">></a><!-- pr-1  -->
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled text-dark font-weight-bold pr-1" href="#" tabindex="-1" aria-disabled="true">장바구니</a>
				  </li>
				</ul>
				
			</div>
		</div>
	</div>
	<div class="body">
		<%	
			int userNo = 100;
			OrderDao orderDao = new OrderDao();
			Order order = orderDao.getCartByUserNo(userNo);
			
			if (order != null) {
				BranchDao branchDao = new BranchDao();
				Branch branch = branchDao.getBranchByNo(order.getBranchNo());
				
				if (branch != null) {
					PizzaDetailDao pizzaDetailDao = new PizzaDetailDao();
					List<PizzaOrderDto> pizzaOrders = pizzaDetailDao.getPizzaOrdersByOrderNo(order.getNo());
						
		%>
		<div style="background-color: black; height: 3px;" class="mt-2"></div>
		<div class="row">
			<div class="col-12">
				<div class="card-header">
					<h6 class="mt-3 font-weight-bold">&emsp;배달주문</h6>
				</div>
				<div class="row">
					<div class="col-9">
						<p class="mt-4">&emsp;<small><%=branch.getAddrFirst() + branch.getAddrSecond() + branch.getAddrDetail() %></small></p>
					</div>
					<div class="col-2 text-right mt-4 ml-5">
						<button class="btn btn-outline-secondary btn-sm rounded" style="border-radius: 50%;">수정</button>
					</div>
				</div>
				<div>
					&emsp;<button class="btn btn-outline-secondary btn-sm" disabled><%=branch.getName() %></button>
				<span><%=branch.getTel() %></span>
				<div>
					<div style="background-color: black; height: 3px;" class="mt-3"></div>
					<div class="card-header" >
						<h6 class="mt-3 font-weight-bold">&emsp;주문내역</h6>
					</div>
					<div>
						<table class="table">
							<colgroup>
								<col width="40%">
								<col width="30%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							<thead>
								<tr class="text-center">
									<th>상품정보</th>
									<th>추가토핑</th>
									<th>수량</th>
									<th>금액</th>
									<th>전체삭제</th>
								</tr>
							</thead>
					<%
						int totalPrice = 0;
						for (PizzaOrderDto pizzaOrderDto : pizzaOrders) {
					%>
							<tbody>
								<tr class="text-center">
									<td class="text"><!-- 피자결제정보 -->
									<p>
									<img class=" tm-5 rm-5 float-left" alt="시리얼 칠리크랩" width="90px;" style=";" src="../resource/images/pizza/20200602_0uirYrYy.jpg">
									<br/><%=pizzaOrderDto.getPizzaName() %><br/>
									<small><%=pizzaOrderDto.getDoughName() %>/<%=pizzaOrderDto.getPizzaSize() %></small><br/>
									<%=NumberUtil.numberWithComma(pizzaOrderDto.getOrderPrice()) %>원
									</p>
									</td>
									<td>
					<%
							int orderPrice = pizzaOrderDto.getOrderPrice();
							ToppingDetailDao dao = new ToppingDetailDao();
							List<ToppingOrderDto> toppingOrderDtos = dao.getToppingOrdersByPizzaNo(pizzaOrderDto.getNo());
							for (ToppingOrderDto tol : toppingOrderDtos) {
								orderPrice += tol.getOrderPrice();
					%>			
									<div class="row justify-content-center">
										<div class="col-7">
											<br/>
											<%=tol.getName()%>(+<%=tol.getPrice()%>)X<%=tol.getOrderAmount() %>
										</div>
										<div class="col-1">
											<br/>
											<button class="btn btn-sm" onclick="toppingRemoveCheck(<%=tol.getNo()%>)">x</button>
										</div>
									</div>
					<%
							}
					%>			
									</td>
									<td><!-- 수량 -->
										<br/>
										<div class="">
											<input type="number" name="amount" value="<%=pizzaOrderDto.getOrderAmount() %>" min="1">
										</div>
									</td>
									<td><br/><!-- 금액 --><%=orderPrice*pizzaOrderDto.getOrderAmount() %> 원</td>
									<td><br/><!-- 전체삭제 --><button class="btn btn-light" name="pizza" onclick="removeCheck(<%=pizzaOrderDto.getNo()%>)">X</button></td>
								</tr>
<%
								totalPrice += orderPrice*pizzaOrderDto.getOrderAmount();
						}
							SideDetailDao sideDetailDao = new SideDetailDao();
							List<SideOrderDto> sdl = sideDetailDao.getSideOrdersByOrderNo(100);
							for (SideOrderDto sod : sdl) {
%>
								<tr id="side" class="text-center">
									<td><!-- 사이드결제정보 -->
									<p>
										<img class=" tm-5 img-thumbnail float-left" alt="사이드메뉴" width="100px;" src="../resource/images/sidemenu/20200429_zUBSp7rE.jpg">
										<br/><%=sod.getSideName() %><br/>
										<%=sod.getSidePrice() %> 원
									</p>
									</td>
									<td></td>
									<td><!-- 수량 -->
										<br/>
										<div class="">
											<input type="number" name="amount" value="<%=sod.getOrderAmount() %>" min="1">
										</div>
									</td>
									<td><br/><!-- 금액 --><%=sod.getOrderPrice() %> 원</td>
									<td><br/><!-- 전체삭제 --><button class="btn btn-light" name="side" onclick="removeCheck(<%=sod.getNo() %>)">X</button></td>
								</tr>
						<%
								totalPrice += sod.getOrderPrice();
							}
							
							EtcDetailDao etcDetailDao = new EtcDetailDao();
							List<EtcOrderDto> edl = etcDetailDao.getEtcOrdersByOrderNo(100);
							for (EtcOrderDto edd :edl) {
						%>
								<tr class="text-center">
									<td><!-- 음료결제정보 -->
									<p>
									<img class=" tm-5 img-thumbnail float-left" alt="코카콜라" width="100px;" src="../resource/images/etcmenu/20200309_J6k5xlTF.jpg">
									<br/>
									<%=edd.getEtcName() %><br/>
									<%=edd.getEtcPrice() %> 원
									</p>
									</td>
									<td></td>
									<td><!-- 수량 -->
										<div class="">
										<br/>
											<input type="number" name="amount" value="<%=edd.getOrderAmount() %>" min="1">
										</div>
									</td>
									<td><br/><!-- 금액 --><%=edd.getOrderPrice() %> 원</td>
									<td><br/><!-- 전체삭제 --><button class="btn btn-light" name="etc" onclick="removeCheck(<%=edd.getNo() %>)">X</button></td>
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
						<div class="col-6">
							<p><small>&ensp;* 할인적용은 다음 단계에서 가능합니다.</small></p>
							<p><small>&ensp;* 피클&소스는 구매하셔야합니다.</small></p>
							<p><small>&ensp;- 메뉴>음료&기타 추가구매 가능</small></p>
						</div>
						<div class="col-6 text-right">
							<p>총 금액 <strong>&ensp;<%=NumberUtil.numberWithComma(totalPrice) %>원</strong></p>
						</div>
					</div>
				</div>
				<div style="background-color: gray; height: 1px;" class="mb-5"></div>
				<div class="text-center mb-5">
					<a href="../pizza/pizzamenu.jsp"><button class="btn btn-outline-secondary" style="width: 150px;">+ 메뉴 추가하기</button></a>
					<a href="payform.jsp"><button class="btn btn-danger" style="width: 150px;">주문하기</button></a>
				</div>
			</div>
		</div>
		<%
				}
			} else {
		%>
		<div class="row">
			<div class="col-12">
			<hr/>
				<div class="text-center mt-5">
					<img alt="카트그림" width="200" src="../resource/images/order/cart.PNG">
				</div>
				<div class="text-center mt-2">
					<h4>장바구니가 비어 있습니다.</h4>
				</div>
				<div class="text-center mt-2">
					<h6>도미노피자의 맛있는 메뉴를 마음껏 골라 담으세요</h6>
				</div>
				<div class="text-center mt-3">
					<a href="../pizza/pizzamenu.jsp" class="btn btn-outline-secondary active"><small>+ 메뉴 추가하기</small></a>
				</div>
			</div>
		</div>
		<%
			}
		%>
	</div>
	<hr/>
</div>
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
	function removeCheck(no) {
		 if (confirm("해당 제품을 장바구니에서 삭제하시겠습니까?")){
			 var type = event.target.name
		     location.href="delcart.jsp?no=" + no+ "&type=" + type;
		 }	
	}
	
	function toppingRemoveCheck(no) {
		if (confirm("선택하신 토핑을 삭제하시겠습니까?")){
		     location.href="delcart.jsp?type=topping&no=" + no;
		}
	}
</script>
</body>
</html>