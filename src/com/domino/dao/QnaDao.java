package com.domino.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.domino.dto.QuestionDto;
import com.domino.util.ConnectionUtil;
import com.domino.util.JdbcHelper;
import com.domino.util.JdbcHelper.RowMapper;
import com.domino.util.QueryUtil;
import com.domino.vo.Answer;
import com.domino.vo.Question;

public class QnaDao {
	
	private QuestionDto resultSetToQuestion(ResultSet rs) throws SQLException {
		QuestionDto questionDto = new QuestionDto();
		
		questionDto.setNo(rs.getInt("question_no"));
		questionDto.setWriter(rs.getInt("question_writer"));
		questionDto.setTitle(rs.getString("question_title"));
		questionDto.setContent(rs.getString("question_content"));
		questionDto.setAnsweredYn(rs.getString("answered_yn"));
		questionDto.setQuestionDelYn(rs.getString("question_del_yn"));
		questionDto.setRegDate(rs.getDate("question_reg_date"));
		questionDto.setUserName(rs.getString("user_name"));
		questionDto.setUserEmail(rs.getString("user_email"));
		questionDto.setUserTel(rs.getString("user_tel"));
		questionDto.setUserId(rs.getString("user_id"));
		
		return questionDto;
	}
	
	/**
	 * 모든 문의게시물을 불러오는 메소드
	 * @return 모든 문의 리스트
	 * @throws SQLException
	 * @author 연성
	 */
	public List<QuestionDto> getAllQuestion() throws SQLException {
		List<QuestionDto> questionDtos = new ArrayList<QuestionDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("qna.getAllQuestion"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			QuestionDto questionDto = new QuestionDto();
			
			questionDto = resultSetToQuestion(rs);
			
			questionDtos.add(questionDto);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return questionDtos;
	}
	
	/**
	 * 유저번호와 일치하는 문의게시물을 불러오는 메소드
	 * @param userNo 유저번호
	 * @return 문의게시물 리스트
	 * @throws SQLException
	 */
	public List<QuestionDto> getQuestionByUserno(int userNo) throws SQLException {
		List<QuestionDto> questionDtoList = JdbcHelper.selectList(QueryUtil.getSQL("qna.getQuestionByUserno"), 
				new RowMapper<QuestionDto>() {
					public QuestionDto mapRow(ResultSet rs) throws SQLException {
						QuestionDto questionDto = new QuestionDto();
						
						questionDto.setNo(rs.getInt("question_no"));
						questionDto.setWriter(rs.getInt("question_writer"));
						questionDto.setTitle(rs.getString("question_title"));
						questionDto.setContent(rs.getString("question_content"));
						questionDto.setAnsweredYn(rs.getString("answered_yn"));
						questionDto.setQuestionDelYn(rs.getString("question_del_yn"));
						questionDto.setRegDate(rs.getDate("question_reg_date"));
						questionDto.setUserName(rs.getString("user_name"));
						questionDto.setUserEmail(rs.getString("user_email"));
						questionDto.setUserTel(rs.getString("user_tel"));
						questionDto.setUserId(rs.getString("user_id"));
		
						return questionDto;
					}
				
				}, userNo);
		return questionDtoList;
	}
	
	public QuestionDto getQuestionByNo(int questionNo) throws SQLException {
		QuestionDto questionDto = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("qna.getQuestionByNo"));
		pstmt.setInt(1, questionNo);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			questionDto = resultSetToQuestion(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return questionDto;
	}
	
	public void insertAnswer(Answer answer) throws SQLException {		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("qna.insertAnswer"));
		pstmt.setInt(1, answer.getQuestionNo());
		pstmt.setString(2, answer.getContent());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void updateQuestion(Question question) throws SQLException {		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("qna.updateQuestion"));
		pstmt.setString(1, question.getTitle());
		pstmt.setString(2, question.getContent());
		pstmt.setString(3, question.getAnsweredYn());
		pstmt.setString(4, question.getQuestionDelYn());
		pstmt.setInt(5, question.getNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void insertQuestion(Question question) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("qna.insertQuestion"));
		pstmt.setInt(1, question.getWriter());
		pstmt.setString(2, question.getType());
		pstmt.setInt(3, question.getBranchNo());
		pstmt.setString(4, question.getTitle());
		pstmt.setString(5, question.getContent());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public List<Question> getQuestionAllByUserNo(int questionWriter) throws SQLException {
		List<Question> questions = new ArrayList<Question>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("qna.getQuestionAllByUserNo"));
		pstmt.setInt(1,questionWriter);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Question question = new Question();
			question.setNo(rs.getInt("num"));
			question.setTitle(rs.getString("question_title"));
			question.setRegDate(rs.getDate("question_reg_date"));
			question.setAnsweredYn(rs.getString("answered_yn"));
			
			questions.add(question);
			
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return questions;
	}
}


















