<%@page import="com.domino.util.StringUtil"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@page import="com.domino.vo.Branch"%>
<%@page import="java.util.List"%>
<%@page import="com.domino.dao.BranchDao"%>
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
					<ul class="nav justify-content-end small text-muted">
					  <li class="nav-item">
					    <a class="nav-link text-muted active pr-1" href="/domino/common/home.jsp">홈</a>	<!--text-muted pr-1  -->
					  </li>
					  <li class="nav-item">
					    <a class="nav-link disabled pr-1" href="#" tabindex="-1" aria-disabled="true">></a><!-- pr-1  -->
					  </li>
					  <li class="nav-item">
					    <a class="nav-link text-muted active pr-1" href="/domino/manager/info.jsp">관리자</a><!--text-muted active pr-1  -->
					  </li>
					  <li class="nav-item">
					    <a class="nav-link disabled pr-1" href="#" tabindex="-1" aria-disabled="true">></a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link disabled text-dark font-weight-bold pr-1" href="#" tabindex="-1" aria-disabled="true">가맹점</a>
					  	<!--text-dark font-weight-bold pr-1  -->
					  </li>
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
								class="nav-link text-muted" href="eventlist.jsp">이벤트</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-muted" href="qnaboard.jsp">1:1문의</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-dark font-weight-bold"
								href="branchlist.jsp">가맹점</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="body">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<strong>가맹점 상세정보 및 수정</strong>
						</div>
						<div class="card-body">
							<%
								int branchNo = NumberUtil.stringToInt(request.getParameter("branchno"));
								BranchDao branchDao = new BranchDao();
								Branch branch = branchDao.getBranchByNo(branchNo);
							%>
							<form method="post"
								action="/domino/branch/modify.jsp?branchno=<%=branch.getNo() %>"
								enctype="multipart/form-data">							
								<div class="row">
									<div class="col-12">
										<div class="form-group text-center">
											<img
												src="<%=branch.getImageSrc()%>">
										</div>
										<div class="form-group input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text">업로드</span>
											</div>
											<div class="form-group custom-file">
												<input type="file" class="custom-file-input" name="upfile"
													aria-describedby="inputGroupFileAddon01"> 
													<label class="custom-file-label" for="inputGroupFile01">
														매장사진 ( <%=branch.getImageSrc() %> )
													</label>
											</div>
										</div>
									</div>
									<div class="col-6">
										<div class="form-group">
											<label>가맹점번호</label> <input type="number"
												class="form-control" value="<%=branch.getNo()%>" disabled />
										</div>
										<div class="form-group">
											<label>가맹점명</label> <input type="text" class="form-control"
												value="<%=branch.getName()%>" disabled />
										</div>
										<div class="form-group">
											<label>주소(1)</label> <input type="text" class="form-control"
												value="<%=branch.getAddrFirst()%>" disabled />
										</div>
										<div class="form-group">
											<label>주소(2)</label> <input type="text" class="form-control"
												value="<%=branch.getAddrSecond()%>" disabled />
										</div>
										<div class="form-group">
											<label>주소(3)</label> <input type="text" class="form-control"
												value="<%=branch.getAddrDetail()%>" name="addrdetail" />
										</div>
										<div class="form-group">
											<label>전화번호</label> <input type="text" class="form-control"
												value="<%=branch.getTel()%>" name="tel" />
										</div>
									</div>
									<div class="col-6">
										<div class="form-group">
											<label>가맹점등록일</label> <input type="text" class="form-control"
												value="<%=branch.getRegDate()%>" disabled />
										</div>
										<div class="form-group">
											<label>주차가능여부</label> <input type="text" class="form-control"
												value="<%=branch.getParkingYn()%>" name="parkingyn" />
										</div>
										<div class="form-group">
											<label>오픈시간</label> <input type="text" class="form-control"
												value="<%=StringUtil.nullToBlank(branch.getOpenTime())%>" name="opentime" />
										</div>
										<div class="form-group">
											<label>마감시간</label> <input type="text" class="form-control"
												value="<%=StringUtil.nullToBlank(branch.getCloseTime())%>" name="closetime" />
										</div>
										<div class="form-group">
											<label>코멘트</label> <input type="text" class="form-control"
												value="<%=StringUtil.nullToBlank(branch.getComment())%>" name="comment" />
										</div>
										<div class="form-group">
											<label>할인율</label> <input type="text" class="form-control"
												value="<%=branch.getDiscountRate() * 100%>%" name="discount" />
										</div>
									</div>
								</div>
								<div class="text-right">
									<button type="submit" class="btn btn-primary btn-block">수정하기</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="mb-2"></div>
	</div>
	
	<%@ include file="../common/footer.jsp"%>
</body>
</html>




















