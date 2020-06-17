package com.domino.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.domino.util.ConnectionUtil;
import com.domino.util.QueryUtil;
import com.domino.vo.Grade;

public class GradeDao {
	
	private Grade resultSetToGrade(ResultSet rs) throws SQLException {
		Grade grade = new Grade();
		
		grade.setName(rs.getString("grade_name"));
		grade.setOrderCount(rs.getInt("grade_order_count"));
		grade.setOrderPrice(rs.getInt("grade_order_price"));
		grade.setDiscountRate(rs.getDouble("grade_discount_rate"));
		
		return grade;
	}
	
	public Grade getGradeByName(String gradeName) throws SQLException {
		Grade grade = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("grade.getGradeByName"));
		pstmt.setString(1, gradeName);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			grade = resultSetToGrade(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return grade;
	}
	
	public List<Grade> getAllGrades() throws SQLException {
		List<Grade> gl = new ArrayList<Grade>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("grade.getAllGrades"));
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Grade grade = resultSetToGrade(rs);
			gl.add(grade);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return gl;
	}
	
}
