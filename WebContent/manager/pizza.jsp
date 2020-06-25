<%@page import="com.domino.vo.Pizza"%>
<%@page import="com.domino.dao.PizzaDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	// 파입업로드 세팅
	String saveDirectory = application.getInitParameter("pizzaImgSaveDirectory");
	int maxPostSize = NumberUtil.stringToInt(application.getInitParameter("maxUploadFileSize"));
	String encoding = "utf-8";
	
	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
	
	// 피자객체 넣을 값 준비
	String name = mr.getParameter("name");
	String imageSrc = mr.getFilesystemName("upfile");
	int lPrice = NumberUtil.stringToInt(mr.getParameter("lprice"));
	int mPrice = NumberUtil.stringToInt(mr.getParameter("mprice"));
	
	// 중복체크
	PizzaDao pizzaDao = new PizzaDao();
	Pizza pizzaDup = pizzaDao.getPizzaByName(name);
	if(pizzaDup != null){
		response.sendRedirect("/domino/manager/pizzaform.jsp?error=dup");
	}
	
	// 피자객체에 값 넣기
	Pizza pizza = new Pizza();
	pizza.setName(name);
	pizza.setImageSrc("/domino/resource/images/pizzas/"+imageSrc);
	pizza.setLprice(lPrice);
	pizza.setMprice(mPrice);
	
	// 피자 생성
	pizzaDao.insertPizza(pizza);
	
	response.sendRedirect("/domino/manager/menulist.jsp");
%>