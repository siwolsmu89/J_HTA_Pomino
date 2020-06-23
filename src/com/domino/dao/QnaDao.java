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
	
	/**
	 * ResultSet에서 가져온 정보들을 QuestionDto에 담는 메소드. 다른 메소드 안에서만 사용할 것이므로 private 제한자를 지정
	 * @param ResultSet rs
	 * @return 정보가 채워진 QuestionDto 객체
	 * @throws SQLException
	 * @author 연성
	 */
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
	 * 모든 문의게시물 리스트를 불러오는 메소드
	 * @return 문의 정보와 사용자 정보 데이터를 questionDto에 담아 모든 문의 리스트를 반환
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
	 * pagination을 사용한 모든 문의게시물 리스트를 불러오는 메소드
	 * @param beginNumber 시작순번
	 * @param endNumber 종료순번
	 * @return 문의 정보와 사용자 정보를 담은 모든 문의 리스트(QuestionDto)
	 * @throws SQLException
	 * @author 연성
	 */
	public List<QuestionDto> getAllQuestion(int beginNumber, int endNumber) throws SQLException {
		List<QuestionDto> questionDtos = new ArrayList<QuestionDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("qna.getQuestionByRange"));
		pstmt.setInt(1, beginNumber);
		pstmt.setInt(2, endNumber);
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
	 * 총 문의 갯수를 반환하는 메소드.pagination 할 때 사용 
	 * @return 총 문의 갯수
	 * @throws SQLException
	 * @author 연성
	 */
	public int getQnasCount() throws SQLException {
		int count = 0;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("qna.getQuestionsCount"));
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			count = rs.getInt("cnt");
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return count;
	}
	
	/**
	 * 해당하는 사용자 번호와 일치하는 문의게시물을 불러오는 메소드
	 * @param userNo 사용자번호
	 * @return 사용자번호에 해당되는 문의게시물 리스트
	 * @throws SQLException
	 * @author 연성
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
	
	/**
	 * 해당되는 문의번호에 대한 문의 정보를 불러오는 메소드
	 * @param questionNo 문의번호
	 * @return 문의정보를 담은 QuestionDto객체
	 * @throws SQLException
	 * @author 연성
	 */
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
	
	/**
	 * 해당되는 작성자의 문의글에서 pagination 범위안의 글을 반환하는 메소드
	 * @param questionWriter 작성자 이름
	 * @param beginNumber 시작순번
	 * @param endNumber 종료순번
	 * @return 작성자의 글 중 페이지네이션 범위안의 글
	 * @throws SQLException
	 */
	public List<QuestionDto> getQuestionByWriter(String questionWriter, int beginNumber, int endNumber) throws SQLException {
		List<QuestionDto> questionDtos = new ArrayList<QuestionDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("qna.getQuestionByWriter"));
		pstmt.setString(1, questionWriter);
		pstmt.setInt(2, beginNumber);
		pstmt.setInt(3, endNumber);
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
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
	 * 해당되는 문의제목 글 중에서 pagination 범위안의 글을 반환하는 메소드
	 * @param questionWriter 작성자 이름
	 * @param beginNumber 시작순번
	 * @param endNumber 종료순번
	 * @return 특정 문의제목 글 중에서 페이지네이션 범위안의 글
	 * @throws SQLException
	 */
	public List<QuestionDto> getQuestionByTitle(String questionTitle, int beginNumber, int endNumber) throws SQLException {
		List<QuestionDto> questionDtos = new ArrayList<QuestionDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("qna.getQuestionByTitle"));
		pstmt.setString(1, questionTitle);
		pstmt.setInt(2, beginNumber);
		pstmt.setInt(3, endNumber);
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
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
	 * 답변을 등록하는 메소드
	 * @param answer 문의 번호에 해당하는 답변 내용을 저장하는 answer객체
	 * @throws SQLException
	 * @author 연성
	 */
	public void insertAnswer(Answer answer) throws SQLException {		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("qna.insertAnswer"));
		pstmt.setInt(1, answer.getQuestionNo());
		pstmt.setString(2, answer.getContent());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	/**
	 * 문의한 내용에 답변여부와 삭제여부를 수정하는 메소드
	 * @param question 답변여부와 삭제여부를 저장하는 question객체
	 * @throws SQLException
	 * @author 하영
	 */
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
	
	/**
	 * 문의를 등록하는 메소드
	 * @param question 해당하는 사용자번호가 문의 내용을 저장
	 * @throws SQLException
	 * @author 하영
	 */
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
	/**
	 * 해당하는 사용자번호에 모든 문의리스트를 불러오는 메소드
	 * @param questionWriter 사용자번호
	 * @return 해당하는 사용자번호의 문의정보를 담은 문의 리스트(Question)
	 * @throws SQLException
	 * @author 하영
	 */
	public List<Question> getQuestionAllByUserNo(int questionWriter) throws SQLException {
		List<Question> questions = new ArrayList<Question>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("qna.getQuestionAllByUserNo"));
		pstmt.setInt(1,questionWriter);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Question question = new Question();
			question.setNo(rs.getInt("question_no"));
			question.setTitle(rs.getString("question_title"));
			question.setRegDate(rs.getDate("question_reg_date"));
			question.setAnsweredYn(rs.getString("answered_yn"));
			question.setQuestionDelYn(rs.getString("question_del_yn"));
			
			questions.add(question);
			
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return questions;
	}
	
	/**
	 * pagination을 사용한 해당하는 사용자번호에 모든 문의리스트를 불러오는 메소드
	 * @param questionWriter 사용자번호
	 * @param beginNumber 시작순번
	 * @param endNumber 종료순번
	 * @return 해당하는 사용자번호의 문의정보를 담은 문의 리스트(Question)
	 * @throws SQLException
	 * @author 하영
	 */
	public List<Question> getQuestionAllRangeByUserNo(int questionWriter, int beginNumber, int endNumber) throws SQLException {
		List<Question> questions = new ArrayList<Question>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("qna.getQuestionAllRangeByUserNo"));
		pstmt.setInt(1,questionWriter);
		pstmt.setInt(2,beginNumber);
		pstmt.setInt(3,endNumber);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Question question = new Question();
			question.setNo(rs.getInt("question_no"));
			question.setTitle(rs.getString("question_title"));
			question.setRegDate(rs.getDate("question_reg_date"));
			question.setAnsweredYn(rs.getString("answered_yn"));
			question.setQuestionDelYn(rs.getString("question_del_yn"));
			
			questions.add(question);
			
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return questions;
	}
	/**
	 * 해당하는 사용자번호가 문의한 문의상세정보를 불러오는 메소드
	 * @param questionWriter 사용자번호
	 * @param questionNo 문의번호
	 * @return 문의상세정보가 담긴 QuestionDto
	 * @throws SQLException
	 * @author 하영
	 */
	public QuestionDto getQuestionDetailUserQnaByNo(int questionWriter, int questionNo) throws SQLException {
		QuestionDto questionDto = null;
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("qna.getQuestionDetailUserQnaByNo"));
		pstmt.setInt(1, questionWriter);
		pstmt.setInt(2, questionNo);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			questionDto = new QuestionDto();
			questionDto.setWriter(rs.getInt("question_writer"));
			questionDto.setNo(rs.getInt("question_no"));
			questionDto.setType(rs.getString("question_type"));
			questionDto.setBranchAddrFirst(rs.getString("branch_addr_first"));
			questionDto.setBranchName(rs.getString("branch_name"));
			questionDto.setTitle(rs.getString("question_title"));
			questionDto.setContent(rs.getString("question_content"));
			questionDto.setAnswerContent(rs.getString("answer_content"));
			
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		
		return questionDto;
	}
	
	/**
	 * 해당하는 사용자
	 * @param questionNo
	 * @throws SQLException
	 */
	public void deleteQuestion(int questionNo) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("qna.deleteQuestion"));
		pstmt.setInt(1, questionNo);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
		
	}
}


















