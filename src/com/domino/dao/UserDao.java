package com.domino.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.domino.util.ConnectionUtil;
import com.domino.util.QueryUtil;
import com.domino.vo.User;

public class UserDao {
	
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
		user.setQuitYn(rs.getString("user_quit_yn"));
		user.setQuitReason(rs.getString("user_quit_reason"));
		user.setQuitDetail(rs.getString("user_quit_detail"));
		user.setOrderCount(rs.getInt("user_order_count"));
		user.setQuickOrderNo(rs.getInt("quick_order_no"));
		
		return user;
	}

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
}
