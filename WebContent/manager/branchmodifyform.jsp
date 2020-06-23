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
					<ul class="nav justify-content-end">
						<li class="nav-item"><a class="nav-link active" href="#">홈</a></li>
						<li class="nav-item"><a class="nav-link disabled" href="#"
							tabindex="-1" aria-disabled="true">></a></li>
						<li class="nav-item"><a class="nav-link active" href="#">관리자</a></li>
						<li class="nav-item"><a class="nav-link disabled" href="#"
							tabindex="-1" aria-disabled="true">></a></li>
						<li class="nav-item"><a class="nav-link disabled" href="#">가맹점</a></li>
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
										<div class="form-group">
											<img
												src="../resource/images/branch/<%=branch.getImageSrc()%>">
										</div>
										<div class="form-group">
											<label> 첨부파일(<%=branch.getImageSrc()%>)
											</label>
											<p class="text-danger">이미지 이름 동일하게 해서 업데이트</p>
											<div>
												<input type="file" name="upfile" />
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
												value="<%=branch.getOpenTime()%>" name="opentime" />
										</div>
										<div class="form-group">
											<label>마감시간</label> <input type="text" class="form-control"
												value="<%=branch.getCloseTime()%>" name="closetime" />
										</div>
										<div class="form-group">
											<label>코멘트</label> <input type="text" class="form-control"
												value="<%=branch.getComment()%>" name="comment" />
										</div>
										<div class="form-group">
											<label>할인율</label> <input type="text" class="form-control"
												value="<%=branch.getDiscountRate() * 100%>%" name="discount" />
										</div>
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




















