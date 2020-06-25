<%@page import="com.domino.util.NumberUtil"%>
<%@page import="com.domino.dto.EtcOrderDto"%>
<%@page import="com.domino.dao.EtcDetailDao"%>
<%@page import="com.domino.dto.SideOrderDto"%>
<%@page import="com.domino.dao.SideDetailDao"%>
<%@page import="com.domino.dao.PizzaDetailDao"%>
<%@page import="com.domino.dto.PizzaOrderDto"%>
<%@page import="com.domino.vo.Branch"%>
<%@page import="com.domino.dao.BranchDao"%>
<%@page import="com.domino.vo.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.domino.dao.OrderDao"%>
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
	String subPosition = "userorder";
%>
<%@ include file="../common/navbar.jsp"%>
<div class="container">
	<div class="header">
		<div class="row">	
			<div class="col-4">
				<h4>나의 정보</h4>
			</div>
			<div class="col-8">
				<ul class="nav justify-content-end small text-muted">
				  <li class="nav-item">
				    <a class="nav-link text-muted active pr-1" href="/domino/common/home.jsp">홈</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled pr-1" href="#" tabindex="-1" aria-disabled="true">></a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link text-muted active pr-1" href="/domino/user/detailform.jsp">나의정보</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled pr-1" href="#" tabindex="-1" aria-disabled="true">></a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled text-dark font-weight-bold pr-1" href="#" tabindex="-1" aria-disabled="true">주문내역</a>
				  </li>
				</ul>
			</div>
		</div>
		<div style="background-color: black; height: 2px;" class="mb-2"></div>
		<div id="userinfo-navbar" class="row">
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
		%>	
		<div id="page-header" class="row">
			<div class="col-12">
				<div class="jumbotron bg-dark text-white">
					<div class="row">
						<div class="col-9">
							<h2 class=""><%=loginUserName %>님이 주문하신 내역입니다.</h2>
							<div style="background-color: #00B9FF; height: 4px; width:60%;" class="my-3"></div>
							<p class="text-muted">주문을 취소하시려면 해당 매장으로 전화하셔야 합니다.</p>
						</div>
						<div class="col-3 text-right d-flex align-items-center justify-content-end"> <!-- 이용안내 만들기 -->
							<button type="button" class="btn btn-link btn-sm text-muted " data-toggle="modal" data-target="#exampleModal">
							  이용안내 > 
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="modal-container" class="row">
			<div class="col-12">
				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-scrollable">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h4 class="modal-title font-weight-bold text-muted" id="exampleModalLabel">주문내역 이용안내</h4>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				      	<div class="row m-1 ">
							<div class="col-12 pb-4">
				        		<h5 class="font-weight-bold ">주문내역 이용안내</h5>
				        		<div class="text-black-50 font-weight-bold" style="font-size: 15px;">
					        		<p>- 매장(1577-3082) 또는 콜센터(080-860-3082) / 다른 이름으로 주문하신 내역은 온라인 주문내역에 표시되지 않습니다.</p>
					        		<p>- 온라인 상으로 주문한 최초의 이력만 확인하실 수 있으며, 전화를 통해 변경하신 사항은 반영되지 않습니다.</p>
					        		<p>- 주문번호를 클릭하시면 상세정보(주문번호/배달장소/주문내역 등) 를 확인하실 수 있습니다.</p>
					        		<p>- 메뉴 변경이나 주문취소를 원하실 경우, 매장에 주문번호를 알려 주셔야 합니다. (온라인으로 주문취소는 불가합니다.)</p>
					        		<p>- 결제방법을 수정하실 경우에는 해당 매장으로 직접 연락하셔야 하며, 배달 중에는 변경 불가합니다.</p>
					        		<p>- 영수증 출력을 원하시는 고객님은 주문상세 페이지의 ‘영수증 출력’을 클릭하시면, 해당 주문의 영수증을 출력할 수 있습니다.</p>
					        		<p>- 주문이력은 최대 1년까지 확인 가능합니다.</p>
					        		<p>- 피자주문이력은 최근 3개월 내역까지만 삭제 가능합니다.</p>
				        		</div>
				        	</div>
				        </div>
				        <div style="background-color: black; height: 1px; width:100%;"></div>
			        	<div class="row m-1 ">
							<div class="col-12 pt-4">
								<h5 class="font-weight-bold">상품권 주문취소 안내</h5>
				        		<div class="text-black-50 font-weight-bold mt-3" style="font-size: 15px;">
				        			<p class="text-dark mb-0">지류 상품권</p>
					        		<p>- 피자 상품권이 발송된 이후에는 취소가 불가능합니다</p>
					        		<p>- 주문 취소 접수 시, 신용카드 취소는 5~7일 이내에 해당 카드사 에서 취소내역을 확인하실 수 있습니다.</p>
					        		<p class="text-dark mb-0">모바일 상품권</p>
					        		<p>- 구매 시 입력하신 휴대전화번호로 MMS 발송 후에는 취소가 불가 능합니다.</p>
				        		</div>
							</div>
						</div>
				      </div>
				      <div class="modal-footer">
				       	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				  </div>
				</div>
			</div>
		</div>
		<div id="page-body-orderlist">
			<div id="orderlist-header" class="row">
				<div class="col-12">
					<p class="	text-center font-weight-bold" style="border: 1px solid black; border-bottom: none;">피자 주문</p>
				</div>
			</div>
		<%
			int rowsPerPage = 5;
			int pageNo = NumberUtil.stringToInt(request.getParameter("page"), 1);
			
			int begin = (pageNo-1) * rowsPerPage + 1;
			int end = pageNo * rowsPerPage;
			// 주문목록 가져오기
			// !!주문목록 페이징 처리하기!!
			OrderDao orderDao = new OrderDao();
			List<Order> ol = orderDao.getOrdersByUserNoAndRange(loginUserNo, begin, end);
			if (ol.isEmpty()) {
		%>		
			<div id="orderlist-empty" class="row">
				<div class="col-12">
					<div class="m-4 p-4 text-center font-weight-bold">
						<p>주문내역이 없습니다.</p>
					</div>
				</div>
			</div>
		<%
			} else {
				for (Order order : ol) {
					int orderNo = order.getNo();
					
					BranchDao branchDao = new BranchDao();
					Branch branch = branchDao.getBranchByNo(order.getBranchNo());
					
					PizzaDetailDao pizzaDetailDao = new PizzaDetailDao();
					List<PizzaOrderDto> pol = pizzaDetailDao.getPizzaOrdersByOrderNo(orderNo);
					
					SideDetailDao sideDetailDao = new SideDetailDao();
					List<SideOrderDto> sol = sideDetailDao.getSideOrdersByOrderNo(orderNo);
					
					EtcDetailDao etcDetailDao = new EtcDetailDao();
					List<EtcOrderDto> eol = etcDetailDao.getEtcOrdersByOrderNo(orderNo);
					
					int totalCount = pol.size() + sol.size() + eol.size();
					String simpleOrderTitle = "";
					if (!pol.isEmpty()) {
						simpleOrderTitle = pol.get(0).getPizzaName() + " (" + pol.get(0).getDoughName() + ")" + (totalCount > 1 ? " 외 " + (totalCount - 1) + "건" : "");
					} else if(!eol.isEmpty()) {
						simpleOrderTitle = sol.get(0).getSideName() + (totalCount > 1 ? "외 " + (totalCount - 1) + "건" : "");
					}
					
					int orderStatus = order.getOrderStatus();
					String statusString = "";
					if (orderStatus == 0) {
						statusString = "접수완료";
					} else if (orderStatus == 1) {
						statusString = "요리중";
					} else if (orderStatus == 2) {
						statusString = "배달중";
					} else if (orderStatus == 3) {
						statusString = "배달완료";
					} else if(orderStatus == 4) {
						statusString = "수령완료";
					} else {
						statusString = "주문취소";
					}
		%>	
			<div style="background-color: black; height: 2px;" class="mb-2"></div>
			<div id="orderlist-list" class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<div class="row small font-weight-bold">
								<div class="col-6 text-left"> 
									<div class="row">
										<div class="col-2">
											<p>배달주문</p>
										</div>
										<div class="col-5">
											<p>주문일자 <%=order.getRegDate() %></p>
										</div>
										<div class="col-5">
											<p>주문번호 <%=orderNo %></p>
										</div>
									</div>
								</div>
								<div class="col-6 text-right"> 
									<div class="row">
										<div class="col-6"></div>
										<div class="col-3">
											<div><a class="text-dark" href="../order/reorder.jsp?orderno=<%=orderNo %>">+재주문하기</a></div>
										</div>	
										<div class="col-3">
											<div><a class="text-muted" href="#" onclick="addQuickOrder(<%=orderNo %>)">+퀵오더등록</a></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="card-body row">
							<div class="col-2 text-center">
								<h4 class=""><%=statusString %></h4>
								<p class="small text-muted"><%=branch.getName() %> <%=branch.getTel() %></p>
							</div>
							<div class="col-7 text-center">
								<p><%=simpleOrderTitle %> <%=NumberUtil.numberWithComma(order.getDiscountPrice()) %>원</p>
							</div>
							<div class="col-3 text-right text-white">
								<a type="button" href="orderdetail.jsp?orderno=<%=orderNo %>" class="btn btn-dark small font-weight-bold">상세보기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="orderlist-footer" class="row">
			
				<div class="col-12">
					<div class="text-center" style="border-top: 1px solid lightgray;">
		<%
				}
			}
		%>
						<ul class="pagination justify-content-center" style="margin: 20px 0">
						<%
							// 0. 한 화면당 표시할 페이지번호 갯수
							int pagesPerBlock = 5;
	
							// 2. 전체 페이지수를 계산한다.
							int rowCount = orderDao.getOrdersByUserNo(loginUserNo).size();
							int totalPages = (int) Math.ceil((double) rowCount / rowsPerPage);
	
							// 3. 전체 페이지블록 갯수 계산하기
							int totalBlocks = (int) Math.ceil((double) totalPages / pagesPerBlock);
	
							// 4. 요청한 페이지가 어느 페이지 블록에 속하는지 계산하기
							int currentBlock = (int) Math.ceil((double) pageNo / pagesPerBlock);
	
							// 5. 요청한 페에지가 속한 블록의 시작페이지번호와 끝페이지번호 계산하기
							int beginPageNo = (currentBlock - 1) * pagesPerBlock + 1;
							int endPageNo = currentBlock * pagesPerBlock;
							
							if(pageNo > 1) {
						%>
							<li class="page-item "><a class="page-link" href="orderlist.jsp?page=<%=pageNo - 1%>">이전</a></li>
						<%
							}
							for(int num=beginPageNo; num <=endPageNo; num++) {
								if (endPageNo > totalPages) {
									endPageNo = totalPages;
								}
						%>
							<li class="page-item <%=pageNo == num ? "active" : ""%> "><a class="page-link" href="orderlist.jsp?page=<%=num%>"><%=num%></a></li>
						<%
							}
							if(pageNo < totalPages) {
						%>
							<li class="page-item"><a class="page-link" href="orderlist.jsp?page=<%=pageNo + 1%>">다음</a></li>
						<%
							}
						%>
					</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="page-footer" class="row mt-5 mb-5">
			<div class="col-12 text-center">
				<a href="/domino/event/eventlist.jsp"><button class="btn btn-outline-secondary btn-lg" style="width: 200px; height: 65px;" role="button">이벤트 보기</button></a>&ensp;
				<a href="/domino/pizza/pizzamenu.jsp"><button class="btn btn-primary btn-lg" style="width: 200px; height: 65px;" role="button">다른 제품 보기</button></a>
			</div>
		</div>
	</div>
	<div class="mb-3"></div>
</div>
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
	function addQuickOrder(orderNo) {
		if (confirm("해당 주문을 퀵 오더로 등록하시겠습니까?")) {
			var xhr = new XMLHttpRequest();
			
			xhr.onreadystatechange = function () {
				if (xhr.readyState ==4 && xhr.status == 200) {
					alert("주문번호 [" + orderNo + "] 주문이 회원님의 퀵 오더로 등록되었습니다.");
				}
			}
			xhr.open("GET", "../order/registerqo.jsp?orderno=" + orderNo);
			
			xhr.send();
		} else {
			alert("퀵 오더 등록을 취소했습니다.")
		}
	}
</script>
</body>
</html>