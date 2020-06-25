<%@page import="com.domino.vo.Topping"%>
<%@page import="com.domino.dao.ToppingDao"%>
<%@page import="com.domino.util.StringUtil"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String saveDirectory = application.getInitParameter("toppingImgSaveDirectory");
	int maxPostSize = NumberUtil.stringToInt(application.getInitParameter("maxUploadFileSize"));
	String encoding = "utf-8";

	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
	int toppingNo = NumberUtil.stringToInt(mr.getParameter("toppingno"));
	String yn = StringUtil.nullToBlank(mr.getParameter("yn"));

	ToppingDao toppingDao = new ToppingDao();
	Topping oldTopping = toppingDao.getToppingByNo(toppingNo);

	if ("y".equals(yn)) {
		oldTopping.setDisableYn("y");

	} else if ("n".equals(yn)) {
		// 토핑객체 넣을 값 준비
		String name = mr.getParameter("name");
		String imageSrc = mr.getFilesystemName("upfile");
		int category = NumberUtil.stringToInt(mr.getParameter("category"));
		int price = NumberUtil.stringToInt(mr.getParameter("price"));

		// 토핑 객체에 값 넣기
		oldTopping.setName(name);
		oldTopping.setCategory(category);
		if (imageSrc != null) {
			oldTopping.setImageSrc("/domino/resource/images/toppings/"+imageSrc);
		}
		oldTopping.setPrice(price);

	} else if ("yn".equals(yn)) {
		oldTopping.setDisableYn("N");
	}

	toppingDao.updateTopping(oldTopping);

	response.sendRedirect("/domino/manager/menulist.jsp?searchOption=topping");
%>