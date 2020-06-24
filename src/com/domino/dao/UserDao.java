package com.domino.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.domino.dto.UserDto;
import com.domino.util.ConnectionUtil;
import com.domino.util.QueryUtil;
import com.domino.vo.Branch;
import com.domino.vo.User;
import com.domino.util.JdbcHelper;
import com.domino.util.JdbcHelper.RowMapper;

public class UserDao {
	
	/**
	 * ResultSet에서 가져온 정보들을 User에 담는 메소드. 다른 메소드 안에서만 사용할 것이므로 private 제한자를 지정
	 * @param ResultSet rs
	 * @return 정보가 채워진 User 객체
	 * @throws SQLException
	 * @author 민석
	 */
	private User resultSetToUser(ResultSet rs) throws SQLException {
		User user = new User();
		
		user.setNo(rs.getInt("user_no"));
		user.setId(rs.getString("user_id"));
		user.setPassword(rs.getString("user_password"));
		user.setName(rs.getString("user_name"));
		user.setBirth(rs.getDate("user_birth"));
		user.setGender(rs.getString("user_gender"));
		user.setTel(rs.getString("user_tel"));
		user.setEmail(rs.getString("user_email"));
		user.setRegDate(rs.getDate("user_reg_date"));
		user.setGradeName(rs.getString("user_grade_name"));
		user.setGradeDate(rs.getDate("user_grade_date"));
		user.setQuitYn(rs.getString("user_quit_yn"));
		user.setQuitReason(rs.getString("user_quit_reason"));
		user.setQuitDetail(rs.getString("user_quit_detail"));
		user.setQuitYn(rs.getString("user_quit_yn"));
		user.setOrderCount(rs.getInt("user_order_count"));
		user.setQuickOrderNo(rs.getInt("quick_order_no"));
		
		return user;
	}
	
	
	
	/**
	 * user객체에 데이터를 담아 DB에 등록하는 메소드
	 * @param user 입력폼에 입력한 데이터를 담아 DB에 저장
	 * @throws SQLException
	 * @author 하영
	 */
	public void insertUser(User user) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.insertUser"));
		
		pstmt.setString(1, user.getId());
		pstmt.setString(2, user.getName());
		pstmt.setString(3, user.getPassword());
		pstmt.setDate(4, new java.sql.Date(user.getBirth().getTime()));
		pstmt.setString(5, user.getGender());
		pstmt.setString(6, user.getTel());
		pstmt.setString(7, user.getEmail());
		pstmt.executeUpdate();
		
