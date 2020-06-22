<%@page import="com.domino.util.NumberUtil"%>
<%@page import="com.domino.vo.Etc"%>
<%@page import="com.domino.dao.EtcDao"%>
<%@page import="com.domino.vo.Topping"%>
<%@page import="com.domino.dao.ToppingDao"%>
<%@page import="com.domino.vo.Dough"%>
<%@page import="com.domino.dao.DoughDao"%>
<%@page import="com.domino.dao.SideDao"%>
<%@page import="com.domino.vo.Side"%>
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
			<!-- 페이지네이션  -->
			<%
				// 1. 한 화면에 표시할 행의 갯수
				int rowsPerPage = 20;

				// 2. 클라이언트가 요청한 페이지 번호 조회하기
				int pageNo = NumberUtil.stringToInt(request.getParameter("page"), 1);

				// 3. 조회할 목록의 시작번호와 끝번호를 조회한다.
				int beginNumber = (pageNo - 1) * rowsPerPage + 1;
				int endNumber = pageNo * rowsPerPage;
				
				int rowCount = 0;
			%>
			<div class="row">
				<div class="col-12">
					<form>
						<div class="row">
							<div class="col-6">
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<select id="searchOption" class="form-control" name="searchOption" onchange="changeMenuList()">
											<option value="pizza-menu">피자메뉴</option>
											<option value="side-menu">사이드메뉴</option>
											<option value="dough-menu">도우메뉴</option>
											<option value="topping-menu">토핑메뉴</option>
											<option value="etc-menu">기타메뉴</option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</form>
					
<!-- 피자 메뉴 -->
					<table id="pizza-menu" class="table text-center">
						<colgroup>
							<col width="10%">
							<col width="10%">
							<col width="20%">
							<col width="10%">
							<col width="10%">
							<col width="20%">
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
								<th colspan='2'><a class="btn-sm btn-light"
									href="pizzaform.jsp">신규 피자 등록</a></th>

							</tr>
						</thead>
						<tbody>
						<%
							PizzaDao pizzaDao = new PizzaDao();
							List<Pizza> pizzas = pizzaDao.getAllPizza(beginNumber, endNumber);
							rowCount = pizzaDao.getPizzasCount();
							for (Pizza pizza : pizzas) {
								if ("n".equalsIgnoreCase(pizza.getDisableYn())) {
						%>						
							<tr class="font-weight-bold">
								<td><%=pizza.getNo() %></td>
								<td><%=pizza.getName() %></td>
								<td><%=pizza.getLprice() %>원</td>
								<td><%=pizza.getMprice() %>원</td>
								<td><%=("n".equalsIgnoreCase(pizza.getDisableYn())) ? "아니오":"예" %></td>
								<td>여름방학시즌(피자테이블 + 이벤트테이블 조인)</td>
								<td><a class="btn btn-primary text-light"
									href="pizzamodifyform.jsp?yn=n&pizzano=<%=pizza.getNo() %>">수정</a></td>
								<td>
									<form method="post" action="pizzamodify.jsp" enctype="multipart/form-data">
										<input type="hidden" name="yn" value="y">
										<input type="hidden" name="pizzano" value=<%=pizza.getNo() %>>
										<button class="btn btn-secondary text-light" type="submit">
											비활성
										</button>
									</form>
								</td>
							</tr>
						<%
								} else {
						%>	
							<tr class="text-muted">
								<td ><%=pizza.getNo() %></td>
								<td ><%=pizza.getName() %></td>
								<td ><%=pizza.getLprice() %>원</td>
								<td ><%=pizza.getMprice() %>원</td>
								<td ><%=("n".equalsIgnoreCase(pizza.getDisableYn())) ? "아니오":"예" %></td>
								<td>-</td>
								<td><a class="btn btn-primary text-light"
									href="pizzamodifyform.jsp?yn=n&pizzano=<%=pizza.getNo() %>">수정</a></td>
								<td>
									<form method="post" action="pizzamodify.jsp" enctype="multipart/form-data">
										<input type="hidden" name="yn" value="yn">
										<input type="hidden" name="pizzano" value=<%=pizza.getNo() %>>
										<button class="btn btn-danger text-light" type="submit">
											활성
										</button>
									</form>
								</td>
							</tr>		
						<% 		
								}
							}
						%>
						</tbody>
					</table>										
