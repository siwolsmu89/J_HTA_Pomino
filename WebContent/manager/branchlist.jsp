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
					<!-- 검색조건, 정렬기준, 테이블, 페이지처리 내용을 포함하는 card 시작 -->
					<!-- 검색조건, 정렬기준 입력 폼 시작 -->
					<form>
						<div class="row">
							<!-- 검색조건 입력폼 시작 -->
							<div class="col-6">
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<select class="form-control" name="searchOption">
											<option value="title">가맹점번호</option>
											<option value="writer">가맹점명</option>
											<option value="content">지역(대분류)</option>
											<option value="content">지역(소분류)</option>
										</select>
									</div>
									<input type="text" class="form-control"
										placeholder="검색어를 입력하세요">
									<div class="input-group-append">
										<button class="btn btn-outline-secondary" type="button">조회</button>
									</div>
								</div>
							</div>
						</div>
					</form>
					<!-- 검색조건, 정렬기준 입력 폼 끝 -->
					<%
						BranchDao branchDao = new BranchDao();
						List<Branch> branchs = branchDao.getAllBranch();
					%>
					<table class="table text-center">
						<colgroup>
							<col width="10%">
							<col width="15%">
							<col width="20%">
							<col width="20%">
							<col width="20%">
							<col width="15%">
						</colgroup>
						<thead class="thead-dark">
							<tr>
								<th>번호</th>
								<th>가맹점명</th>
								<th>주소(first)</th>
								<th>주소(second)</th>
								<th>전화번호</th>
								<th colspan='2'><a class="btn btn-light"
									href="branchform.jsp">가맹점 등록</a></th>
							</tr>
						</thead>
						<tbody>
						<%
							for(Branch branch : branchs) {
						%>
							<tr >
								<td><%=branch.getNo() %></td>
								<td><%=branch.getName() %></td>
								<td><%=branch.getAddrFirst() %></td>
								<td><%=branch.getAddrSecond() %></td>
								<td><%=branch.getTel() %></td>
								<td>
							<%
									String yn = branch.getQuitYn();
									if("N".equals(yn)) {
							%>					
									<button type="button"  class="btn btn-success" data-toggle="modal" data-target="#<%=branch.getName() %>">영업중</button>
							<%
									} else {
							%>
									<button type="button"  class="btn btn-dark" data-toggle="modal" data-target="#<%=branch.getName() %>">영업종료</button>
							<%
									}
							%>
								</td>
							</tr>
							<tr>
								<!-- Modal - qnadetail -->
								<td class="modal fade" id="<%=branch.getName() %>" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel"><%=branch.getName() %></h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>

											<form method="post" action="/domino/branch/modify.jsp?branchno=<%=branch.getNo() %>" enctype="multipart/form-data">
												<div class="modal-body">
													<div class="row">
														<div class="col-12">
															<div class="form-group">
																<img src="../resource/images/branch/<%=branch.getImageSrc()%>">
															</div>
															<div class="form-group">
																<label>
																	첨부파일(<%=branch.getImageSrc()%>)
																</label>
																<p class="text-danger">
																	이미지 이름 동일하게 해서 업데이트
																</p>
																<div>
																	<input type="file" name="upfile" />
																</div>
															</div>
														</div>
														<div class="col-6">
															<div class="form-group">
																<label>가맹점번호</label> <input type="number"
																	class="form-control" value="<%=branch.getNo() %>" disabled />
															</div>
															<div class="form-group">
																<label>가맹점명</label> <input type="text"
																	class="form-control" value="<%=branch.getName() %>" disabled />
															</div>
															<div class="form-group">
																<label>주소(1)</label> <input type="text"
																	class="form-control" value="<%=branch.getAddrFirst() %>" disabled />
															</div>
															<div class="form-group">
																<label>주소(2)</label> <input type="text"
																	class="form-control" value="<%=branch.getAddrSecond() %>" disabled />
															</div>
															<div class="form-group">
																<label>주소(3)</label> <input type="text"
																	class="form-control" value="<%=branch.getAddrDetail() %>" name="addrdetail" />
															</div>
															<div class="form-group">
																<label>전화번호</label> <input type="text"
																	class="form-control" value="<%=branch.getTel() %> "name="tel" />
															</div>
															
														</div>
														<div class="col-6">
															<div class="form-group">
																<label>가맹점등록일</label> <input type="text"
																	class="form-control" value="<%=branch.getRegDate() %>" disabled />
															</div>
															<div class="form-group">
																<label>주차가능여부</label> <input type="text"
																	class="form-control" value="<%=branch.getParkingYn() %>" name="parking"/>
															</div>
															<div class="form-group">
																<label>오픈시간</label> <input type="text"
																	class="form-control" value="<%=branch.getOpenTime() %>" name="opentime" />
															</div>
															<div class="form-group">
																<label>마감시간</label> <input type="text"
																	class="form-control" value="<%=branch.getCloseTime() %>" name="closetime" />
															</div>
															<div class="form-group">
																<label>코멘트</label> <input type="text"
																	class="form-control" value="<%=branch.getComment() %>" name="comment" />
															</div>
															<div class="form-group">
																<label>할인율</label> <input type="text"
																	class="form-control" value="<%=branch.getDiscountRate() %>" name="discount"/>
															</div>
														</div>
													</div>
																								
												</div>
												
												<div class="modal-footer">
													<button type="submit" class="btn btn-primary text-light" >수정하기</button>
												</div>
												
											</form>
										</div>
									</div>
								</td>
							</tr>				
						<%
							}
						%>
						</tbody>
					</table>
					<!-- 페이지 처리 시작 -->
					<ul class="pagination justify-content-center"
						style="margin: 20px 0">
						<li class="page-item"><a class="page-link" href="#">이전</a></li>
						<li class="page-item active"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
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
	
	<script type="text/javascript">
		
	</script>
</body>
</html>




















