package com.domino.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.domino.util.ConnectionUtil;
import com.domino.util.QueryUtil;
import com.domino.vo.Side;

public class SideDao {
	
	private Side resultSetSide(ResultSet rs) throws SQLException {
		Side side = new Side();
		
		side.setNo(rs.getInt("side_no"));
		side.setName(rs.getString("side_name"));
		side.setPrice(rs.getInt("side_price"));
		side.setImageSrc(rs.getString("side_image_src"));
		side.setDisableYn(rs.getString("side_disable_yn"));
		
		return side;
	}
	
	public List<Side> getAllSide() throws SQLException {
		List<Side> sides = new ArrayList<Side>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("side.getAllSide"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Side side = resultSetSide(rs);
			sides.add(side);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return sides;
	}
	
	public Side getSideByNo(int sideNo) throws SQLException {
		Side side = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("side.getSideByNo"));
		pstmt.setInt(1, sideNo);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			side = resultSetSide(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
				
		return side;
	}
	
	public void insertSide(Side side) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("side.insertSide"));
		pstmt.setString(1, side.getName());
		pstmt.setInt(2, side.getPrice());
		pstmt.setString(3, side.getImageSrc());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void updateSide(Side side) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("side.updateSide"));
		pstmt.setString(1, side.getName());
		pstmt.setInt(2, side.getPrice());
		pstmt.setString(3, side.getImageSrc());
		pstmt.setString(4, side.getDisableYn());
		pstmt.setInt(5, side.getNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
}