<!-- 사이드 메뉴 -->
					<table id="side-menu" class=" table text-center">
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
								<th colspan='2'><a class="btn-sm btn-light"
									href="sidemenuform.jsp">신규 사이드 등록</a></th>
							</tr>
						</thead>
						<tbody>
						<%
							SideDao sideDao = new SideDao();
							List<Side> sides = sideDao.getAllSide(beginNumber, endNumber);
							rowCount = sideDao.getSidesCount();
							for (Side side : sides) {
								if ("n".equalsIgnoreCase(side.getDisableYn())) {
						%>
							<tr class="font-weight-bold">
								<td><%=side.getNo() %></td>
								<td><%=side.getName() %></td>
								<td><%=side.getPrice() %></td>
								<td><%=("n".equalsIgnoreCase(side.getDisableYn())) ? "아니오":"예" %></td>
								<td><a class="btn btn-primary text-light"
									href="sidemenumodifyform.jsp?yn=n&sideno=<%=side.getNo() %>">수정</a>
								</td>
								<td>
									<form method="post" action="sidemenumodify.jsp" enctype="multipart/form-data">
										<input type="hidden" name="yn" value="y">
										<input type="hidden" name="sideno" value=<%=side.getNo() %>>
										<button class="btn btn-secondary text-light" type="submit">
											비활성
										</button>
									</form>
								</td>
							</tr>							
						<%
								} else {
						%>
							<tr class="text-muted">
								<td><%=side.getNo() %></td>
								<td><%=side.getName() %></td>
								<td><%=side.getPrice() %></td>
								<td><%=("n".equalsIgnoreCase(side.getDisableYn())) ? "아니오":"예" %></td>
								<td><a class="btn btn-primary text-light"
									href="sidemenumodifyform.jsp?yn=n&sideno=<%=side.getNo() %>">수정</a></td>
								<td>
									<form method="post" action="sidemenumodify.jsp" enctype="multipart/form-data">
										<input type="hidden" name="yn" value="yn">
										<input type="hidden" name="sideno" value=<%=side.getNo() %>>
										<button class="btn btn-danger text-light" type="submit">
											활성
										</button>
									</form>
								</td>
							</tr>
						<%
								}
							}
						%>	
							
						</tbody>
					</table>
<!-- 도우 메뉴 -->
					<table id="dough-menu" class=" table text-center">
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
								<th colspan='2'><a class="btn-sm btn-light"
									href="doughform.jsp">신규 도우 등록</a></th>
							</tr>
						</thead>
						<tbody>
						<%
							DoughDao doughDao = new DoughDao();
							List<Dough> doughs = doughDao.getAllDough(beginNumber, endNumber);
							rowCount = doughDao.getDoughsCount();
							for (Dough dough : doughs) {
								if ("N".equalsIgnoreCase(dough.getDisableYn())) {
						%>
							<tr class="font-weight-bold">
								<td><%=dough.getNo() %></td>
								<td><%=dough.getName() %></td>
								<td><%=dough.getPrice() %></td>
								<td><%=("N".equalsIgnoreCase(dough.getDisableYn())) ? "아니오":"예" %></td>								
								<td><a class="btn btn-primary text-light"
									href="doughmodifyform.jsp?yn=n&doughno=<%=dough.getNo() %>">수정</a></td>
								<td>
									<form method="post" action="doughmodify.jsp" enctype="multipart/form-data">
										<input type="hidden" name="yn" value="y">
										<input type="hidden" name="doughno" value=<%=dough.getNo() %>>
										<button class="btn btn-secondary text-light" type="submit">
											비활성
										</button>
									</form>
								</td>
							</tr>						
						<%
								} else {
						%>
							<tr class="text-muted">
								<td><%=dough.getNo() %></td>
								<td><%=dough.getName() %></td>
								<td><%=dough.getPrice() %></td>
								<td><%=("N".equalsIgnoreCase(dough.getDisableYn())) ? "아니오":"예" %></td>								
								<td><a class="btn btn-primary text-light"
									href="doughmodifyform.jsp?yn=n&doughno=<%=dough.getNo() %>">수정</a></td>
								<td>
									<form method="post" action="doughmodify.jsp" enctype="multipart/form-data">
										<input type="hidden" name="yn" value="yn">
										<input type="hidden" name="doughno" value=<%=dough.getNo() %>>
										<button class="btn btn-danger text-light" type="submit">
											활성
										</button>
									</form>
								</td>
							</tr>
						<%
								}
							}
						%>
						</tbody>
					</table>
