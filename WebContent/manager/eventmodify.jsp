<%@page import="java.util.Date"%>
<%@page import="com.domino.vo.Event"%>
<%@page import="com.domino.dao.EventDao"%>
<%@page import="com.domino.util.StringUtil"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String saveDirectory = application.getInitParameter("eventImgSaveDirectory");
	int maxPostSize = NumberUtil.stringToInt(application.getInitParameter("maxUploadFileSize"));
	String encoding = "utf-8";

	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
	int eventNo = NumberUtil.stringToInt(mr.getParameter("eventno"));
	String yn = StringUtil.nullToBlank(mr.getParameter("yn"));

	EventDao eventDao = new EventDao();
	Event oldEvent = eventDao.getEventByNo(eventNo);

	if ("Y".equalsIgnoreCase(yn)) {
		oldEvent.setDisableYn("Y");

	} else if ("N".equalsIgnoreCase(yn)) {
		// 이벤트 객체 넣을 값 준비
		String name = mr.getParameter("name");
		Date startDate = StringUtil.stringToDate(mr.getParameter("startdate"));
		Date endDate = StringUtil.stringToDate(mr.getParameter("enddate"));
		Double discountRate = NumberUtil.stringToDouble(mr.getParameter("discountrate"));
		int pizzaNo = NumberUtil.stringToInt(mr.getParameter("pizzano"));
		String imageSrc = mr.getFilesystemName("upfile");

		// 이벤트 객체에 값 넣기
		oldEvent.setName(name);
		if (imageSrc != null) {
			oldEvent.setImageSrc("/domino/resource/images/event/"+imageSrc);
		}
		oldEvent.setName(name);
		oldEvent.setStartDate(startDate);
		oldEvent.setEndDate(endDate);
		oldEvent.setDiscountRate(discountRate);
		oldEvent.setPizzaNo(pizzaNo);
	
	} else if ("YN".equalsIgnoreCase(yn)) {
		oldEvent.setDisableYn("N");
	}

	eventDao.updateEvent(oldEvent);

	response.sendRedirect("/domino/manager/eventlist.jsp");
%>