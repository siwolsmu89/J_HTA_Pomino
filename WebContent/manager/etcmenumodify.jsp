<%@page import="com.domino.vo.Etc"%>
<%@page import="com.domino.dao.EtcDao"%>
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
	int etcNo = NumberUtil.stringToInt(mr.getParameter("etcno"));
	String yn = StringUtil.nullToBlank(mr.getParameter("yn"));

	EtcDao etcDao = new EtcDao();
	Etc oldEtc = etcDao.getEtcByNo(etcNo);

	if ("y".equals(yn)) {
		oldEtc.setDisableYn("y");

	} else if ("n".equals(yn)) {
		// 기타메뉴 객체 넣을 값 준비
		String name = mr.getParameter("name");
		String imageSrc = mr.getFilesystemName("upfile");
		int price = NumberUtil.stringToInt(mr.getParameter("price"));

		// 기타메뉴 객체에 값 넣기
		oldEtc.setName(name);
		if (imageSrc != null) {
			oldEtc.setImageSrc("/domino/resource/images/etcs/"+imageSrc);
		}
		oldEtc.setPrice(price);

	} else if ("yn".equals(yn)) {
		oldEtc.setDisableYn("N");
	}

	etcDao.updateEtc(oldEtc);

	response.sendRedirect("/domino/manager/menulist.jsp?searchOption=etc");
%>