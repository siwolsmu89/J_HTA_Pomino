<%@page import="com.domino.vo.Pizza"%>
<%@page import="java.util.List"%>
<%@page import="com.domino.dao.PizzaDao"%>
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
						<li class="nav-item"><a class="nav-link disabled" href="#">메뉴</a></li>
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
								class="nav-link text-dark font-weight-bold" href="menulist.jsp">메뉴</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-muted" href="eventlist.jsp">이벤트</a></li>
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
					<form>
						<div class="row">
							<div class="col-6">
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<select class="form-control" name="searchOption">
											<option value="pizza">피자메뉴</option>
											<option value="sidemenu">사이드메뉴</option>
											<option value="dough">도우메뉴</option>
											<option value="topping">토핑메뉴</option>
											<option value="etcmenu">기타메뉴</option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</form>
					<!-- 피자 메뉴 -->
					<%
						PizzaDao pizzaDao = new PizzaDao();
						List<Pizza> pizzas = pizzaDao.getAllPizza();
					%>
					<table id="pizza-menu" class="table text-center">
						<colgroup>
							<col width="10%">
							<col width="10%">
							<col width="20%">
							<col width="10%">
							<col width="10%">
							<col width="15%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead class="thead-dark">
							<tr>
								<th>번호</th>
								<th>이름</th>
								<th>L가격</th>
								<th>M가격</th>
								<th>단종여부</th>
								<th>이벤트</th>
								<th colspan='2'><a class="btn btn-light"
									href="pizzaform.jsp">신규 피자 등록</a></th>

							</tr>
						</thead>
						<tbody>
						<%
							for(Pizza pizza : pizzas) {
						%>						
							<tr>
								<td><%=pizza.getNo() %></td>
								<td><%=pizza.getName() %></td>
								<td><%=pizza.getLprice() %>원</td>
								<td><%=pizza.getMprice() %>원</td>
								<td><%=pizza.getDisableYn() %></td>
								<td>여름방학시즌(피자테이블 + 이벤트테이블 조인)</td>
								<td><a class="btn btn-primary text-light"
									href="pizzamodifyform.jsp">수정</a></td>
								<td><a class="btn btn-danger text-light">비활성</a></td>
							</tr>
						<%
							}
						%>
						</tbody>
					</table>
					<!-- 페이지 처리 시작 -->
					<ul class="pagination justify-content-center"
						style="margin: 20px 0">
						<li class="page-item "><a class="page-link" href="#">이전</a></li>
						<li class="page-item active"><a class="page-link" href="#">1</a></li>
						<li class="page-item "><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#">다음</a></li>
					</ul>
					<!-- 페이지 처리 끝 -->

					<!-- 사이드 메뉴 -->
					<table id="side-menu" class="table text-center">
						<colgroup>
							<col width="20%">
							<col width="20%">
							<col width="20%">
							<col width="20%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead class="thead-dark">
							<tr>
								<th>번호</th>
								<th>이름</th>
								<th>가격</th>
								<th>단종여부</th>
								<th colspan='2'><a class="btn btn-light"
									href="sidemenuform.jsp">신규 사이드 등록</a></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>크리스피 핫 순살 치킨(8조각)</td>
								<td>4,800원</td>
								<td>N</td>
								<td><a class="btn btn-primary text-light"
									href="sidemenumodifyform.jsp">수정</a></td>
								<td><a class="btn btn-danger text-light">비활성</a></td>
							</tr>
						</tbody>
					</table>
					<!-- 페이지 처리 시작 -->
					<ul class="pagination justify-content-center"
						style="margin: 20px 0">
						<li class="page-item "><a class="page-link" href="#">이전</a></li>
						<li class="page-item active"><a class="page-link" href="#">1</a></li>
						<li class="page-item "><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#">다음</a></li>
					</ul>
					<!-- 페이지 처리 끝 -->

					<!-- 도우 메뉴 -->
					<table id="doughs-menu" class="table text-center">
						<colgroup>
							<col width="20%">
							<col width="20%">
							<col width="20%">
							<col width="20%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead class="thead-dark">
							<tr>
								<th>번호</th>
								<th>이름</th>
								<th>가격</th>
								<th>단종여부</th>
								<th colspan='2'><a class="btn btn-light"
									href="doughform.jsp">신규 도우 등록</a></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>슈퍼시드 함유 도우</td>
								<td>2,000원</td>
								<td>N</td>
								<td><a class="btn btn-primary text-light"
									href="doughmodifyform.jsp">수정</a></td>
								<td><a class="btn btn-danger text-light">비활성</a></td>
							</tr>
							<tr>
								<td>2</td>
								<td>오리지널 도우</td>
								<td>0원</td>
								<td>N</td>
								<td><a class="btn btn-primary text-light"
									href="doughmodifyform.jsp">수정</a></td>
								<td><a class="btn btn-danger text-light">비활성</a></td>
							</tr>
						</tbody>
					</table>
					<!-- 페이지 처리 시작 -->
					<ul class="pagination justify-content-center"
						style="margin: 20px 0">
						<li class="page-item "><a class="page-link" href="#">이전</a></li>
						<li class="page-item active"><a class="page-link" href="#">1</a></li>
						<li class="page-item "><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#">다음</a></li>
					</ul>
					<!-- 페이지 처리 끝 -->

					<!-- 토핑 메뉴 -->
					<table id="topping-menu" class="table text-center">
						<colgroup>
							<col width="10%">
							<col width="20%">
							<col width="20%">
							<col width="20%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead class="thead-dark">
							<tr>
								<th>번호</th>
								<th>이름</th>
								<th>카테고리</th>
								<th>가격</th>
								<th>단종여부</th>
								<th colspan='2'><a class="btn btn-light"
									href="toppingform.jsp">신규 토핑 등록</a></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>오리엔탈 통새우</td>
								<td>메인</td>
								<td>3,500원</td>
								<td>N</td>
								<td><a class="btn btn-primary text-light"
									href="toppingmodifyform.jsp">수정</a></td>
								<td><a class="btn btn-danger text-light">비활성</a></td>
							</tr>
						</tbody>
					</table>
					<!-- 페이지 처리 시작 -->
					<ul class="pagination justify-content-center"
						style="margin: 20px 0">
						<li class="page-item "><a class="page-link" href="#">이전</a></li>
						<li class="page-item active"><a class="page-link" href="#">1</a></li>
						<li class="page-item "><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#">다음</a></li>
					</ul>
					<!-- 페이지 처리 끝 -->

					<!-- 기타 메뉴 -->
					<table id="etc-menu" class="table text-center">
						<colgroup>
							<col width="20%">
							<col width="20%">
							<col width="20%">
							<col width="20%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead class="thead-dark">
							<tr>
								<th>번호</th>
								<th>이름</th>
								<th>가격</th>
								<th>단종여부</th>
								<th colspan='2'><a class="btn btn-light"
									href="etcmenuform.jsp">신규 기타 메뉴 등록</a></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>코카콜라1.25L</td>
								<td>2,000원</td>
								<td>N</td>
								<td><a class="btn btn-primary text-light"
									href="etcmenumodifyform.jsp">수정</a></td>
								<td><a class="btn btn-danger text-light">비활성</a></td>
							</tr>

						</tbody>
					</table>
					<!-- 페이지 처리 시작 -->
					<ul class="pagination justify-content-center"
						style="margin: 20px 0">
						<li class="page-item "><a class="page-link" href="#">이전</a></li>
						<li class="page-item active"><a class="page-link" href="#">1</a></li>
						<li class="page-item "><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#">다음</a></li>
					</ul>
					<!-- 페이지 처리 끝 -->

					<!-- 검색조건, 정렬기준, 테이블, 페이지처리 내용을 포함하는 card 끝 -->
				</div>
			</div>
		</div>

	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>