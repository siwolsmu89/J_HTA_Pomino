<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.domino.vo.Branch"%>
<%@page import="com.domino.dao.BranchDao"%>
<%@page import="com.domino.util.NumberUtil"%>
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
<%
		String position="signup";
		Date nowTime = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");

%>
<%@ include file="../common/navbar.jsp"%>
<div class="container">
<!-- container 시작 -->

	<div class="header">
	<!-- header 시작 / 서브메뉴바 -->
		<div class="row">
		<!-- row 시작 -->	
			<div class="col-4">
				<h4>회원가입</h4>
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
					    <a class="nav-link disabled text-dark font-weight-bold pr-1" href="#" tabindex="-1" aria-disabled="true">회원가입</a>
					  </li>
				</ul>				
			</div>
		<!-- row 종료 -->	
		</div>
	<!-- header 종료 / 서브메뉴바 -->
	</div>
	
	<div style="background-color: black; height: 2px;" class="mb-2"></div>
	
	<div class="body">
	<!-- body 시작 -->
		<%	
			// 가맹점등록 페이지로부터 받은 쿼리스트링 값 저장
			String status = request.getParameter("status");
			int branchNo = NumberUtil.stringToInt(request.getParameter("branchNo"));
			
			// 에러페이지용
			String error = request.getParameter("error");
		%>
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-12">
						<ul class="nav nav-pills nav-fill">
						  <li class="nav-item">
						    <a class="nav-link bg-secondary text-white" href="#">01 개인정보입력</a>
						  </li>
						 <li class="nav-item">
						    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">02 가입완료</a>
						  </li>
						</ul>
					</div>
				</div>
				
				<div class="row">
					<div class="col-12 mt-2">
						<!-- 회원가입시 표시할 오류내용 시작  -->
							<%
								if("dup".equals(error)){
							%>
							<div class="alert alert-danger">
								<strong>오류!</strong> 이미 사용중인 아이디입니다.
							</div>
							<%
								}
							%>
							<!-- 회원가입시 표시할 오류내용 끝  -->
							<!-- 회원가입폼을 포함하고 있는 card 컴포넌트 시작 -->
							<div class="card ">
								<div class="card-body">
								<!-- 회원가입 입력 폼 시작  -->
							<%
								// 가맹점등록페이지(branch.jsp)에서 접근했는지 검사
								if("branch".equals(status)) {
									BranchDao branchDao = new BranchDao();
									Branch branch = branchDao.getBranchByNo(branchNo);
							%>
									<form method="post" action="signup.jsp" onsubmit="checkField(event)">
									<div class="form-group">
										<label>이름</label>
										<input type="text" class="form-control" name="username" value="<%=branch.getName()%>" />
									</div>
									<div class="form-group">
										<label>아이디</label>
										<input type="text" class="form-control" name="userid" value="branch-<%=branch.getNo()%>"  />
									</div>
									<div class="form-group">
										<label>비밀번호</label>
										<input type="password" class="form-control" name="userpwd" placeholder="영문(대소문자),숫자,특수기호를 조합해주세요."/>
									</div>
									<div class="form-group">
										<label>생년월일</label>
										<div>
											<input type="date" class="form-control" name="userbirth"/>
										</div>
									</div>
									<!-- 라디오버튼 예시 시작 -->
									<div class="form-group">
										<label>성별</label>
										<div>
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" class="custom-control-input" name="usergender" id="gender-male" value="M" checked>
												<label class="custom-control-label" for="gender-male">남자</label>
			  								</div>
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" class="custom-control-input" name="usergender" id="gender-female" value="F">
												<label class="custom-control-label" for="gender-female">여자</label>
			  								</div>
										</div>
									</div>
									<!-- 라디오버튼 예시 끝 -->
									<div class="form-group">
		                        		<label>전화번호</label>
		                        			<input type="tel" class="form-control" name="usertel" id="inputMobile" value="<%=branch.getTel()%>" >
		                    		</div>
									<div class="form-group">
										<label for="exampleFormControlInput1">이메일</label>
		    							<input type="email" class="form-control" name="useremail" id="exampleFormControlInput1" placeholder="예)name@example.com">
									</div>
									<div class="form-group">
										<label>이메일 수신여부</label>
		                    			<label>
		                            		<input type="radio" id="emailReceiveY" name="emailReceiveYn" value="Y" checked> 동의합니다.
		                       			</label>
		                        		<label>
		                            		<input type="radio" id="emailReceiveN" name="emailReceiveYn" value="N" onclick="ReceiveEmailNot()"> 동의하지 않습니다.
		                        		</label>
									</div>
									
									 <div class="form-group">
		                    			<label>SMS 수신여부</label>
				                        <label>
				                            <input type="radio" id="smsReceiveYn" name="smsReceiveYn" value="Y" checked> 동의합니다.
				                        </label>
				                        <label class="radio-inline">
				                            <input type="radio" id="smsReceiveYn" name="smsReceiveYn" value="N" onclick="ReceiveSmsNot()"> 동의하지 않습니다.
				                        </label>
		                    		</div>
		                
									
									<div class="text-right">
										<button type="submit" class="btn btn-primary">가입하기</button>
									</div>
								</form>
							<%
								} else {
							%>
								<form method="post" action="signup.jsp" onsubmit="checkField(event)">
									<div class="form-group">
		                    			<label>이용약관 동의</label>
		                   				<div>
		                        			<textarea class="form-control" rows="8" style="resize:none">제1조 목적
이 약관은 청오디피케이㈜(이하’회사’)에서 운영하는 도미노피자 인터넷사이트 < www.dominos.co.kr >와 스마트폰 및 이동통신기기를 통해 제공되는 모바일웹사이트 < m.dominos.co.kr > 및 애플리케이션을 통해 제공되는 서비스의 이용에 관련하여 권리 의무 및 관련 절차 등을 규정하고 상호 발전을 도모하는 것을 그 목적으로 합니다.

제2조 정의
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.

(1) “회원”이란 도미노피자 웹/모바일에 접속하여 본 약관에 따라 회사에서 제공하는 서비스를 이용하는 고객을 말합니다.
(2) "아이디(ID)" 란 “회원”의 식별과 사이트에서 제공하는 서비스를 이용하고, 회사가 회원을 구분, 식별할 수 있도록, 회원이 정하고 회사가 승인하는 문자와 숫자의 조합을 의미합니다.
(3) ”비밀번호” 란 회원이 부여 받은 아이디(ID)와 동일한 회원임을 확인하고 비밀보호를 위해 회원 자신이 정한 문자 또는 숫자의 조합을 의미합니다.
제3조 약관의 게시와 개정
(1) 이 약관은 웹사이트(www.dominos.co.kr)와 모바일웹사이트(m.dominos.co.kr)에 그 내용을 이용자가 알 수 있도록 게시함으로써 효력을 발생하며 "회사"는 약관의 규제 등에 관한 법률, 전자거래 기본법, 전자서명법, 정보통신망 이용촉진 등에 관한 법률, 소비자 보호법 등 관련법을 위배하지 않는 범위에서 개정할 수 있습니다.
(2) 회사는 이 약관의 내용을 “회원”이 쉽게 알 수 있도록 서비스 초기 화면에 상호, 소재지, 대표자의 성명, 사업자등록번호, 연락처 등과 함께 게시합니다.
(3) "회사" 는 약관을 개정할 경우, 적용일자 및 개정 사유를 명시하며 약관에 동의하는 것은 정기적으로 웹을 방문하여 약관의 변경사항을 확인하는 것에 동의함을 의미합니다.
제4조 약관의 해석
(1) 해당 약관에서 정하지 아니한 사항 및 이 약관의 해석에 대해서는 전자거래소비자보호지침 및 관계법령 또는 상관계에 따릅니다.
(2) 회사는 “약관의 규제에 관한 법률”, “정보통신망 이용촉진 및 정보보호 등에 관한 법률”(이하 “정보통신망법”) 등 관련법에 위배하지 않는 법위에서 이 약관을 개정할 수 있습니다.
(3) 회사가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행 약관과 함께 사이트의 초기화면에 적용일자 30일 이전부터 적용일자 전일까지 공지합니다.
제5조 이용계약 성립
(1) 이용계약은 “회원”이 되고자 본 약관에 동의한 후 회사가 정한 양식에 따라 회원정보를 기입하여 회원가입신청을 하고 회사가 이러한 신청에 대하여 승낙함으로써 체결됩니다.
(2) 회사는 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하는 신청에 대하여는 서비스 제공을 거부하거나 제한할 수 있습니다.
- 실명이 아니거나 타인의 명의를 도용하여 신청하였을 경우
- 허위 정보를 기재하거나, 회사가 제시하는 내용을 기재하지 않은 경우
- 관계법령에 위배되거나 미풍양속을 저해하고자 하는 목적으로 회원가입 신청을 할 경우
- 이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하여 시청하는 경우
제6조 회원정보의 변경
(1) 회원은 개인정보관리화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다.
(2) "회원"은 회원가입신청 시 기재한 사항이 변경되었을 경우 온라인으로 수정을 하거나 전자우편 기타 방법으로 "회사"에 대하여 그 변경사항을 알려야 합니다.
(3) 제2항의 변경사항을 "회사"에 알리지 않아 발생한 불이익에 대하여 "회사"는 책임지지 않습니다.
제7조 개인정보보호 의무
"회사"는 "정보통신망법" 등 관계 법령이 정하는 바에 따라 "회원"의 개인정보를 보호하기 위해 노력합니다. 개인정보의 보호 및 사용에 대해서는 관련법 및 "회사"의 개인정보처리방침이 적용됩니다. 다만, "회사"의 공식 사이트 이외의 링크된 사이트에서는 "회사"의 개인정보처리방침이 적용되지 않습니다.

제8조 회원의 아이디 및 비밀번호의 관리에 대한 의무
(1) "ID"와 "비밀번호"에 관한 관리책임은 "회원"에게 있으며, 이를 제3자가 이용하도록 하여서는 안되며 관리소홀로 인해 발생되는 모든 결과의 책임은 회원 본인에게 있습니다.
(2) "회원"은 "ID" 및 "비밀번호"가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 "회사"에 통지하고 "회사"의 안내에 따라야 합니다.
(3) 제2항의 경우에 해당 "회원"이 "회사"에 그 사실을 통지하지 않거나, 통지한 경우에도 "회사"의 안내에 따르지 않아 발생한 불이익에 대하여 "회사"는 책임지지 않습니다.
제9조 회원의 의무
(1) 회원은 다음 행위를 하여서는 안됩니다.
- 신청 또는 변경 시 허위내용의 등록
- 타인의 정보 도용 / 타회원의 ID 및 비밀번호를 사용하는 행위
- 회사가 게시한 정보의 변경
- 회사가 제공하는 서비스를 통하여 얻은 정보를 회사의 사전 승낙 없이 허가용도 이외의 목적으로 사용하거나 복제, 유통, 상업적으로 이용하려는 행위
- 회사와 기타 제3자의 저작권 등 지적재산권에 대한 침해
- 회사 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
- 사회질서에 위배되는 외설/폭력적 메시지 유포/범죄행위를 목적으로 하거나 범죄를 교사하는 행위
- 관계법령에 위배되거나 미풍양속을 저해하고자 하는 목적으로 회원가입 신청을 할 경우
- 회사의 동의 없이 영리를 목적으로 서비스를 사용하는 행위
- 기타 불법적이거나 부당한 행위
- 정보 서비스를 위해 하거나, 혼란을 일으키는 해킹, 컴퓨터 바이러스 전염, 유포하는 행위
- 회사의 동의 없이 영리를 목적으로 서비스를 사용하는 행위
- 기타 불법적이거나 부당한 행위
제10조 회사의 의무
(1) 회사는 관계법령 및 이 약관에서 금지하는 행위를 하지 않습니다.
(2) 회사는 지속적이고 안정적인 서비스를 제공하기 위해 노력합니다.
(3) 회사는 서비스를 이용하는 회원이 제기하는 의견이나 불만사항이 정당하다고 인정되면 즉시 처리합니다. 다만 즉시 처리가 불가능한 경우에는 회원에게 그 사유와 처리되는 일정을 통지합니다.
제11조 개인정보 수집
(1) "회사"는 적법하고 공정한 수단에 의하여 서비스이용계약의 성립 및 이행에 필요한 최소한의 개인정보를 수집합니다.
(2) 회사는 회원가입 신청 시 기본적인 서비스 제공을 위해 이름, 아이디, 비밀번호, e-mail 주소, 배달지 주소(우편번호 포함), 전화번호, 이동전화번호 등에 대한 개인정보를 수집합니다.
(3) 회사는 회원의 기본적 인권을 침해할 우려가 있는 내용은 수집하지 않습니다.
제12조 회원탈퇴 및 자격 상실 등
(1) 회원"은 언제든지 서비스초기화면의 고객센터 또는 내 정보 관리 메뉴 등을 통하여 이용계약 해지 신청을 할 수 있으며, "회사"는 관련법 등이 정하는 바에 따라 이를 즉시 처리하여야 합니다.
(2) 회원"이 계약을 해지할 경우, 관련법 및 개인정보처리방침에 따라 "회사"가 회원정보를 보유하는 경우를 제외하고는 해지 즉시 "회원"의 모든 데이터는 소멸됩니다.
(3) 회사는 회원이 다음 각 호에 해당하는 행위를 하였을 경우 사전 통지 없이 자격을 제한/정지할 수 있습니다.
- 타인의 ID및 비밀번호를 도용할 경우
- 이용 가입 시 이용계약에 위반되는 허위사실을 기입하였을 경우
- 다른 회원이 본 사이트를 이용하는 것을 방해하거나 그 정보를 도용하는 등 거래질서를 위협하는 경우
- 본 사이트를 위용하여 기타 관련 법률과 이 약관이 금지하는 행위를 하거나 미풍양속에 반하는 행위를 하는 경우
제13조 개인정보 파기 및 제3자 제공의 금지
"회사"는 회원이 탈퇴하거나 제16조에 따라 동의를 철회하는 경우, 지체 없이 수집된 회원정보를 파기하는 등 필요한 조치를 취합니다.

(1) 회사는 개인정보를 회원의 동의 없이 제3자에게 제공하지 않습니다. 단 다음 각 호의 경우에는 에외로 한다.
- 정보통신망이용촉진법 등 법률에 특별한 규정이 있는 경우
- 서비스이용계약의 이행을 위하여 필요한 경우
- 통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태 제공 시
(2) 회사는 회원의 개인정보를 회사의 제휴 사이트에서 활용할 수 있습니다.
(3) 고객이 서비스 가입 등을 위해 기재한 개인정보는 회원 탈퇴 등 이용목적이 달성된 후 내부 방침에 따라 지체 없이 파기합니다.
(단, 아래의 마케팅 목적으로 활용된 경우 내부 전산시스템 재정비 및 협력사와의 커뮤니케이션을 고려하여 최단 기간인 30일 이후부터 적용)

1. 이메일 홍보: 탈퇴시점 30일 이후부터 적용(수신거부 동일)
2. DM(우편물): 탈퇴시점 30일 이후부터 적용(수신거부 동일)
3. SMS 홍보: 탈퇴시점 30일 이후부터 적용(수신거부 동일)
(4) 파기방법
종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기한다.
전자적 파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 조치를 통하여 삭제한다.

(5)개인정보 유효기간 제도 도입
- 당사는 장기간(1년 이상) 서비스 미이용자의 개인정보보호를 위하여 2015년 8월 18일부로 다른 이용자의 개인정보와 분리하여 저장, 관리합니다.
- 미이용의 기간은 최종 로그인 일자 및 주문이력으로 산정하며 법령에서 정의한 기간 동안 서비스 미이용자에 대하여 분리, 저장, 관리합니다.
- 당사는 미이용자 개인정보 분리/저장시점 도래 1개월 이전에 이메일 등을 통해 해당 이용자에게 관련내용을 공지합니다.
- 분리 저장된 미이용자 개인정보는 관련 법령에 따라 일정기간 동안 보유하며, 해당 기간 종료 후 파기됩니다. 파기되지 않은 개인정보는 해당 이용자의 요청에 따라 서비스 이용을 재개하는 시점에 다시 제공됩니다
제14조 개인정보 동의 철회, 연람 또는 정정
(1) 회원 또는 회원의 법정대리인은 언제든지 개인정보의 수집 및 이용, 목적 외의 사용, 제3자 제공에 대한 동의를 철회할 수 있습니다.
(2) 회원 또는 회원의 법정대리인은 언제든지 자신의 개인정보를 열람할 수 있으며, 스스로 정보 및 오류를 수정할 수 있습니다. 그 자세한 방법은 본 사이트의 공지, 서비스이용안내에서 정한 바에 따릅니다.
제15조 서비스의 제공 및 변경
(1) 회사는 업무상/운영상/기술상 필요에 따라 제공하고 있는 전부 또는 일부 서비스를 변경할 수 있습니다.
(2) 서비스는 연중무휴, 1일 24시간 서비스를 제공함을 원칙으로 합니다.
(3) 회사"는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 운영상 상당한 이유가 있는 경우 "서비스"의 제공을 일시적으로 중단할 수 있습니다. "회사"가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다.
(4) "회사"는 서비스의 제공에 필요한 경우 정기점검을 실시할 수 있으며, 정기점검시간은 서비스제공화면에 공지한 바에 따릅니다.
제16조 정보의 제공
(1) 회사"는 "회원"이 "서비스" 이용 중 필요하다고 인정되는 다양한 정보를 공지사항이나 전자우편 등의 방법으로 "회원"에게 제공할 수 있습니다. 다만, "회원"은 관련법에 따른 거래관련 정보 및 고객문의 등에 대한 답변 등을 제외하고는 언제든지 전자우편에 대해서 수신 거절을 할 수 있습니다.
제17조 게시물 삭제
회사는 회원이 게시하거나 제공하는 서비스 내용이 다음 각 호에 해당한다고 판단될 경우 사전 통지 없이 삭제할 수 있습니다.

- 다른 회원 또는 제3자를 비방하거나 명예를 손상시키는 내용인 경우
- 다량의 정보를 전송하여 서비스의 안정적 운영을 방해하는 경우
- 허위 사실 유포 및 수신자의 의사에 반하는 광고성 정보를 전송하는 경우
- 공공질서 및 미풍양속에 위반되는 내용인 경우
- 제3자의 지적재산권에 침해하는 내용인 경우
제18조 회원에 대한 통지
(1) 회사"가 "회원"에 대한 통지를 하는 경우 회원의 전자우편주소 할 수 있습니다.
(2) 회사의 불특정다수 회원에 대하여 통지를 하는 경우, 1주일 이상 회사의 게시판에 게시함으로써 개별 통지에 갈음할 수 있습니다.
(3) 회사"는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 운영상 상당한 이유가 있는 경우 "서비스"의 제공을 일시적으로 중단할 수 있습니다. "회사"가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다.
<(4) "회사"는 서비스의 제공에 필요한 경우 정기점검을 실시할 수 있으며, 정기점검시간은 서비스제공화면에 공지한 바에 따릅니다.
제19조 권리의 귀속
(1) 서비스와 관련된 저작권 등 일체의 지적재산권은 회사에 귀속됩니다.
(2) 회원은 서비스를 이용함으로서 얻은 정보를 회사의 사전 승낙 없이 복제, 송신, 배포, 방송, 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.
(3) 본 사이트에 회원이 게재한 자료와 게시물에 대한 권리와 책임은 게시 당사자에게 있으며 회사는 회원의 동의 없이 이를 영리적인 목적으로 사용하지 않습니다.
제20조 책임제한
(1) "회사"는 천재지변 또는 이에 준하는 불가항력으로 인하여 "서비스"를 제공할 수 없는 경우에는 "서비스" 제공에 관한 책임이 면제됩니다.
(2) "회사"는 "회원"의 귀책사유로 인한 "서비스" 이용의 장애에 대하여는 책임을 지지 않습니다.
(3) "회사"는 "회원"이 "서비스"와 관련하여 게재한 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는 책임을 지지 않습니다.
(4) "회사"는 "회원" 간 또는 "회원"과 제3자 상호간에 "서비스"를 매개로 하여 거래 등을 한 경우에는 책임이 면제됩니다.
(5) "회사"는 무료로 제공되는 서비스 이용과 관련하여 관련법에 특별한 규정이 없는 한 책임을 지지 않습니다.
제21조 분쟁 시 준거법과 관할법원
(1) 회사와 회원은 서비스와 관련하여 발생한 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 한다.
(2) 전항의 경우에도 불구하고 분쟁으로 인한 소송이 제기될 경우 서울중앙지방법원을 관할법원으로 하여 해결한다.
(3) 회사와 이용자간에 발생하는 분쟁에 관하여는 한국법을 적용한다.
부칙
(시행일) 2009년 5월 20일부터 시행되던 종전의 약관은 본 약관으로 대체합니다.
(시행일) 2009년 5월 20일부터 시행되던 종전의 약관은 2011년 6월 16일 본 약관으로 대체합니다.
(시행일) 2011년 6월 16일부터 시행되던 종전의 약관은 2011년 10월 31일 본 약관으로 대체합니다.
(시행일) 2011년 10월 31일부터 시행되던 종전의 약관은 2015년 7월 28일 본 약관으로 대체합니다.
(시행일) 2015년 7월 28일부터 시행되던 종전의 약관은 2015년 12월 1일 본 약관으로 대체합니다.
(시행일) 2015년 12월 1일부터 시행되던 종전의 약관은 2019년 11월 18일 본 약관으로 대체합니다.
		                        			</textarea>
			                        		<div class="radio">
			                            		<label>
			                                		<input type="radio" id="memberInfoY" name="memberInfoYn" value="Y" checked>
			                                		동의합니다.
			                            		</label>
			                        		</div>
			                       			 <div class="radio">
			                            		<label>
			                                		<input type="radio" id="memberInfoN" name="memberInfoYn" value="N" onclick="alertNot(event)">
			                                		동의하지 않습니다.
			                            		</label>
			                        		</div>
		                    			</div>
		                			</div>
									<div class="form-group">
										<label>이름</label>
										<input type="text" class="form-control" name="username" placeholder="예)홍길동"/>
									</div>
									<div class="form-group">
										<label>아이디</label>
										<input type="text" class="form-control" name="userid" placeholder="영문(대소문자),숫자를 조합해주세요."/>
									</div>
									<div class="form-group">
										<label>비밀번호</label>
										<input type="password" class="form-control" name="userpwd" placeholder="영문(대소문자),숫자,특수기호를 조합해주세요."/>
									</div>
									<div class="form-group">
										<label>생년월일</label>
										<div>
											<input type="date" class="form-control" name="userbirth" id="dayId" value="dayValue" onchange="checkDate(event)" />
										</div>
									</div>
									<!-- 라디오버튼 예시 시작 -->
									<div class="form-group">
										<label>성별</label>
										<div>
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" class="custom-control-input" name="usergender" id="gender-male" value="M" checked>
												<label class="custom-control-label" for="gender-male">남자</label>
			  								</div>
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" class="custom-control-input" name="usergender" id="gender-female" value="F">
												<label class="custom-control-label" for="gender-female">여자</label>
			  								</div>
										</div>
									</div>
									<!-- 라디오버튼 예시 끝 -->
									<div class="form-group">
		                        		<label>휴대폰 번호</label>
		                        			<input type="tel" class="form-control" name="usertel" id="inputMobile" placeholder="예)010-1234-5678">
		                    		</div>
									<div class="form-group">
										<label for="exampleFormControlInput1">이메일</label>
		    							<input type="email" class="form-control" name="useremail" id="exampleFormControlInput1" placeholder="예)name@example.com">
									</div>
									<div class="form-group">
										<label>이메일 수신여부</label>
		                    			<label>
		                            		<input type="radio" id="emailReceiveY" name="emailReceiveYn" value="Y" checked> 동의합니다. &emsp;
		                       			</label>
		                        		<label>
		                            		<input type="radio" id="emailReceiveN" name="emailReceiveYn" value="N" onclick="ReceiveEmailNot()"> 동의하지 않습니다.
		                        		</label>
									</div>
									
									 <div class="form-group">
		                    			<label>SMS 수신여부</label>
				                        <label>
				                            <input type="radio" id="smsReceiveY" name="smsReceiveYn" value="Y" checked> 동의합니다. &emsp;
				                        </label>
				                        <label class="radio-inline">
				                            <input type="radio" id="smsReceiveN" name="smsReceiveYn" value="N" onclick="ReceiveSmsNot()"> 동의하지 않습니다.
				                        </label>
		                    		</div>
		                
									
									<div class="text-right">
										<button type="submit" class="btn btn-primary">가입하기</button>
									</div>
								</form>
							<%
								}
							%>
								<!-- 회원가입 입력 폼 끝  -->
							</div>
						</div>
						<!-- 회원가입폼을 포함하고 있는 card 컴포넌트 시작 -->
					</div>
				</div>
			<!-- 오류알림과 입력폼을 포함하는 row 끝 -->
			</div>
		</div>
	<!-- body 종료 -->
	</div>
	<div class="mb-3"></div>
