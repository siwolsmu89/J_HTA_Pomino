<%@page import="com.domino.vo.User"%>
<%@page import="com.domino.dao.UserDao"%>
<%@page import="com.domino.vo.Grade"%>
<%@page import="com.domino.dao.GradeDao"%>
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
		String position = "home";
%>
<%@ include file="../common/navbar.jsp"%>
<div>
	
	<!-- 배너 광고 시작 --> <!-- 배너는 컨테이너 포함x -->
	<div class="row text-center">
		<div class="col-12">
			<!-- 배너광고 슬라이드 시작  -->
			<div id="demo" class="carousel slide" data-ride="carousel">
  				<!-- 배너의 하단에 표시되는 바로가기 표시 시작  -->
  				<ol class="carousel-indicators">
    				<li data-target="#demo" data-slide-to="0" class="active"></li>
    				<li data-target="#demo" data-slide-to="1"></li>
    				<li data-target="#demo" data-slide-to="2"></li>
  				</ol>
  				<!-- 배너의 하단에 표시되는 바로가기 표시 끝  -->

  				<!-- 배너 이미지 시작 -->
  				<div class="carousel-inner">
    				<div class="carousel-item active">
    					<a href="">	<!-- 이벤트 링크 등록 -->
	      					<img src="../resource/images/banners/20200401_sJg8GN4w.jpg" alt="설명1">
    					</a>
    				</div>
    				<div class="carousel-item">
      					<a href="">	<!-- 이벤트 링크 등록 -->
	      					<img src="../resource/images/banners/20200428_MTAHCg8j.jpg" alt="설명2">
    					</a>
    				</div>
    				<div class="carousel-item">
      					<a href="">	<!-- 이벤트 링크 등록 -->
	      					<img src="../resource/images/banners/20200311_N85WARBN.jpg" alt="설명3">
    					</a>
    				</div>
  			</div>
					<!-- 배너 이미지 끝 -->

  			<!-- 이전/다음 표시 시작 -->
  			<a class="carousel-control-prev" href="#demo" data-slide="prev">
    			<span class="carousel-control-prev-icon"></span>
  			</a>
  			<a class="carousel-control-next" href="#demo" data-slide="next">
    			<span class="carousel-control-next-icon"></span>
  			</a>
  			<!-- 이전/다음 표시 끝 -->
			</div>
			<!-- 배너광고 슬라이드 끝  -->
		</div>
	</div>
	<!-- 배너 광고 끝 -->
	
	<div class="container"> <!-- 몸체 시작 -->
		<div>
				
			<!-- 배달, 퀵 주문 버튼 -->
	 		<div>	 
				<div class="row">
					<div class="col-12">
						<div class="d-flex justify-content-center">
							<div class=""><a href="../order/cart.jsp"><img src="../resource/images/home/deli_btn.png" /></a></div>
							<div class=""><a href="../order/reorder.jsp?type=quick" ><img src="../resource/images/home/quick_btn.png" /></a></div>
						</div>
					</div>
				</div>
			</div>

		 
			<div><!-- 도미챗, 퀵오더, 드라이빙 픽업 주문 (추가기능) --></div>
			
			<div>
				<div class="row">
					
					<div class="col-12 ">
						<div class="d-flex justify-content-center " style="padding: 15px 0; background: #f6f6f6;">
						
						<%
							// if문으로 로그인 확인
							if ("Yes".equals(loginYn)) {
						%>
						
						<%
							GradeDao gradeDao = new GradeDao();
							UserDao userDao = new UserDao();
							User user = userDao.getUserByNo(loginUserNo);
						%>
						<!-- 
						<%
							//if ("quicknull".equals(error)) {
						%>
							<p style="color:red; font-style: italic;">등록된 퀵오더가 없습니다. 나의 주문 내역에서 퀵오더를 확인하세요</p>
						<%
							//}
						%>
						 -->
							<div class="p-4 ">
								<div>
									<p class="text-center"><strong><%=loginUserName%></strong> 님의 현재 등급</p> <!-- 사용자 이름 -->
									<h2 class="text-center">
						<%
							if (user.getGradeName() == null || "regular".equalsIgnoreCase(user.getGradeName())) {
						%>
									<span class="text-center badge badge-pill badge-warning"><strong>regular</strong></span>
						<%
							} else if ("premium".equalsIgnoreCase(user.getGradeName())) {
						%>
									<span class="text-center badge badge-pill badge-primary"><strong><%=user.getGradeName() %></strong></span>
						<%
							} else if ("vip".equalsIgnoreCase(user.getGradeName())) {
						%>
									<span class="text-center badge badge-pill badge-danger"><strong><%=user.getGradeName() %></strong></span>
						<%
							} else if ("royal".equalsIgnoreCase(user.getGradeName())) {
						%>
									<span class="text-center badge badge-pill badge-dark"><strong><%=user.getGradeName() %></strong></span>
						<%
							}
						%>
									</h2>
									<br/>
									<a href="../user/detailform.jsp"><button type="button" class="btn btn-dark">혜택보기</button></a>
									<a href="../user/orderlist.jsp"><button type="button" class="btn btn-dark">주문내역</button></a>
								</div>
							</div>
							
	<!--					
							<div class="p-4 text-center bg-dark text-white"> 
								<p>　</p>
								<p>보유쿠폰</p>
								<span><strong><%// 원래는 쿠폰 들어가야됨%>0</strong>개</span>
							</div>
							
							<div class="p-4 text-center bg-primary text-white">  
								<p>　</p>
								<span><strong><%// 다음 등급까지 횟수 들어가야됨%>0</strong>번만 더 주문하면 등급 UP</span>
							</div>
	-->						
	 
	<!-- 보유 쿠폰 00개 -->
	<!-- 					
							<div class="p-1"> 
								<a href=""><img src="../resource/images/home/main_card1_bg.png" alt="혜택1"/></a>
							</div>
	-->

	<!-- 다음 등급까지 횟수 -->							
	<!-- 					
							<div class="p-1"> 
								<a href=""><img src="../resource/images/home/main_card2_bg.gif" alt="혜택2"/></a>
							</div>
	-->
							<div class="p-1"> 
								<a><img src="/domino/resource/images/home/main_card4-1.gif" alt="혜택1"/></a>
							</div>
							
							<div class="p-1"> 
								<a href="/domino/user/detailform.jsp"><img src="/domino/resource/images/home/main_card2.gif" alt="혜택2"/></a>
							</div>
						<%	
							// if 닫고
							// else문으로 비로그인 확인, 비로그인 상태면 로그인 버튼 표시
							} else {
							// 비로그인 시
							// 아래 3 div로 교체
						%>
							<div class="p-4">
								<div></div>
								<div>포미노 피자의</div>
								<div class="text-primary"><strong>특별한 매니아 혜택</strong></div>
								<div>누려보세요!</div>
								<div>　</div>
								<a href="../user/loginform.jsp"><button type="button" class="btn btn-dark">로그인</button></a>
							</div>
							
<!-- 회원가입 즉시 20% 이라는 글자 추가 -->
<!-- 							
							<div class="p-1">
								<img src="../resource/images/home/main_card1_bg.png" alt="혜택1"/>
								<div id=""><a href=""></a></div>
							</div>
 -->
 
<!-- 홈 화면 맨 위로 이동,, 로그인 폼으로 이동시켜도 될듯? -->
<!-- 
							<div class="p-1"> 
								<a href="#"><img src="../resource/images/home/main_card2_bg.gif" alt="혜택2"/></a>
							</div>
 -->							

<!-- 기능상 아직 부족해서 급한대로 이거 추가, 나중에 위에꺼 되면 아래 2개 삭제 -->
							<div class="p-1"> 
								<a><img src="../resource/images/home/main_card4-1.gif" alt="혜택1"/></a>
							</div>
							
							<div class="p-1"> 
								<a><img src="../resource/images/home/main_card6.png" alt="혜택2"/></a>
							</div>
							
						<%
							// else문 닫고
							}
						%>	

							<!-- 이 2개는 비로그인/로그인 공통 사용 -->
							<!-- 도미노 혜택 (추가기능) -->
							<div class="p-1"> 
								<a><img src="../resource/images/home/main_card3.png" alt="혜택3"/></a>
							</div>
							<!-- 도미노 모멘트 (추가기능) -->
							<div class="pt-1 pr-3 pb-1 pl-1"> 
								<a><img src="../resource/images/home/main_card5.png" alt="혜택4"/></a>
							</div>
						</div>
						
					</div>
					
				</div>
			</div>
			
			<div class="row">
				<div class="col-12"> <!-- 해당 이벤트 페이지들로 이동 -->
					<div class="d-flex justify-content-center">
    					<div class="p-3 "><a><img src="../resource/images/home/20200601_8DXR9DCA.jpg" alt="이벤트1"/></a></div>
					    <div class="p-3 "><a><img src="../resource/images/home/20200120_KZ0ikrD9.jpg" alt="이벤트2"/></a></div>
    					<div class="p-3 "><a><img src="../resource/images/home/20200501_m4q2s7qu.jpg" alt="이벤트3"/></a></div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %>

</div>

</body>
</html>