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
		String position = "branch";
	%>
	<%@ include file="../common/navbar.jsp"%>
	<div class="container">
		<div class="header">
			<div class="row">
				<div class="col-4">
					<h4>가맹점</h4>
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
					    <a class="nav-link text-muted active pr-1" href="/domino/branch/info.jsp">가맹점</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link disabled pr-1" href="#" tabindex="-1" aria-disabled="true">></a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link disabled text-dark font-weight-bold pr-1" href="#" tabindex="-1" aria-disabled="true">상세정보</a>
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
								class="nav-item  d-flex justify-content-between align-items-center small"><a
								class="nav-link text-muted" href="info.jsp">메인</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-items-center small"><a
								class="nav-link text-muted" href="orderlist.jsp">주문내역</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-items-center small"><a
								class="nav-link text-dark font-weight-bold"
								href="branchdetail.jsp">상세정보</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<div class="body">
			<div class="row">
				<div class="col-12">
					<div class="card mb-5">
						<%
							String userValue = String.valueOf(session.getAttribute("사용자번호"));
							int userNo = NumberUtil.stringToInt(userValue);
							UserDao userDao = new UserDao();
							User user = userDao.getUserByNo(userNo);
							String branchNoString = user.getId().substring(7);
							int branchNo = NumberUtil.stringToInt(branchNoString);

							BranchDao branchDao = new BranchDao();
							Branch branch = branchDao.getBranchByNo(branchNo);
						%>
						<div class="card-header">
							<div class="row">
								
								<div class="col-10 text-left mt-2">
									<div>
										<h2 class="font-weight-bold">가맹점정보</h2>
									</div>
								</div>
								<div class="col-2 text-right pr-4 mt-2">
									<form method="post" action="modifydetail.jsp" enctype="multipart/form-data">
									<%
										if("N".equalsIgnoreCase(branch.getQuitYn())){
									%>
										<input type="hidden" name="yn" value="Y">
										<input type="hidden" name="branchno" value=<%=branch.getNo()%>>
										<button class="btn btn-danger" type="submit"
										onclick="alertcompleteToModify(event)">
											영업종료
										</button>
									<%
										} else {
									%>
										<input type="hidden" name="yn" value="N">
										<input type="hidden" name="branchno" value=<%=branch.getNo()%>>
										<button class="btn btn-success" type="submit"
										onclick="alertcompleteToModify(event)">
											영업시작
										</button>
									<%
										}
									%>
									</form>
								</div>
							</div>
						</div>
						<div class="card-body">

							<form method="post"
								action="/domino/branch/modifydetail.jsp?branchno=<%=branch.getNo()%>"
								enctype="multipart/form-data">

								<div class="row" style="font-size: 20px">
									<div class="col-6">
										<div>
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
									</div>
									<div class="col-6">
										<div>
											<div class="form-group">
												<label>가맹점등록일</label> <input type="text"
													class="form-control" value="<%=branch.getRegDate()%>"
													disabled />
											</div>
											<div class="form-group">
												<label>주차가능여부</label> <input type="text"
													class="form-control" value="<%=branch.getParkingYn()%>"
													name="parkingyn" />
											</div>
											<div class="form-group">
												<label>오픈시간</label> <input type="text" class="form-control"
													value="<%=StringUtil.nullToBlank(branch.getOpenTime()) %>" name="opentime" />
											</div>
											<div class="form-group">
												<label>마감시간</label> <input type="text" class="form-control"
													value="<%=StringUtil.nullToBlank(branch.getCloseTime()) %>" name="closetime" />
											</div>
											<div class="form-group">
												<label>코멘트</label> <input type="text" class="form-control"
													value="<%=StringUtil.nullToBlank(branch.getComment()) %>" name="comment" />
											</div>
											<div class="form-group">
												<label>할인율</label> <input type="text" class="form-control"
													value="<%=branch.getDiscountRate() * 100 %>" name="discount" />
											</div>
										</div>
									</div>
								</div>
								
								<div class="form-group text-center">
									<img src="<%=branch.getImageSrc()%>">
								</div>
								<div class="form-group input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text">업로드</span>
									</div>
									<div class="form-group custom-file">
										<input type="file" class="custom-file-input" name="upfile"
											aria-describedby="inputGroupFileAddon01"> <label
											class="custom-file-label" for="inputGroupFile01">
											매장사진 ( <%=branch.getImageSrc()%> )
										</label>
									</div>
								</div>

								<div class="text-center">
									<button type="submit" class="btn btn-primary btn-block"
										onclick="alertcompleteToModify(event)">&nbsp&nbsp수 정&nbsp&nbsp</button>
								</div>
							</form>
						</div>

					</div>
				</div>
			</div>

		</div>
		<div class="mb-3"></div>
	</div>

<%@ include file="../common/footer.jsp"%>
<script type="text/javascript">
	function alertcompleteToModify(event) {

		if (confirm('상태를 바꾸시겠습니까?')) {

		} else {
			event.preventDefault();
		}
	}
</script>
</body>
</html>




















