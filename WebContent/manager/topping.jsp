<%@page import="com.domino.dao.ToppingDao"%>
<%@page import="com.domino.vo.Topping"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	//파입업로드 세팅
	String saveDirectory = application.getInitParameter("toppingImgSaveDirectory");
	int maxPostSize = NumberUtil.stringToInt(application.getInitParameter("maxUploadFileSize"));
	String encoding = "utf-8";

	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding,
			new DefaultFileRenamePolicy());
	System.out.println(mr.getParameter("upfile"));

	// 토핑객체 넣을 값 준비
	String name = mr.getParameter("name");
	String imageSrc = mr.getFilesystemName("upfile");
	int category = NumberUtil.stringToInt("category");
	int price = NumberUtil.stringToInt(mr.getParameter("price"));
	// 중복체크
	ToppingDao toppingDao = new ToppingDao();
	Topping toppingDup = toppingDao.getToppingByName(name);
	if(toppingDup != null) {
		response.sendRedirect("/domino/manager/toppingform.jsp?error=dup");
	}
	
	// 토핑객체에 값 넣기
	Topping topping = new Topping();
	topping.setName(name);
	topping.setImageSrc("/domino/resource/images/toppings/"+imageSrc);
	topping.setCategory(category);
	topping.setPrice(price);

	// 토핑 생성
	toppingDao.insertTopping(topping);

	response.sendRedirect("/domino/manager/menulist.jsp");
%>