<%@page import="com.domino.vo.Dough"%>
<%@page import="com.domino.dao.DoughDao"%>
<%@page import="com.domino.util.StringUtil"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String saveDirectory = application.getInitParameter("doughImgSaveDirectory");
	int maxPostSize = NumberUtil.stringToInt(application.getInitParameter("maxUploadFileSize"));
	String encoding = "utf-8";

	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
	int doughNo = NumberUtil.stringToInt(mr.getParameter("doughno"));
	String yn = StringUtil.nullToBlank(mr.getParameter("yn"));

	DoughDao doughDao = new DoughDao();
	Dough oldDough = doughDao.getDoughByNo(doughNo);

	if ("y".equals(yn)) {
		oldDough.setDisableYn("y");

	} else if ("n".equals(yn)) {
		// 사이드객체 넣을 값 준비
		String name = mr.getParameter("name");
		String imageSrc = mr.getFilesystemName("upfile");

		int price = NumberUtil.stringToInt(mr.getParameter("price"));

		// 사이드 객체에 값 넣기
		oldDough.setName(name);
		if (imageSrc != null) {
			oldDough.setImageSrc("/domino/resource/images/doughs/"+imageSrc);
		}
		oldDough.setPrice(price);

	} else if ("yn".equals(yn)) {
		oldDough.setDisableYn("N");
	}

	doughDao.updateDough(oldDough);

	response.sendRedirect("/domino/manager/menulist.jsp?searchOption=dough");
%>