		connection.close();
		pstmt.close();
	}
	
	
	/**
	 * DB에 존재하는 user 데이터를 업데이트하는 메소드
	 * @param 새로 변경할 사용자 정보가 담긴 User 객체 user
	 * @throws SQLException
	 * @author 민석
	 */
	public void updateUser(User user) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.updateUser"));
		
		pstmt.setString(1, user.getPassword());
		pstmt.setString(2, user.getTel());
		pstmt.setString(3, user.getEmail());
		pstmt.setString(4, user.getGradeName());
		pstmt.setString(5, user.getQuitYn());
		pstmt.setString(6, user.getQuitReason());
		pstmt.setString(7, user.getQuitDetail());
		pstmt.setInt(8, user.getOrderCount());
		pstmt.setInt(9, user.getQuickOrderNo());
		if (user.getGradeDate() != null) {
			pstmt.setDate(10, new java.sql.Date(user.getGradeDate().getTime()));
		} else {
			pstmt.setDate(10, new java.sql.Date(new Date().getTime()));
		}
		pstmt.setInt(11, user.getNo());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	/**
	 * 회원정보수정 시 데이터를 수정할 때 사용하는 메소드
	 * @param user 새로 변경할 사용자 정보가 담긴 User객체 user
	 * @throws SQLException
	 * @author 하영
	 */
	public void updateModifyUser(User user) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.updateModifyUser"));
		
		pstmt.setString(1, user.getName());
		pstmt.setString(2, user.getId());
		pstmt.setString(3, user.getPassword());
		pstmt.setString(4, user.getTel());
		pstmt.setString(5, user.getEmail());
		pstmt.setInt(6, user.getNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	/**
	 * user번호로 User 정보를 조회하는 메소드
	 * @param userNo 사용자 번호
	 * @return 조회에 성공하면 정보가 들어 있는 User 객체가 반환되고, 조회에 실패하면 null이 반환
	 * @throws SQLException
	 * @author 민석
	 */
	public User getUserByNo(int userNo) throws SQLException {
		User user = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.getUserByNo"));
		pstmt.setInt(1, userNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			user = resultSetToUser(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return user;
	}
	/**
	 * user아이디로 User 정보를 조회하는 메소드
	 * @param userId 사용자 아이디
	 * @return 조회에 성공하면 정보가 들어 있는 User 객체가 반환되고, 조회에 실패하면 null이 반환
	 * @throws SQLException
	 * @author 하영
	 */
	public User getUserById(String userId) throws SQLException{
		User user = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.getUserById"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			user = resultSetToUser(rs);
			
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return user;
	}
	
	/**
	 * user번호에 해당되는 order의 order_total_price를 전부 더하여 User의 정보를 조회하는 메소드
	 * @param userNo 사용자 번호
	 * @return 조회에 성공하면 정보가 들어 있는 UserDto 객체가 반환
	 * @throws SQLException
	 * @author 하영
	 */
	public UserDto getTotalPriceUserByNo(int userNo) throws SQLException {
		UserDto userDto = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.getTotalPriceUserByNo"));
		pstmt.setInt(1, userNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			userDto = new UserDto();
			
			userDto.setNo(rs.getInt("user_no"));
			userDto.setUserTotalPrice(rs.getInt("user_total_price"));
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return userDto;
	}
	
	/**
	 * 해당하는 사용자번호가 1:1문의에 문의사항을 올린 질문 갯수를 구하는 메소드
	 * @param userNo 사용자 번호
	 * @return 사용자번호와 해당하는 사용자번호가 올린 질문을 count한 값
	 * @throws SQLException
	 * @author 하영
	 */
	public UserDto getCountQuestionUserByNo(int userNo) throws SQLException {
		UserDto userDto = null;
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.getCountQuestionUserByNo"));
		pstmt.setInt(1, userNo);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			userDto = new UserDto();
			
			userDto.setNo(rs.getInt("user_no"));
			userDto.setQuestionCount(rs.getInt("count_question"));
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return userDto;
	}
	
	/**
	 * 마지막 주문일이 1년 이상 지나간 유저의 등급을 'regular'(가장 낮은 등급)로 전환하는 메소드 
	 * @return 등급이 전환된 유저의 수
	 * @throws SQLException
	 * @author 민석
	 */
	public int refreshGradeStatus() throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.refreshGradeStatus"));
		
		int result = pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
		
		return result;
	}
	
	
	/**
	 * Branches에서 지역(예:서울)에 해당하는 번호와 이름을 찾는 메소드
	 * @param addr 지역(예:서울)
	 * @return 정보가 채워진 Branch 객체
	 * @author 하영
	 */
	public List<Branch> getBranchesByAddrFirst(String addr) {
		return JdbcHelper.selectList(QueryUtil.getSQL("user.getBranchesByAddrFirst"), new RowMapper<Branch>() {
			@Override
			public Branch mapRow(ResultSet rs) throws SQLException {
				Branch branch = new Branch();
				branch.setNo(rs.getInt("branch_no"));
				branch.setName(rs.getString("branch_name"));
				return branch;
			}
		}, addr);
	}
	
	/**
	 * 탈퇴제목과 탈퇴내용을 입력받고 탈퇴여부를 Y로 변경하는(delete문을 사용하지 않음) 메소드 
	 * @param user user객체에 저장되는 탈퇴제목, 탈퇴내용
	 * @throws SQLException
	 * @author 하영
	 */
	public void deleteUser(User user) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.deleteUser"));
		
		pstmt.setString(1, user.getQuitReason());
		pstmt.setString(2, user.getQuitDetail());
		pstmt.setInt(3, user.getNo());
		pstmt.executeUpdate();
		
		connection.close();
		pstmt.close();
	}
}
