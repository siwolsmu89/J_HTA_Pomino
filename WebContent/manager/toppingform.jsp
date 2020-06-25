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
					    <a class="nav-link disabled text-dark font-weight-bold pr-1" href="#" tabindex="-1" aria-disabled="true">메뉴</a>
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
					<!-- 회원가입시 표시할 오류내용 시작  -->
					<%
						String error = request.getParameter("error");
						if("dup".equalsIgnoreCase(error)){
					%>
						<div class="alert alert-danger">
							<strong>오류!</strong> 중복된 데이터가 존재합니다.
						</div>
					<%
						}
					%>
					<!-- 토핑등록시 표시할 오류내용 끝  -->
					<!-- 토핑등록폼을 포함하고 있는 card 컴포넌트 시작 -->
					<div class="card ">
						<div class="card-header text-center">
							<strong>신규 토핑 등록</strong>
						</div>
						<div class="card-body">
							<!-- 토핑등록 입력 폼 시작  -->
							<form method="post" action="topping.jsp" enctype="multipart/form-data">
								<div class="form-group">
									<label>토핑이름</label> <input type="text" class="form-control"
										name="name" placeholder="예)페퍼로니" />
								</div>
								<div class="form-group">
									<label>토핑가격</label> <input type="number" class="form-control"
										name="price" placeholder="1500" />
								</div>
								<div class="form-group">
									<label>카테고리</label> <select name="category" class="form-control">
										<option value="1" selected>메인</option>
										<option value="2">치즈</option>
										<option value="3">애프터</option>
									</select>
								</div>
								<!-- 사진등록 -->
								<div class="form-group input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text">업로드</span>
									</div>
									<div class="form-group custom-file">
										<input type="file" class="custom-file-input" name="upfile"
											aria-describedby="inputGroupFileAddon01"> <label
											class="custom-file-label" for="inputGroupFile01">
											토핑사진
										</label>
									</div>
								</div>

								<div class="text-right">
									<button type="submit" class="btn btn-primary btn-block">등록하기</button>
								</div>
							</form>
							<!-- 토핑등록 폼 끝  -->

						</div>
						<!-- 토핑등록폼을 포함하고 있는 card 컴포넌트 시작 -->
					</div>
				</div>
			</div>
		</div>


	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>