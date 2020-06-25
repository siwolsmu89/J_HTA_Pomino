<%@page import="com.domino.vo.Dough"%>
<%@page import="com.domino.dao.DoughDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	// 파입업로드 세팅
	String saveDirectory = application.getInitParameter("doughImgSaveDirectory");
	int maxPostSize = NumberUtil.stringToInt(application.getInitParameter("maxUploadFileSize"));
	String encoding = "utf-8";

	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding,
			new DefaultFileRenamePolicy());
	System.out.println(mr.getParameter("upfile"));

	// 도우객체 넣을 값 준비
	String name = mr.getParameter("name");
	String imageSrc = mr.getFilesystemName("upfile");
	int price = NumberUtil.stringToInt(mr.getParameter("price"));
	
	// 중복체크	
	DoughDao doughDao = new DoughDao();
	Dough doughDup = doughDao.getDoughByName(name);
	if(doughDup != null){
		response.sendRedirect("/domino/manager/doughform.jsp?error=dup");
	}
	
	// 도우객체에 값 넣기
	Dough dough = new Dough();
	dough.setName(name);
	dough.setImageSrc("/domino/resource/images/doughs/"+imageSrc);
	dough.setPrice(price);
	
	// 도우 생성
	doughDao.insertDough(dough);
	
	response.sendRedirect("/domino/manager/menulist.jsp");
%>