<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.domino.vo.User"%>
<%@page import="com.domino.dao.UserDao"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@ page contentType="application/json; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true" %>
<%
	int userNo = NumberUtil.stringToInt(request.getParameter("userno"));
	
	UserDao userDao = new UserDao();
	User user = userDao.getUserByNo(userNo);
	
	Map<String, Object> userMap = new HashMap<String, Object>();
	userMap.put("name", user.getName());
	userMap.put("tel1", user.getTel().substring(0, 3));
	userMap.put("tel2", user.getTel().substring(4, 8));
	userMap.put("tel3", user.getTel().substring(9, 13));
	
	Gson gson = new Gson();
	String jsonText = gson.toJson(userMap);
	
	out.write(jsonText);
%>