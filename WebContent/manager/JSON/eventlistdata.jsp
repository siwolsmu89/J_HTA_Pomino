<%@page import="com.google.gson.Gson"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.domino.vo.Event"%>
<%@page import="java.util.List"%>
<%@page import="com.domino.dao.EventDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String searchOpt = request.getParameter("searchOpt");
	String searchValue = request.getParameter("searchValue");
	
	EventDao eventDao = new EventDao();
	Event event = new Event();
	
	if("eventno".equals(searchOpt)){
		event = eventDao.getEventByNo(NumberUtil.stringToInt(searchValue));
	} else if("eventname".equals(searchOpt)){
		event = eventDao.getEventByName(searchValue);
	}
	
	Gson gson = new Gson();
	String jsonContent = gson.toJson(event);
	
	out.write(jsonContent);
%>