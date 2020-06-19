<%@page import="com.domino.util.NumberUtil"%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<link rel="shortcut icon" type="image/x-icon" href="../resource/images/logo/nomido.png" />
<%
	//로그인 여부를 확인하고 로그인이 되어있을 때만 접속하는 페이지에 파일을 포함시킨다.
	String loginYn = (String)session.getAttribute("로그인여부");
	//사용자아이디 대신 사용자번호를 사용하여 사용자를 식별한다.
	int loginUserNo = NumberUtil.stringToInt(((String)"" + session.getAttribute("사용자번호")));
	String loginUserName = (String)session.getAttribute("사용자이름");
%>
<script type="text/javascript">
	document.title = "포미노 피자 - 당신의 인생에 완벽한 한 끼! Life Food, Pomino's";
</script>