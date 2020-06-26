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
	
	/**
	 * ResultSet에서 가져온 정보들을 side 객체에 담는 메소드. 다른 메소드 안에서만 사용할 것이므로 private 제한자를 지정
	 * @param rs
	 * @return 정보가 채워진 side 객체
	 * @throws SQLException
	 * @author 연성
	 */
	private Side resultSetToSide(ResultSet rs) throws SQLException {
		Side side = new Side();
		
		side.setNo(rs.getInt("side_no"));
		side.setName(rs.getString("side_name"));
		side.setPrice(rs.getInt("side_price"));
		side.setImageSrc(rs.getString("side_image_src"));
		side.setDisableYn(rs.getString("side_disable_yn"));
		
		return side;
	}
	
	/**
	 * 모든 사이드메뉴를 조회하는 메소드
	 * @return 모든 사이드메뉴
	 * @throws SQLException
	 */
	public List<Side> getAllSide() throws SQLException {
		List<Side> sides = new ArrayList<Side>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("side.getAllSide"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Side side = resultSetToSide(rs);
			sides.add(side);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return sides;
	}
	
	/**
	 * 특정범위 사이의 사이드메뉴를 조회하는 메소드
	 * @param beginNumber
	 * @param endNumber
	 * @return 특정범위 사이의 사이드메뉴
	 * @throws SQLException
	 */
	public List<Side> getAllSide(int beginNumber, int endNumber) throws SQLException {
		List<Side> sides = new ArrayList<Side>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("side.getSidesByRange"));
		pstmt.setInt(1, beginNumber);
		pstmt.setInt(2, endNumber);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Side side = resultSetToSide(rs);
			sides.add(side);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return sides;
	}
	
	/**
	 * 사이드테이블에 등록된 사이드메뉴의 갯수를 반환하는 메소드
	 * @return 사이드메뉴 갯수
	 * @throws SQLException
	 * @author 연성
	 */
	public int getSidesCount() throws SQLException {
		int count = 0;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("side.getSidesCount"));
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
	 * 사이드번호에 해당하는 사이드객체를 반환하는 메소드
	 * @param sideNo 사이드번호
	 * @return 조건에 부합하는 사이드객체
	 * @throws SQLException
	 * @author 연성
	 */
	public Side getSideByNo(int sideNo) throws SQLException {
		Side side = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("side.getSideByNo"));
		pstmt.setInt(1, sideNo);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			side = resultSetToSide(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
				
		return side;
	}
	
	/**
	 * 사이드객체를 받아 사이드테이블에 등록하는 메소드
	 * @param side 사이드객체
	 * @throws SQLException
	 * @author 연성
	 */
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
	
	/**
	 * 사이드객체를 받아 해당 사이드객체의 정보를 수정하는 메소드
	 * @param side 사이드 객체
	 * @throws SQLException
	 * @author 연성
	 */
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
	
	/**
	 * 사이드이름을 받아 해당하는 사이드객체를 반환하는 메소드
	 * @param sideName 사이드이름
	 * @return 조건에 부합하는 사이드 객체
	 * @throws SQLException
	 * @author 연성
	 */
	public Side getSideByName(String sideName) throws SQLException {
		Side side = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("side.getSideByName"));
		pstmt.setString(1, sideName);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			side = resultSetToSide(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
				
		return side;
	}
}















