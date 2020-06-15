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
<body>
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
	%>	
	
	<div class="body">
		<div class="row">
			<div class="col-12">
				<div id="info-title">
					<h5>수령인 정보</h5>
				</div>
				<div id="info-detail">
					<div id="receiver-addr">
						<p>
							<%=location.getAddrFirst() + " " + location.getAddrSecond() + " " + location.getAddrDetail()  %>
						</p>							
					</div>
					<div id="branch-info">
						<div>
							<div>
								<button class="btn btn-outline-secondary btn-sm disabled"><%=branch.getName() %></button>
								<span><%=branch.getTel() %></span>
							</div>
						</div>
					</div>
				</div>
				<div id="payform-form">
					<form>
						<div>
							<input type="checkbox" id="checkbox-same" name="same" value="<%=cart.getUserNo() %>" onclick="fillInputForm(event)" />
							<label>주문자와 동일 (클릭시 input폼들을 채워주는 함수 실행)</label>
						</div>
						<div>
							<label>이름</label>
							<input type="text" id="input-name" name="receiver_name" onchange="toggleCheck()" />
						</div>
						<div>
							<label>연락처</label>
							<select id="select-tel1" name="receiver_tel_1" onchange="toggleCheck()">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>
							<input type="text" id="input-tel2" name="receiver_tel_2" onchange="toggleCheck()" />
							<input type="text" id="input-tel3" name="receiver_tel_3" onchange="toggleCheck()" />
						</div>
						<div id="input-comment">
							<label>요청사항</label>
							<select name="request">
								<option value="" selected disabled>요청사항을 선택하세요.</option>
								<option value="" >문 앞에 놓아주세요.</option>
								<option value="" >피클은 빼주세요.</option>
								<option value="" >벨은 누르지 말아주세요.</option>
								<option value="" >직접 입력</option>
							</select>
						</div>
					</form>
					<div id="payform-orderlog">
						<div id="orderlog-title">
							<h5>주문내역</h5>
						</div>
						<div>
							<!--for문을 돌려서 주문번호에 일치하는 모든 피자주문내역, 사이드주문내역, 기타주문내역 가져오기 -->
							<%
							%>
							<div>
								<h6>주문내역에 있는 제품명 x 수량</h6>
							</div>
							<div>
								<p>주문내역에 있는 제품명 x 수량 / 총 가격(할인미적용)</p>
							</div>
						</div>	
					</div>
					<div id="price-calculate">
						<h5>최종결제금액</h5>
						<div class="row justify-content-center">
							<div class="col-2">
								<label>총 상품금액</label>
								<p><%=cart.getTotalPrice() %>원</p>
							</div>
							<div class="col-2">
								<p>-</p>
							</div>
							<div class="col-2">
								<label>총 할인금액</label>
								<p>123원</p>
							</div>
							<div class="col-2">
								<p>=</p>
							</div>
							<div class="col-2">
								<label>총 결제금액</label>
								<p><%=cart.getDiscountPrice() %>원</p>
							</div>
						</div>		
						<div class="text-center">
							<button type="submit">결제하기(jsp로 이동, 주문 객체의 status를 c에서 o로 변경)</button>
						</div>			
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
	
	function toggleCheck() {
		var checkbox = document.querySelector("#checkbox-same");
		if (checkbox.checked) {
			checkbox.checked = false;
		}
		
	}
</script>
</body>
</html>