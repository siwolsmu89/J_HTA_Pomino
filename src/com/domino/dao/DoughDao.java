package com.domino.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.domino.util.ConnectionUtil;
import com.domino.util.QueryUtil;
import com.domino.vo.Dough;

public class DoughDao {
	
	private Dough resultSetToDough(ResultSet rs) throws SQLException {
		Dough dough = new Dough();
		
		dough.setNo(rs.getInt("dough_no"));
		dough.setName(rs.getString("dough_name"));
		dough.setPrice(rs.getInt("dough_price"));
		dough.setImageSrc(rs.getString("dough_image_src"));
		dough.setDisableYn(rs.getString("dough_disable_yn"));
		
		return dough;
	}
	
	public List<Dough> getAllDough() throws SQLException {
		List<Dough> doughs = new ArrayList<Dough>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("dough.getAllDough"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Dough dough = resultSetToDough(rs);
			doughs.add(dough);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return doughs;
	}
	
	public Dough getDoughByNo(int doughNo) throws SQLException {
		Dough dough = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("dough.getDoughByNo"));
		pstmt.setInt(1, doughNo);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			dough = resultSetToDough(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return dough;
	}
	
	public void insertDough(Dough dough) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("dough.insertDough"));
		pstmt.setString(1, dough.getName());
		pstmt.setInt(2, dough.getPrice());
		pstmt.setString(3, dough.getImageSrc());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void updateDough(Dough dough) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("dough.updateDough"));
		pstmt.setString(1, dough.getName());
		pstmt.setInt(2, dough.getPrice());
		pstmt.setString(3, dough.getImageSrc());
		pstmt.setString(4, dough.getDisableYn());
		pstmt.setInt(5, dough.getNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
}