<!-- 토핑 메뉴 -->
					<table id="topping-menu" class=" table text-center">
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
								<th colspan='2'><a class="btn-sm btn-light"
									href="toppingform.jsp">신규 토핑 등록</a></th>
							</tr>
						</thead>
						<tbody>
						<%
							ToppingDao toppingDao = new ToppingDao();
							List<Topping> toppings = toppingDao.getAllTopping(beginNumber, endNumber);
							rowCount = toppingDao.getToppingsCount();
							for (Topping topping : toppings) {
								if ("N".equalsIgnoreCase(topping.getDisableYn())) {
						%>
							<tr class="font-weight-bold">
								<td><%=topping.getNo() %></td>
								<td><%=topping.getName() %></td>
								<td><%=topping.getCategory() %></td>
								<td><%=topping.getPrice() %></td>
								<td><%=("N".equalsIgnoreCase(topping.getDisableYn())) ? "아니오":"예" %></td>								
								<td><a class="btn btn-primary text-light"
									href="toppingmodifyform.jsp?yn=n&toppingno=<%=topping.getNo() %>">수정</a></td>
								<td>
									<form method="post" action="toppingmodify.jsp" enctype="multipart/form-data">
										<input type="hidden" name="yn" value="y">
										<input type="hidden" name="toppingno" value=<%=topping.getNo() %>>
										<button class="btn btn-secondary text-light" type="submit">
											비활성
										</button>
									</form>
								</td>
							</tr>
						<%
								} else {
						%>
							<tr class="text-muted">
								<td><%=topping.getNo() %></td>
								<td><%=topping.getName() %></td>
								<td><%=topping.getCategory() %></td>
								<td><%=topping.getPrice() %></td>
								<td><%=("N".equalsIgnoreCase(topping.getDisableYn())) ? "아니오":"예" %></td>								
								<td><a class="btn btn-primary text-light"
									href="toppingmodifyform.jsp?yn=n&toppingno=<%=topping.getNo() %>">수정</a></td>
								<td>
									<form method="post" action="toppingmodify.jsp" enctype="multipart/form-data">
										<input type="hidden" name="yn" value="yn">
										<input type="hidden" name="toppingno" value=<%=topping.getNo() %>>
										<button class="btn btn-danger text-light" type="submit">
											활성
										</button>
									</form>
								</td>
							</tr>
						<%
								}
							}
						%>
						</tbody>
					</table>
