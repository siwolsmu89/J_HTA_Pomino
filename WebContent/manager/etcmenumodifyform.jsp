<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%@ include file="../common/navbar.jsp"%>
<div class="container">
	<div class="header">
		<div class="row">
				<div class="col-4">
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
		<div class="row ">
			<div class="col-12">
				<ul class="nav nav-tabs justify-content-around">
					<li class="nav-item"><a class="nav-link" href="#">메인</a></li>
					<li class="nav-item"><a class="nav-link" href="#">주문</a></li>
					<li class="nav-item"><a class="nav-link active" href="#">메뉴</a></li>
					<li class="nav-item"><a class="nav-link" href="#">이벤트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">1:1문의</a></li>
					<li class="nav-item"><a class="nav-link" href="#">가맹점</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="card ">
				<div class="card-body">
					<form method="post" action="doughmodify.jsp">				
						<div class="form-group">
							<label>기타메뉴 이름</label>
							<input type="text" class="form-control" name="name" placeholder="기존값 표시"/>
						</div>
						<div class="form-group">
							<label>기타메뉴 가격</label>
							<input type="text" class="form-control" name="lprice" placeholder="기존값 표시"/>
						</div>						
						<!-- 사진등록 -->
			               <div class="form-group">
			                   <label>첨부파일</label>
			                   <div>
			                       <input type="file" name="upfile" />
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
<%@ include file="../common/footer.jsp" %>
</body>
</html>