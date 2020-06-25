<%@page import="com.domino.util.StringUtil"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.domino.vo.Pizza"%>
<%@page import="com.domino.dao.PizzaDao"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String saveDirectory = application.getInitParameter("pizzaImgSaveDirectory");
	int maxPostSize = NumberUtil.stringToInt(application.getInitParameter("maxUploadFileSize"));
	String encoding = "utf-8";

	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
	int pizzaNo = NumberUtil.stringToInt(mr.getParameter("pizzano"));
	String yn = StringUtil.nullToBlank(mr.getParameter("yn"));
	

	PizzaDao pizzaDao = new PizzaDao();
	Pizza oldPizza = pizzaDao.getPizzaByNo(pizzaNo);


	if ("y".equalsIgnoreCase(yn)) {
		oldPizza.setDisableYn("y");

	} else if ("n".equalsIgnoreCase(yn)) {
		// 피자객체 넣을 값 준비
		String name = mr.getParameter("name");
		String imageSrc = mr.getFilesystemName("upfile");
		int lPrice = NumberUtil.stringToInt(mr.getParameter("lprice"));
		int mPrice = NumberUtil.stringToInt(mr.getParameter("mprice"));

		// 피자객체에 값 넣기
		oldPizza.setName(name);
		if (imageSrc != null) {
			oldPizza.setImageSrc("/domino/resource/images/pizzas/"+imageSrc);			
		}
		oldPizza.setLprice(lPrice);
		oldPizza.setMprice(mPrice);
	} else if ("yn".equals(yn)) {
		oldPizza.setDisableYn("n");
	}


	pizzaDao.updatePizza(oldPizza);

	response.sendRedirect("/domino/manager/menulist.jsp?searchOption=pizza");
%>