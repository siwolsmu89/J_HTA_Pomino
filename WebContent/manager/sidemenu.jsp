<%@page import="com.domino.dao.SideDao"%>
<%@page import="com.domino.vo.Side"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	//파입업로드 세팅
	String saveDirectory = application.getInitParameter("sidemenuImgSaveDirectory");
	int maxPostSize = NumberUtil.stringToInt(application.getInitParameter("maxUploadFileSize"));
	String encoding = "utf-8";
	
	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
	System.out.println(mr.getParameter("upfile"));
	
	// 사이드메뉴객체 넣을 값 준비
	String name = mr.getParameter("name");
	String imageSrc = mr.getFilesystemName("upfile");
	int price = NumberUtil.stringToInt(mr.getParameter("price"));
	
	//중복체크	
	SideDao sideDao = new SideDao();
	Side sideDup = sideDao.getSideByName(name);
	if(sideDup != null){
		response.sendRedirect("/domino/manager/sidemenuform.jsp?error=dup");
	}
	
	// 사이드객체에 값 넣기
	Side side = new Side();
	side.setName(name);
	side.setImageSrc("/domino/resource/images/sides/"+imageSrc);
	side.setPrice(price);
	
	// 사이드 생성
	sideDao.insertSide(side);
	
	response.sendRedirect("/domino/manager/menulist.jsp");
%>