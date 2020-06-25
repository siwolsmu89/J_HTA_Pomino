<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<% response.setStatus(200); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<title>에러페이지</title>
</head>
<body>
	<div class="row">
		<div class="col-12">
			<div class="jumbotron jumbotron-fluid pb-2 bg-white">
				<div class="container text-center">
					<h1 class="py-2">웹 페이지를 찾을 수 없습니다.</h1>
					<h4 class="text-primary font-weight-bold py-2">404 Not Found Error</h4>
					<p>죄송합니다. 현재 찾을수 없는 페이지를 요청 하셨습니다. </p>

					<div id="link-button" class="py-4">
						<a href="/domino/common/home.jsp"><button
								class="btn btn-primary btn-lg">pomino 홈 화면으로 가기</button></a>
					</div>
				</div>
			</div>
			<hr />
		</div>
	</div>
</body>
</html>


