<%@page import="com.domino.dao.EtcDao"%>
<%@page import="com.domino.vo.Etc"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	//파입업로드 세팅
	String saveDirectory = application.getInitParameter("etcmenuImgSaveDirectory");
	int maxPostSize = NumberUtil.stringToInt(application.getInitParameter("maxUploadFileSize"));
	String encoding = "utf-8";

	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding,
			new DefaultFileRenamePolicy());
	System.out.println(mr.getParameter("upfile"));

	// 사이드메뉴객체 넣을 값 준비
	String name = mr.getParameter("name");
	String imageSrc = mr.getFilesystemName("upfile");
	int price = NumberUtil.stringToInt(mr.getParameter("price"));
	// 중복체크
	EtcDao etcDao = new EtcDao();
	Etc etcDup = etcDao.getEtcByName(name);
	if(etcDup != null){
		response.sendRedirect("/domino/manager/etcmenuform.jsp?error=dup");
	}
	
	// 사이드객체에 값 넣기
	Etc etc = new Etc();
	etc.setName(name);
	etc.setImageSrc("/domino/resource/images/etcs/"+imageSrc);
	etc.setPrice(price);

	// 사이드 생성
	etcDao.insertEtc(etc);

	response.sendRedirect("/domino/manager/menulist.jsp");
%>