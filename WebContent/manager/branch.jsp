<%@page import="com.domino.dao.BranchDao"%>
<%@page import="com.domino.vo.Branch"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	// 파입업로드 세팅
	String saveDirectory = application.getInitParameter("branchImgSaveDirectory");
	int maxPostSize = NumberUtil.stringToInt(application.getInitParameter("maxUploadFileSize"));
	String encoding = "utf-8";

	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding,
			new DefaultFileRenamePolicy());
	System.out.println(mr.getParameter("upfile"));

	// 가맹점 객체에 넣을 값 준비	
	String name = mr.getParameter("name");
	String tel = mr.getParameter("tel");
	String addrFirst = mr.getParameter("addrfirst");
	String addrSecond = mr.getParameter("addrsecond");
	String addrDetail = mr.getParameter("addrdetail");
	String openTime = mr.getParameter("opentime");
	String closeTime = mr.getParameter("closetime");
	String comment = mr.getParameter("comment");
	String imageSrc = mr.getFilesystemName("upfile");		
	
	// 중복체크
	BranchDao branchDao = new BranchDao();
	Branch branchDup = branchDao.getBranchByName(name);
	if(branchDup != null){
		response.sendRedirect("/domino/manager/branchform.jsp?error=dup");
	}
	
	// 가맹점 객체에 값 넣기
	Branch branch = new Branch();
	branch.setName(name);
	branch.setTel(tel);
	branch.setAddrFirst(addrFirst);
	branch.setAddrSecond(addrSecond);
	branch.setAddrDetail(addrDetail);
	branch.setOpenTime(openTime);
	branch.setCloseTime(closeTime);
	branch.setComment(comment);
	branch.setImageSrc("/domino/resource/images/branches/"+imageSrc);	

	// 가맹점 생성
	branchDao.insertBranch(branch);
	
	// 가맹점 이름으로 가맹점번호 불러오기
	Branch branchForNo = branchDao.getBranchByName(branch.getName());
	int branchNo = branchForNo.getNo();
	
	// 회원가입 페이지에 가맹점번호 붙여서 넘겨주기
	response.sendRedirect("/domino/user/signupform.jsp?status=branch&branchNo="+branchNo);
%>


















