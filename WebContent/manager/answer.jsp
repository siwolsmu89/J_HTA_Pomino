<%@page import="com.domino.vo.Answer"%>
<%@page import="com.domino.vo.Question"%>
<%@page import="com.domino.dto.QuestionDto"%>
<%@page import="com.domino.dao.QnaDao"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	QnaDao qnaDao = new QnaDao();
	int questionNo = NumberUtil.stringToInt(request.getParameter("questionno"));
	String answerContent = request.getParameter("answercontent");
	
	// 문의객체 불러와서 답변여부 Y => 업데이트
	QuestionDto questionDto = qnaDao.getQuestionByNo(questionNo);
	Question oldQuestion = new Question();
	
	oldQuestion.setNo(questionDto.getNo());
	oldQuestion.setTitle(questionDto.getTitle());
	oldQuestion.setContent(questionDto.getContent());
	oldQuestion.setAnsweredYn("Y");
	oldQuestion.setQuestionDelYn(questionDto.getQuestionDelYn());
	
	qnaDao.updateQuestion(oldQuestion);
	
	// 질문객체 등록
	Answer answer = new Answer();
	answer.setContent(answerContent);
	answer.setQuestionNo(questionNo);
	
	qnaDao.insertAnswer(answer);
	
	response.sendRedirect("/domino/manager/qnaboard.jsp");
%>