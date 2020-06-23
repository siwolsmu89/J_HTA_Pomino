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
	int beginNumber = NumberUtil.stringToInt(request.getParameter("beginNumber"));
	int endNumber = NumberUtil.stringToInt(request.getParameter("endNumber"));
	
	EventDao eventDao = new EventDao();
	List<Event> events = new ArrayList<Event>();
	Event event = new Event();
	
	if("eventno".equals(searchOpt)){
		if(searchValue.isEmpty()){
			events = eventDao.getAllEvent(beginNumber, endNumber);
		} else {
			event = eventDao.getEventByNo(NumberUtil.stringToInt(searchValue));
			events.add(event);			
		}
	} else if("eventname".equals(searchOpt)){
		events = eventDao.getEventsByNameWithRange(searchValue, beginNumber, endNumber);
	}
	
	Gson gson = new Gson();
	String jsonContent = gson.toJson(events);
	
	out.write(jsonContent);
%>