<!-- 기타 메뉴 -->
					<table id="etc-menu" class=" table text-center">
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
								<th colspan='2'><a class="btn-sm btn-light"
									href="etcmenuform.jsp">신규 기타 메뉴 등록</a></th>
							</tr>
						</thead>
						<tbody>
						<%
							EtcDao etcDao = new EtcDao();
							List<Etc> etcs = etcDao.getAllEtc(beginNumber, endNumber);
							rowCount = etcDao.getEtcsCount();
							for (Etc etc : etcs) {
								if ("N".equalsIgnoreCase(etc.getDisableYn())) {
						%>
							<tr class="font-weight-bold">
								<td><%=etc.getNo() %></td>
								<td><%=etc.getName() %></td>
								<td><%=etc.getPrice() %></td>
								<td><%=("N".equalsIgnoreCase(etc.getDisableYn())) ? "아니오":"예" %></td>
								<td><a class="btn btn-primary text-light"
									href="etcmenumodifyform.jsp?yn=n&etcno=<%=etc.getNo() %>">수정</a></td>
								<td>
									<form method="post" action="etcmenumodify.jsp" enctype="multipart/form-data">
										<input type="hidden" name="yn" value="y">
										<input type="hidden" name="etcno" value=<%=etc.getNo() %>>
										<button class="btn btn-secondary text-light" type="submit">
											비활성
										</button>
									</form>
								</td>
							</tr>
						<%
								} else {
						%>
							<tr class="text-muted">
								<td><%=etc.getNo() %></td>
								<td><%=etc.getName() %></td>
								<td><%=etc.getPrice() %></td>
								<td><%=("N".equalsIgnoreCase(etc.getDisableYn())) ? "아니오":"예" %></td>
								<td><a class="btn btn-primary text-light"
									href="etcmenumodifyform.jsp?yn=n&etcno=<%=etc.getNo() %>">수정</a></td>
								<td>
									<form method="post" action="etcmenumodify.jsp" enctype="multipart/form-data">
										<input type="hidden" name="yn" value="yn">
										<input type="hidden" name="etcno" value=<%=etc.getNo() %>>
										<button class="btn btn-danger text-light" type="submit">
											활성
										</button>
									</form>
								</td>
							</tr>
						<%
								}
							}
						%>
						</tbody>
					</table>
					
					
					

				</div>
			</div>
		</div>

	</div>
	<%@ include file="../common/footer.jsp"%>
	<script type="text/javascript">
		// 해당 페이지 로딩과 동시에 실행
		window.onload = changeMenuList();
			
		// 메뉴리스트에서 선택된 메뉴를 보여주는 함수
		function changeMenuList() {
			// 수정 후 리스트를 불러왔을때 쿼리스트링 값 저장
			var queryTarget = window.location.search.split('=')[1];
			
			// 메뉴리스트를 조회한다.
			var target = document.getElementById("searchOption");	
			
			// 수정 후 넘오왔는지를 검사
			var value;
			// 메뉴 선택으로 리스트를 불러왔을때
			if(!queryTarget){
				// 선택된 option의 value값을 조회한다.
				value = target.options[target.selectedIndex].value;
			// 수정 후 리스트를 불러왔을때
			} else {
				value = queryTarget+"-menu";
			}

			// 모든 메뉴테이블을 조회한다. 
			var allTable = document.querySelectorAll('table');
			
			// 조회된 모든 테이블을 'display : none' 한다.
			for (var i = 0; i < allTable.length; i++) {
				var table = allTable[i];
				
				table.setAttribute('style', 'display : none');
			}

			// value값과 일치하는 targetTable을 조회한다.
			var targetTable = document.getElementById(value);
			
			
			// 조회된 테이블을 'display : block' 한다.
			targetTable.setAttribute('style', 'display : block');
			
			// 주소창 parameter 제거
			history.replaceState({}, null, "menulist.jsp");
			
			//수정 후 셀렉트바와 테이블 일치시키기
			var opt = document.getElementById("searchOption");
			for(var i=0; i<opt.options.length; i++){
				var optValue = opt.options[i].value;
				if(value == optValue){				
					opt.options[i].setAttribute("selected", "selected");
				}
			}
		}
		
	</script>
</body>
</html>