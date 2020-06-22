<%@page import="com.domino.vo.Side"%>
<%@page import="com.domino.dao.SideDao"%>
<%@page import="com.domino.util.StringUtil"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String saveDirectory = application.getInitParameter("sidemenuImgSaveDirectory");
	int maxPostSize = NumberUtil.stringToInt(application.getInitParameter("maxUploadFileSize"));
	String encoding = "utf-8";

	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
	int sideNo = NumberUtil.stringToInt(mr.getParameter("sideno"));
	String yn = StringUtil.nullToBlank(mr.getParameter("yn"));
	
	SideDao sideDao = new SideDao();
	Side oldSide = sideDao.getSideByNo(sideNo);
	
	if ("y".equals(yn)) {
		oldSide.setDisableYn("y");

	} else if ("n".equals(yn)) {
		// 사이드객체 넣을 값 준비
		String name = mr.getParameter("name");
		String imageSrc = mr.getFilesystemName("upfile");
		
		int price = NumberUtil.stringToInt(mr.getParameter("price"));

		// 사이드 객체에 값 넣기
		oldSide.setName(name);
		if (imageSrc != null) {
			oldSide.setImageSrc(imageSrc);			
		}
		oldSide.setPrice(price);
		
	} else if ("yn".equals(yn)) {
		oldSide.setDisableYn("n");
	}
	
	sideDao.updateSide(oldSide);
	
	response.sendRedirect("/domino/manager/menulist.jsp?searchOption=side");
%>
