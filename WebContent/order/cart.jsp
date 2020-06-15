<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<style>
	div > h6 > small{
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
<%@ include file="../common/navbar.jsp"%>
<div class="container">
	<div class="header">
		<div class="row">	
			<div class="col-4"><!-- 페이지명 바꿔서 사용하기 -->
				<h4>장바구니</h4>
			</div>
			<div class="col-8"><!-- 홈>회원가입 같은 형태 바꿔서 사용하기(나중에 javascript로...) -->
				<ul class="nav justify-content-end">
				  <li class="nav-item">
				    <a class="nav-link active" href="#"><small>홈</small></a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">></a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true"><small>장바구니</small></a>
				  </li>
				</ul>
			</div>
		</div>
	</div>
	<div class="body mb-5">
		<%
			if (true) {
		%>
		<div class="row">
			<div class="col-12">
				<hr/>
				<div>
					<h6 class="mt-3">&emsp;배달주문</h6>
				</div>
				<div>
					<p class="mt-4">&emsp;<small>서울특별시 종로구 율곡로10길 105 디아망 401호(봉익동 10-1 디아망 401호)</small></p>
				</div>
				<div>
					&emsp;<button class="btn btn-outline-secondary btn-sm">안양석수점</button>
				<span>031-472-3044</span>
				<div>
					<h6 class="mt-3">&emsp;주문내역</h6>
				</div>
				<div>
					<table class="table w-auto small">
						<colgroup>
							<col width="35%">
							<col width="35%">
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
						<tbody>
							<tr class="text-center">
								<td><!-- 피자결제정보 -->사진 시리얼 칠리크랩 슈퍼시드함유도 슈퍼시드 함유도우/L 36,900원</td>
								<td><!-- 추가토핑 --></td>
								<td><!-- 수량 -->
									<div class="btn-group">
										<input type="number" name="amount" value="1" min="1"">
									</div>
								</td>
								<td><!-- 금액 -->0원</td>
								<td><!-- 전체삭제 --><button class="btn btn-light">X</button></td>
							</tr>
						</tbody>
					</table>
				</div>
				</div>
				<hr/>
				<div class="row">
					<div class="col-6">
						<pre class="mt-4">
<small>   * 할인적용은 다음 단계에서 가능합니다.
   * 피클&소스는 구매하셔야합니다.
   - 메뉴>음료&기타 추가구매 가능
</small>
						</pre>
					</div>
					<div class="col-6 text-right">
						<p>총 금액<strong>36,900원</strong></p>
					</div>
				</div>
				<hr/>
				<div class="text-center">
					<button class="btn btn-outline-secondary" style="width: 150px;">+ 메뉴 추가하기</button>
					<button class="btn btn-danger" style="width: 150px;">주문하기</button>
				</div>
			</div>
		</div>
		<%
			} else {
		%>
		<div class="row">
			<div class="col-12">
				<div class="text-center mt-5">
					<img alt="카트그림" width="200" src="../resource/images/order/cart.PNG">
				</div>
				<div class="text-center mt-2">
					<h4>장바구니가 비어 있습니다.</h4>
				</div>
				<div class="text-center mt-2">
					<h6><small>도미노피자의 맛있는 메뉴를 마음껏 골라 담으세요</small></h6>
				</div>
				<div class="text-center mt-3">
					<a href="../pizza.list.jsp" class="btn btn-outline-secondary active"><small>+ 메뉴 추가하기</small></a>
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
</body>
</html>