<!-- container 종료 -->
</div>
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">

	var today = new Date();
	var currentDate = today.getFullYear() + "-" + ( ("0" + (today.getMonth() + 1)).slice(-2) ) + "-" + ("0" + today.getDate()).slice(-2);

function alertNot(event) {
		if(alert('약관에 동의해주세요.')){
			
		} else {
			event.preventDefault();
		}
	}
	function checkField(event) {
		
		var nameField = document.querySelector("input[name=username]");
		var idField = document.querySelector("input[name=userid]");
		var pwdField = document.querySelector("input[name=userpwd]");
		var birthField = document.querySelector("input[name=userbirth]");
		var genderField = document.querySelector("input[name=usergender]");
		var telField = document.querySelector("input[name=usertel]");
		var emailField = document.querySelector("input[name=useremail]");

		if(!nameField.value) {
			alert('이름을 입력하세요.');
			event.preventDefault();
			return;
		}
		if(!idField.value) {
			alert('아이디를 입력하세요.');
			event.preventDefault();
			return;
		}

		var pattern_kor = '/[^ㄱ-ㅎ가-힣]/g';
		
		if(pattern_kor.test(idField)) {
			alert("아이디에 한글은 포함할 수 없습니다.")
			event.preventDefault();
			return;			
		}
		
		if(!pwdField.value) {
			alert('비밀번호를 입력하세요.');
			event.preventDefault();
			return;
		}
		if(!birthField.value) {
			alert('생일을 선택하세요.');
			event.preventDefault();
			return;
		}
		if(!genderField.value) {
			alert('성별을 선택하세요.');
			event.preventDefault();
			return;
		}
		if(!telField.value) {
			alert('전화번호를 입력하세요.("-"를 입력하여 적으세요.)');
			event.preventDefault();
			return;
		}
		if(!emailField.value) {
			alert('이메일을 입력하세요.');
			event.preventDefault();
			return;
		}


	}
	
	function ReceiveEmailNot() {
		alert("<%=sf.format(nowTime)%>일 부로 이메일 수신을 거부 하셨습니다.");
		return;
	}
	
	function ReceiveSmsNot() {
		alert("<%=sf.format(nowTime)%>일 부로 SMS 수신을 거부 하셨습니다.");
		return;
	}	


	
	function checkDate(event) {
		var clickedDate = event.target.value;

		if (currentDate < clickedDate) {
			alert("미래 시간은 입력할 수 없습니다. \n현재 날짜로 입력됩니다.");
			event.target.value = currentDate;
		}
		
	}

</script>
</body>
</html>