<%@page import="com.domino.vo.Pizza"%>
<%@page import="java.util.List"%>
<%@page import="com.domino.dao.PizzaDao"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@page import="com.domino.vo.Event"%>
<%@page import="com.domino.dao.EventDao"%>
<%@page import="com.domino.util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		String position = "manager";
	%>
	<%@ include file="../common/navbar.jsp"%>
	<div class="container">
		<div class="header">
			<div class="row">
				<div class="col-4">
					<!-- 페이지명 바꿔서 사용하기 -->
					<h4>관리자</h4>
				</div>

				<div class="col-8">
					<ul class="nav justify-content-end">
						<li class="nav-item"><a class="nav-link active" href="#">홈</a></li>
						<li class="nav-item"><a class="nav-link disabled" href="#"
							tabindex="-1" aria-disabled="true">></a></li>
						<li class="nav-item"><a class="nav-link active" href="#">관리자</a></li>
						<li class="nav-item"><a class="nav-link disabled" href="#"
							tabindex="-1" aria-disabled="true">></a></li>
						<li class="nav-item"><a class="nav-link disabled" href="#">이벤트</a></li>
					</ul>
				</div>
			</div>
			<div style="background-color: black; height: 2px;" class="mb-2"></div>
			<div class="row ">
				<div class="col-12">			
					<div class="navbar navbar-expand-sm ">
						<ul class="navbar-nav">
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-muted " href="info.jsp">메인</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-muted " href="orderlist.jsp">주문</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-muted" href="menulist.jsp">메뉴</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-dark font-weight-bold" href="eventlist.jsp">이벤트</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-muted" href="qnaboard.jsp">1:1문의</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-muted" href="branchlist.jsp">가맹점</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="body">
			<div class="row">
				<div class="col-12">
					<div class="card ">
						<div class="card-body">
						<%
							String yn = StringUtil.nullToValue(request.getParameter("yn"), "n");
							int eventNo = NumberUtil.stringToInt(request.getParameter("eventno"));
							EventDao eventDao = new EventDao();
							Event event = eventDao.getEventByNo(eventNo);
						%>
							<form method="post" action="eventmodify.jsp" enctype="multipart/form-data">
								<input type="hidden" name="eventno" value="<%=eventNo%>">
								<input type="hidden" name="yn" value="<%=yn%>">
							
								<div class="form-group">
									<label>이벤트이름</label> <input type="text" class="form-control"
										name="name" value="<%=event.getName() %>" />
								</div>
								<div class="form-group">
									<label>시작일</label> <input type="date" class="form-control"
										name="startdate" value="<%=event.getStartDate() %>" />
								</div>
								<div class="form-group">
									<label>종료일</label> <input type="date" class="form-control"
										name="enddate" value="<%=event.getEndDate() %>" />
								</div>
								<div class="form-group">
									<label>할인율</label> <input type="text" class="form-control"
										name="discountrate" value="<%=event.getDiscountRate()*100 %>% (입력  예시: 0.2)" />
								</div>
								<%
									PizzaDao pizzaDao = new PizzaDao();
									Pizza pizza = pizzaDao.getPizzaByNo(event.getPizzaNo());
									List<Pizza> pizzas = pizzaDao.getAllPizza();
								%>
								<div class="form-group">
									<label>피자선택</label> <select class="form-control" name="pizzano">
										<%
											for (Pizza piz : pizzas) {
										%>
										<option value="<%=piz.getNo()%>"  
											<%
												if(pizza.getNo()==piz.getNo()) {
											%>
												selected
											<%
												}
											%>
										>
											<%=piz.getNo()%> : <%=piz.getName()%>
										</option>
										<%
											}
										%>
									</select>
								</div>
								<!-- 사진등록 -->
								<div class="form-group">
									<label>
										첨부파일(<%=event.getImageSrc() %>)
									</label>
									<p class="text-danger">이미지 이름 동일하게 해서 업데이트</p>
									<div>
										<input type="file" name="upfile" />
									</div>
								</div>

								<div class="text-right">
									<button type="submit" class="btn btn-primary">수정하기</button>
								</div>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>