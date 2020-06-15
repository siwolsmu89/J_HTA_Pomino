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

<div>

	<%@ include file="../common/navbar.jsp"%>
	<div class="container"> <!-- 몸체 시작 -->
		<div>
		
			<div class="row">			<!-- 슬라이드 배너 -->
				<div class="col-12">
					<a href="#"><img src="../resource/images/home/20200612_6v9GzSm6.jpg" alt="이벤트 테스트" /></a>
				</div>
			</div>
			
			<div>	<!-- 배달, 포장 주문 버튼 (버튼 2개임)-->
				<div class="row">
					<div class="col-12">
						<div class="d-flex justify-content-center">
							<div class=""><a href="#"><img src="../resource/images/home/deli_btn.png" /></a></div>
							<div class=""><a href="#"><img src="../resource/images/home/pack_btn.png" /></a></div>
						</div>
					</div>
				</div>
				<!-- 로그인 안되있을 때  -->
				
				<%
					// if문으로 로그인 확인,
					if(true) {
				%>
				
				<!-- 비로그인 상태면 로그인 화면으로 이동-->
				<!-- "../user/loginform.jsp 등등...으로 이동 -->
				<a href="../user/loginform.jsp"></a>
				
				<%
					// if문 닫고
					}
				%>
				
				<%
					// else 로 로그인 상태면
					
				%>
				
					<!-- 주문 화면으로 이동 -->
					<!-- ../order/....form...? 등등으로 이동 -->
				<a href=""></a>
				<%
					// else 닫고
					
				%>

			</div>
			
			<div><!-- 도미챗, 퀵오더, 드라이빙 픽업 주문 (추가기능) --></div>
			
			<div>
				<div class="row">
					
					<div class="col-12">
						<div class="d-flex justify-content-center">
						
						<!-- 비로그인 상태면 로그인 버튼 표시 -->
						<%
							// if문으로 비로그인 확인, 비로그인 시
							// 아래 3 div 교체
						%>
							<div class="p-1">
								<p>도미노 피자의</p>
								<p>특별한 매니아 혜택을</p>
								<p>누려보세요!</p>
								<a href="../user/loginform.jsp">로그인</a>
							</div>
							
							<div class="p-1"> <!-- 회원가입 즉시 20% 이라는 글자 추가 -->
								<a href="#"><img src="../resource/images/home/main_card1_bg.png" alt="혜택1"/></a>
							</div>
							
							<div class="p-1"> <!-- 홈 화면 맨 위로 이동,, 로그인 폼으로 이동시켜도 될듯? -->
								<a href="#"><img src="../resource/images/home/main_card2_bg.gif" alt="혜택2"/></a>
							</div>
						<%
							// if문 닫고
						%>							
							
						<%
							// else문으로 로그인 상태면 혜택, 주문 등 변경된 화면 표시
						%>
							<div class="p-1">
								<p><% %>님 현재 등급<!-- 사용자 이름 --></p>
								<p><% %><!-- 등급 --></p>
								<a href="#">혜택보기</a>
								<a href="#">주문내역</a>
							</div>
							
							<div class="p-1"> <!-- 보유쿠폰 개수 추가 --><% %>
								<a href="#"><img src="../resource/images/home/main_card1_bg.png" alt="혜택1"/></a>
							</div>
							
							<div class="p-1"> <!-- 다음 등급까지 몇번 남았는지 표시 --><% %>
								<a href="#"><img src="../resource/images/home/main_card2_bg.gif" alt="혜택2"/></a>
							</div>
						<%	
							// else 닫고
						%>
						
							<!-- 아래 2개는 비로/로 공통 사용 -->
							
							<div class="p-1"> <!-- 도미노 혜택 (추가기능) -->
								<a href="#"><img src="../resource/images/home/main_card3.png" alt="혜택3"/></a>
							</div>
							
							<div class="p-1"> <!-- 도미노 모멘트 (추가기능) -->
								<a href="#"><img src="../resource/images/home/main_card5.png" alt="혜택4"/></a>
							</div>
						</div>
						
						
						
					</div>
					
				</div>
			</div>
			
			<div class="row">
				<div class="col-12"> <!-- 해당 이벤트 페이지들로 이동 -->
					<div class="d-flex justify-content-center">
    					<div class="p-3 "><a href="#"><img src="../resource/images/home/20200601_8DXR9DCA.jpg" alt="이벤트1"/></a></div>
					    <div class="p-3 "><a href="#"><img src="../resource/images/home/20200120_KZ0ikrD9.jpg" alt="이벤트2"/></a></div>
    					<div class="p-3 "><a href="#"><img src="../resource/images/home/20200501_m4q2s7qu.jpg" alt="이벤트3"/></a></div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %>

</div>

</body>
</html>