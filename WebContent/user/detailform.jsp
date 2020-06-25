<%@page import="com.domino.util.NumberUtil"%>
<%@page import="com.domino.vo.Grade"%>
<%@page import="java.util.List"%>
<%@page import="com.domino.dao.GradeDao"%>
<%@page import="com.domino.dto.UserDto"%>
<%@page import="com.domino.vo.User"%>
<%@page import="com.domino.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/logincheck.jsp" %>
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
	String position = "login";
	String subPosition = "usergrade";
%>
<%@ include file="../common/navbar.jsp"%>
<div class="container">
	<div class="header">
		<div class="row">	
			<div class="col-4"><!-- 페이지명 바꿔서 사용하기 -->
				<h4>나의 정보</h4>
			</div>
			<div class="col-8"><!-- 홈>회원가입 같은 형태 바꿔서 사용하기(나중에 javascript로...) -->
				<ul class="nav justify-content-end small text-muted">
				  <li class="nav-item">
				    <a class="nav-link text-muted active pr-1" href="/domino/common/home.jsp">홈</a>	<!--text-muted pr-1  -->
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled pr-1" href="#" tabindex="-1" aria-disabled="true">></a><!-- pr-1  -->
				  </li>
				  <li class="nav-item">
				    <a class="nav-link text-muted active pr-1" href="/domino/user/detailform.jsp">나의정보</a><!--text-muted active pr-1  -->
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled pr-1" href="#" tabindex="-1" aria-disabled="true">></a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled text-dark font-weight-bold pr-1" href="#" tabindex="-1" aria-disabled="true">매니아등급</a>
				  	<!--text-dark font-weight-bold pr-1  -->
				  </li>
				</ul>
				
			</div>
		</div>
	<div style="background-color: black; height: 2px;" class="mb-2"></div>
			<div class="row">
			<div class="col-12">
				<div class="navbar navbar-expand-sm ">
					<ul class="navbar-nav">
						<li class="nav-item  d-flex justify-content-between align-itens-center small">
							<a class="nav-link <%="usergrade".equals(subPosition) ? "font-weight-bold text-dark" : "text-muted"%>" href="detailform.jsp">매니아등급</a>
						</li>
						<li class="nav-item  d-flex justify-content-between align-itens-center small">
							<a class="nav-link <%="userorder".equals(subPosition) ? "font-weight-bold text-dark" : "text-muted"%>" href="orderlist.jsp">주문내역</a>
						</li>
						<li class="nav-item  d-flex justify-content-between align-itens-center small">
							<a class="nav-link <%="userques".equals(subPosition) ? "font-weight-bold text-dark" : "text-muted"%>" href="questionform.jsp">1:1문의</a>
						</li>
						<li class="nav-item  d-flex justify-content-between align-itens-center small">
							<a class="nav-link <%="usermodi".equals(subPosition) ? "font-weight-bold text-dark" : "text-muted"%>" href="modifyform.jsp">정보수정</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		
	</div>
	<div class="body">
		<%
			UserDao userDao = new UserDao();
			User user = userDao.getUserByNo(loginUserNo);
			UserDto userDto = userDao.getTotalPriceUserByNo(loginUserNo);
			
			GradeDao gradeDao = new GradeDao();
			List<Grade> grades = gradeDao.getAllGrades();
			String nextGrade = "";
			int simpleCount = user.getOrderCount()/5 + 1;
			for (Grade grade : grades) { 
				int simpleStandard = grade.getOrderCount()/5;
				if (simpleCount>=simpleStandard) {
					nextGrade = grade.getName();
					break;
				}
			}
			Grade grade = gradeDao.getGradeByName(user.getGradeName());
			if (grade == null) {
				grade = new Grade();
				grade.setName("Regular");
				grade.setDiscountRate(0.0);
			}
			String counterDisplay = "";
			if ("Royal".equalsIgnoreCase(user.getGradeName())) {
				counterDisplay = "none";
			}
			
		%>
		<div class="row">
			<div class="col-12">
				<div class="jumbotron bg-dark text-white">
					<div class="row">
						<div class="col-5">
						  <h4><%=loginUserName %> 회원님</h4>
						  <p class="display-4 font-weight-bold"><%=user.getGradeName() == null ? "Regular" : user.getGradeName()%></p><!-- 등급불러오기 -->
						</div>
						<div class="col-3" style="border-left: 1px solid white; border-right: 1px solid white;">
							<p class="text-muted"><small>주문</small></p>
							<p class="text-muted pb-0 mb-0"><small>마지막 주문일자 : <%=user.getGradeDate() %></small></p>
							<p class="text-muted pt-0 mt-0"><small>(해당 일자로부터 1년 유효기간입니다.)</small></p>
							<p class="display-4 text-center font-weight-bold"><%=user.getOrderCount() %></p>
						</div>
						<div class="col-4">
							<p class="text-muted"><small>총 주문금액</small></p>
							<p class="text-muted pb-0 mb-0"><small>등급 갱신일자 : <%=user.getGradeDate() %></small></p>
							<p class="text-muted pt-0 mt-0"><small>(해당 일자로부터 1년 유효기간입니다.)</small></p>
							<p class="display-4 text-center font-weight-bold"><%=NumberUtil.numberWithComma(userDto.getUserTotalPrice()) %> 원</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-5">
						<h5 class="text-left">다음 등급<strong style="font-size: 14px; color: red;"><%="Royal".equals(user.getGradeName()) ? "(현재 최고 등급)" : "(" + nextGrade +")" %></strong>으로 업그레이드 하려면?</h5>
					</div>
					<div class="col-7">
						<div class="text-right text-muted small">*1년간 완료된 주문에 대해서 주문건 수를 기준으로 1년된 1일에 매니아 등급에 반영됩니다.</div>
					</div>
				</div>
				<div class="mb-2" style="background-color: black; height: 2px;"></div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-12">	
				<div class="row py-3 font-weight-bold">
					<div class="col-6">
						<div class="text-left px-5">주문건수(<%=user.getOrderCount() %>)</div>
					</div>
					<div class="col-6">
						<div class="text-right px-5">목표등급 </div>
					</div>
				</div>
				<div class="row justify-content-center " >
					<div class="col-10 mt-2" >
						<div class="progress ml-3" style="height: 2rem;" >
							<div class="progress-bar" role="progressbar" aria-valuenow="<%=user.getOrderCount()%5 %>" aria-valuemin="0" aria-valuemax="100" style="width: <%="Royal".equals(user.getGradeName()) ? 100 : user.getOrderCount()%5 * 20 %>%"></div>
						</div>
						<div>
							<div class="text-right" style="width: <%="Royal".equals(user.getGradeName()) ? 100 : user.getOrderCount()%5 * 20 %>%">
								<span id="order-counter" class="mt-2 badge badge-dark badge-pill" style="display: <%=counterDisplay %>"><%=5 - user.getOrderCount()%5 %>건 더 구매</span>
							</div>
						</div>
					</div>
					<div class="col-2">
						<div>
							<p class="font-weight-bold text-center" style="font-size: 30px; color: blue;"><%="Royal".equals(user.getGradeName()) ? "" : nextGrade %></p>
						</div>
					</div>
				</div>
				<div class="mb-5 mt-2" style="background-color: lightgray; height: 2px;"></div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-12">
						<h4 class="text-left">나의 등급 혜택</h4>
					</div>
				</div>
				<div class="mb-2" style="background-color: black; height: 2px;"></div>
				<div class="row">
					<div class="col-12">
						<p class="text-center mt-5 font-weight-bold" style="font-size: 20px;">배달주문 <strong style="color: red"><%=(grade.getDiscountRate() * 100) %>%</strong> 할인</p>
						<p class="text-center text-muted" style="font-size: 16px;">할인율은 주문 시 매장 할인율과 등급 할인율 중 더 높은 혜택 하나만 적용됩니다.</p>
						<p class="text-center mb-5 text-muted" style="font-size: 16px;">단, 피자 이벤트로 발생한 가격 할인은 매장/등급 할인과 중복 적용이 가능합니다.</p>
					</div>
				</div>
				<div class="mb-5" style="background-color: black; height: 1px;"></div>
			</div>
		</div>
		
	</div>
	<div class="mb-3"></div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>