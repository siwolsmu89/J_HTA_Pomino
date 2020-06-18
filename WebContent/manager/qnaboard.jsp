<%@page import="com.domino.dto.QuestionDto"%>
<%@page import="com.domino.vo.Question"%>
<%@page import="java.util.List"%>
<%@page import="com.domino.dao.QnaDao"%>
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
						<li class="nav-item"><a class="nav-link disabled" href="#">1:1문의</a></li>
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
								class="nav-link text-dark font-weight-bold" href="qnaboard.jsp">1:1문의</a></li>
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
							<!-- 검색조건 입력폼 시작 -->
							<div class="col-6">
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<select class="form-control" name="searchOption">
											<option value="qnano">문의번호</option>
											<option value="qnawriter">작성자</option>
											<option value="qnadate">등록일</option>
										</select>
									</div>
									<input type="text" class="form-control"
										placeholder="검색어를 입력하세요">
									<div class="input-group-append">
										<button class="btn btn-outline-secondary" type="button">조회</button>
									</div>
								</div>
							</div>
							<!-- 검색조건 입력폼 끝 -->
							<!-- 정렬기준 선택 시작  -->
							<div class="col-2 offset-4">
								<div class="input-group mb-3">
									<select class="form-control" name="sort">
										<option value="total">전체보기</option>
										<option value="complete">완료된 글</option>
										<option value="wait">답변대기 글</option>
									</select>
								</div>
							</div>
							<!-- 정렬기준 선택 끝  -->
						</div>
					</form>
					<%
						QnaDao qnaDao = new QnaDao();
						List<QuestionDto> questions = qnaDao.getAllQuestion();
					%>
					<table class="table text-center">
						<colgroup>
							<col width="10%">
							<col width="20%">
							<col width="20%">
							<col width="*%">
							<col width="15%">
						</colgroup>
						<thead class="thead thead-dark">
							<tr>
								<th>번호</th>
								<th>작성자</th>
								<th>제목</th>
								<th>등록일</th>
								<th>처리상태</th>
							</tr>
						</thead>
						<tbody>
							<%
								for (QuestionDto questionDto : questions) {
							%>
							<tr>
								<td><%=questionDto.getNo()%></td>
								<td><%=questionDto.getUserName()%></td>
								<td><%=questionDto.getTitle()%></td>
								<td><%=questionDto.getRegDate()%></td>
								<td>
									<%
										if ("N".equals(questionDto.getAnsweredYn())) {
									%>
									<button type="button" class="btn btn-primary" 
									data-toggle="modal" data-target="#a<%=questionDto.getNo()%>">
										답변대기
									</button>
									<%
									 	} else {
									%>
									<button type="button" class="btn btn-secondary" 
									data-toggle="modal" data-target="#a<%=questionDto.getNo()%>">
										답변완료</button> 
									<%
									 	}
									%>
								</td>
							</tr>

							<!-- Modal - qnadetail -->
							<tr>
								<td class="modal fade" id="a<%=questionDto.getNo()%>"
									tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">1:1 문의</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>

											<form method="post"
												action="/domino/manager/answer.jsp?questionno=<%=questionDto.getNo()%>">
												<div class="modal-body">
													<div class="row">
														<div class="col-6">
															<div class="form-group">
																<label>이름</label> <input type="text"
																	class="form-control" value="<%=questionDto.getUserName()%>"
																	disabled />
															</div>
															<div class="form-group">
																<label>아이디</label> <input type="text"
																	class="form-control" value="<%=questionDto.getUserId()%>"
																	disabled />
															</div>
														</div>
														<div class="col-6">
															<div class="form-group">
																<label>이메일</label> <input type="text"
																	class="form-control"
																	value="<%=questionDto.getUserEmail()%>" disabled />
															</div>
															<div class="form-group">
																<label>등록날짜</label> <input type="text"
																	class="form-control"
																	value="<%=questionDto.getRegDate()%>" name="addrdetail" disabled/>
															</div>
														</div>
														<div class="col-12">
															<div class="form-group">
																<label>제목</label> <input type="text"
																	class="form-control" value="<%=questionDto.getTitle()%> " disabled
																	name="tel" />
															</div>
														</div>
														<div class="col-12">
															<div class="form-group">
																<label>문의내용</label> 
																<textarea type="text"
																	class="form-control" disabled
																	name="tel" ><%=questionDto.getContent()%></textarea>
															</div>
														</div>
														<div class="col-12">

															<div class="form-group">
																<label for="desc-1">답변작성</label>
																<textarea
																	class="form-control" name="answercontent" id="desc-1">
																</textarea>
															</div>

														</div>
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary" data-dismiss="modal">
														다시 작성
													</button>
													<button type="submit" class="btn btn-primary">
														답변등록
													</button>
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
						<li class="page-item "><a class="page-link" href="#">이전</a></li>
						<li class="page-item active"><a class="page-link" href="#">1</a></li>
						<li class="page-item "><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#">다음</a></li>
					</ul>
					<!-- 페이지 처리 끝 -->

				</div>
			</div>
		</div>

	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>