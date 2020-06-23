<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.domino.dto.QuestionDto"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@page import="com.domino.vo.Question"%>
<%@page import="com.domino.dao.QnaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String searchOpt = request.getParameter("searchOpt");
	String searchValue = request.getParameter("searchValue");
	int beginNumber = NumberUtil.stringToInt(request.getParameter("beginNumber"));
	int endNumber = NumberUtil.stringToInt(request.getParameter("endNumber"));
	
	QnaDao qnaDao = new QnaDao();
	QuestionDto questionDto = new QuestionDto();
	List<QuestionDto> questionDtos = new ArrayList<QuestionDto>();
	
	if("qnano".equals(searchOpt)){
		if(searchValue.isEmpty()){
			questionDtos = qnaDao.getAllQuestion(beginNumber, endNumber);					
		} else {
			questionDto = qnaDao.getQuestionByNo(NumberUtil.stringToInt(searchValue));
			questionDtos.add(questionDto);			
		}
	} else if("qnawriter".equals(searchOpt)){
		
		questionDtos = qnaDao.getQuestionByWriter(searchValue, beginNumber, endNumber);
		
	} else if("qnatitle".equals(searchOpt)){
		
		questionDtos = qnaDao.getQuestionByTitle(searchValue, beginNumber, endNumber);
		
	}
	
	Gson gson = new Gson();
	String jsonContent = gson.toJson(questionDtos);
	
	out.write(jsonContent);
%>