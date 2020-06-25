<%@page import="java.util.Date"%>
<%@page import="com.domino.dao.EventDao"%>
<%@page import="com.domino.vo.Event"%>
<%@page import="com.domino.util.StringUtil"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	// 파입업로드 세팅
	String saveDirectory = application.getInitParameter("eventImgSaveDirectory");
	int maxPostSize = NumberUtil.stringToInt(application.getInitParameter("maxUploadFileSize"));
	String encoding = "utf-8";

	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding,
			new DefaultFileRenamePolicy());

	// 이벤트객체 넣을 값 준비
	String name = mr.getParameter("name");
	Date startDate = StringUtil.stringToDate(mr.getParameter("startdate"));
	Date endDate = StringUtil.stringToDate(mr.getParameter("enddate"));
	Double discountRate = NumberUtil.stringToDouble(mr.getParameter("discountrate"));
	int pizzaNo = NumberUtil.stringToInt(mr.getParameter("pizzano"));
	String imageSrc = mr.getFilesystemName("upfile");
	
	// 중복체크
	EventDao eventDao = new EventDao();
	Event eventDup = eventDao.getEventByPizzaNo(pizzaNo);
	if(eventDup != null) {
		response.sendRedirect("/domino/manager/eventform.jsp?error=dup");
	}
	
	// 이벤트객체에 값 넣기
	Event event = new Event();
	event.setName(name);
	event.setStartDate(startDate);
	event.setEndDate(endDate);
	event.setDiscountRate(discountRate);
	event.setPizzaNo(pizzaNo);
	event.setImageSrc("/domino/resource/images/event/"+imageSrc);

	// 이벤트 생성
	eventDao.insertEvent(event);

	response.sendRedirect("/domino/manager/eventlist.jsp");
%>