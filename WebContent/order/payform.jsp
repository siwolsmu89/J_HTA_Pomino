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
			<div class="col-4"><!-- 페이지명 바꿔서 사용하기 -->
				<h4>결제하기</h4>
			</div>
			<div class="col-8"><!-- 나중에 javascript로 수정할 것  -->
				<ul class="nav justify-content-end">
				  <li class="nav-item">
				    <a class="nav-link active" href="#">홈</a>
				  </li>
				 <!--  사용할만큼 추가하기
				  <li class="nav-item">
				    <a class="nav-link" href="#">Link</a>
				  </li>
				  -->
				  <li class="nav-item">
				    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">></a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link active" href="#">장바구니</a>
				  </li>
				 <!--  사용할만큼 추가하기
				  <li class="nav-item">
				    <a class="nav-link" href="#">Link</a>
				  </li>
				  -->
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
	<hr />
	<div class="body">
		<div class="row">
			<div class="col-12">
				<div id="info-title">
					<h5>수령인 정보</h5>
				</div>
				<div id="info-detail">
					<div id="receiver-addr">
						<p>수령인 주소(주소 테이블에서 가져옴)</p>							
					</div>
					<div id="branch-info">
						<div>
							<div>
								<button class="btn btn-outline-secondary btn-sm disabled">매장명</button>
								<span>전화번호</span>
							</div>
						</div>
					</div>
				</div>
				<div id="payform-form">
					<form>
						<div id="checkbox-same">
							<input type="checkbox" name="same" onclick="" />
							<label>주문자와 동일</label>
						</div>
						<div id="input-name">
							<label>이름</label>
							<input type="text" name="receiver_name" />
						</div>
						<div id="input-tel">
							<label>연락처</label>
							<select name="receiver_tel_1">
								<option value="010">010</option>
							</select>
							<input type="text" name="receiver_tel_2" />
							<input type="text" name="receiver_tel_3" />
						</div>
						<div id="input-comment">
							<label>요청사항</label>
							<select name="request">
								<option value="" selected disabled>요청사항을 선택하세요.</option>
							</select>
						</div>
					</form>
					<div id="payform-orderlog">
						<div id="orderlog-title">
							<h5>주문내역</h5>
						</div>
						<div>
							<!--for문을 돌려서 주문번호에 일치하는 모든 피자주문내역, 사이드주문내역, 기타주문내역 가져오기 -->
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
								<p>123123원</p>
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
								<label>총 할인금액</label>
								<p>123000원</p>
							</div>
						</div>		
						<div class="text-center">
							<button type="submit">결제하기</button>
						</div>			
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>