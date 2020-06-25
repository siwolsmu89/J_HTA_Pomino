<%@page import="com.domino.vo.Branch"%>
<%@page import="com.domino.dao.BranchDao"%>
<%@page import="com.domino.vo.Location"%>
<%@page import="java.util.List"%>
<%@page import="com.domino.dao.LocationDao"%>
<%@page import="com.domino.vo.Order"%>
<%@page import="com.domino.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>포미노피자 - 당신의 인생에 완벽한 한끼! Life Food,Pomino's</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<%@include file="../common/logincheck.jsp" %>
<% String position = "order"; %>
<%@ include file="../common/navbar.jsp"%>
<div class="container">
	<div class="header">
		<div class="row">	
			<div class="col-4">
				<h4>주문방법 선택</h4>
			</div>
			<div class="col-8">
				<ul class="nav justify-content-end small text-muted">
				  <li class="nav-item">
				    <a class="nav-link text-muted active pr-1" href="/domino/common/home.jsp">홈</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled pr-1" tabindex="-1" aria-disabled="true">></a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled text-dark font-weight-bold pr-1" href="#" tabindex="-1" aria-disabled="true">주문방법 선택</a>
				  </li>
				</ul>
			</div>
		</div>
	</div>
	<div style="background-color: black; height: 3px;" class="mt-2"></div>
	<div class="body">
		<div class="row">
			<div class="col-12">
				<div class="card mt-4">
			
				<div class="card-header">
					<h5 class="ml-2 font-weight-bold mt-2">배송지 리스트</h5>
				</div>
	<%
		LocationDao ld = new LocationDao();
		List<Location> ll = ld.getLocationsByUserNo(loginUserNo);
		OrderDao orderDao = new OrderDao();
		Order order = orderDao.getCartByUserNo(loginUserNo);
		if (ll.isEmpty()) {
	%>
				<div class="card-body text-center">
					<br/>
					<br/>
					<h4><img alt="주의" src="../resource/images/order/warning.PNG">배달 주소를 등록해 주세요.</h4>
				</div>
				<div class="card-body text-center">
					<button type="button"  class="btn btn-outline-secondary btn-lg"
									data-toggle="modal" data-target="#locationbutton" style="width: 200px; height: 65px;">+ 배달주소 등록
					</button>
				</div>
				<hr/>
				<div class="card-body text-right">
					<p style="color: #ff7f00">*배달주소는 최대 10개까지만 등록 가능합니다.</p>
				</div>
	<%
		} else {
	%>
				<div class="card-body">
	<%
				int size = ll.size();
				for (int i=0; i<size; i++) {
					BranchDao branchDao = new BranchDao();
					Branch branch = branchDao.getBranchByAddr(ll.get(i).getAddrFirst());
					
					if (branch == null) {
				%>
					<div class="row mb-2 border border-right-0 border-bottom-0 border-left-0">
						<div class="col-8 ml-5 pt-3">
							<div>
								<label class="ml-3"><input type="radio" disabled="disabled" value="<%=ll.get(i).getNo() %>" name="list">&ensp;<%=ll.get(i).getAddrFirst() + " " + ll.get(i).getAddrSecond() + " " + ll.get(i).getAddrDetail() %></label>
								<p class="ml-3">해당 주소지에 배송이 가능한 매장이 없습니다.</p>
							</div>
						</div>
						<div class="col-3 text-right pt-3">
							<button class="btn btn-light btn-sm" onclick="removeCheck(<%=ll.get(i).getNo()%>)">x</button>
						</div>
					</div>
				<%
					} else {
						if (i==0) { 
	%>
					<div class="row mb-2">
						<div class="col-8 ml-5">
							<div>
								<label class="ml-3"><input data-branch-no="<%=branch.getNo() %>" type="radio" value="<%=ll.get(i).getNo() %>" name="list" checked>&ensp;<%=ll.get(i).getAddrFirst() + " " + ll.get(i).getAddrSecond() + " " + ll.get(i).getAddrDetail() %></label>
							</div>
							<div>
								&emsp;
								<button class="btn btn-outline-secondary btn-sm" disabled><%=branch.getName()%></button>
								<span><%=branch.getTel()%></span>
							</div>
						</div>
						<div class="col-3 text-right">
							<button class="btn btn-light btn-sm" disabled>x</button>
						</div>
					</div>
	<% 
						} else {
	%>
					<div class="row mb-2 border border-right-0 border-bottom-0 border-left-0">			
						<div class="col-8 ml-5  pt-3 ">
							<div>
								<label class="ml-3"><input data-branch-no="<%=branch.getNo() %>" type="radio" value="<%=ll.get(i).getNo() %>" name="list">&ensp;<%=ll.get(i).getAddrFirst() + " " + ll.get(i).getAddrSecond() + " " + ll.get(i).getAddrDetail() %></label>
							</div>
							<div>
								&emsp;
								<button class="btn btn-outline-secondary btn-sm" disabled><%=branch.getName()%></button>
								<span><%=branch.getTel()%></span>
							</div>
						</div>
						<div class="col-3 text-right  pt-3">
							<button class="btn btn-light btn-sm" onclick="removeCheck(<%=ll.get(i).getNo()%>)">x</button>
						</div>
					</div>
	<%
						}
					}
				}
	%>			
				</div>
				<div class="card-footer" style="border-bottom: 1px solid lightgray;">
					<div class="row">
						<div class="col-4">
							<button type="button"  class="btn btn-outline-secondary btn-lg"
									data-toggle="modal" data-target="#locationbutton" style="width: 200px; height: 65px;">+ 배달주소 등록
							</button>
						</div>
						<div class="col-8 text-right">
							<br/>
							<p style="color: #ff7f00">*배달주소는 최대 10개까지만 등록 가능합니다.</p>
						</div>
					</div>
				</div>
				<br/>
				<div class="card-body text-right mr-5">
					<p>해당 배달주소로 주문을 진행하시겠습니까? &ensp;<button onclick="next(event)" class="btn btn-primary btn-lg" style="width: 200px; height: 65px;">선 택</button></p>
				</div>
	<%
		}
	%>
							
					<div class="modal fade" id="locationbutton" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">배달주소 등록</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								
								<form method="post" action="location.jsp">
									<div class="modal-body">
										<%
											String error = request.getParameter("error");
										%>
										<div class="row">
										
											<div class="col-12">
												
												<%
													if("empty".equals(error)) {
												%>
												<div class="alert alert-danger">
													<strong>오류!</strong> 정보를 입력하세요.
												</div>
												<%
													}
												%>
												
												<div class="form-group row">
													<div class="col-12 mb-3">
														<label>지역선택</label> 
														<input type="text" class="form-control" name="addr1" placeholder="예)서울특별시 종로구 /경상남도 창원시"/>
													</div>
													<div class="col-12 mb-3">
														<label>동/도로명 번지 및 건물명</label> 
														<input type="text" class="form-control" name="addr2" placeholder="예)화정2동 3,별빛마을/송파동 3-1 한솔하이빌"/>
													</div>
													<div class="col-12 mb-3">
														<label>상세주소</label> 
														<input type="text" class="form-control" name="addr_detail" placeholder="상세주소를 입력해 주세요.(건물명, 동/호수 등)">
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-12 small text-muted">
												<p class="m-0" style="color: red;">*도로명은 ~로, ~길까지 입력해야 합니다.</p>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="reset" class="btn btn-secondary">다시 작성</button>
										<button type="submit" class="btn btn-primary" onclick="alertcomplete(event)">&nbsp&nbsp등 록&nbsp&nbsp</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			<hr/>
			</div>
		</div>
	</div>
	<div class="mb-3"></div>
</div>
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
	function next(event) {
		var radios = document.querySelectorAll("input[name=list]");
		var locationNo, branchNo;
		for (var i = 0; i<radios.length; i++) {
			if (radios[i].checked) {
				locationNo = radios[i].value;
				branchNo = radios[i].getAttribute("data-branch-no")
			}
		}
		
		if (locationNo == null) {
			alert("배송이 가능한 주소를 선택해주세요");
			return;
		}
		
		location.href="savelocation.jsp?locationno=" + locationNo + "&branchno=" + branchNo;
	}
	
	function alertcomplete(event) {
		
		if(confirm('등록하시겠습니까?')){
		
		} else {
			event.preventDefault();
			
		}
	}
	
	function removeCheck(no) {
		 if (confirm("삭제 하시겠습니까?")){
		     location.href="dellocation.jsp?no=" + no;
		 }	
	}
	
</script>
</body>
</html>