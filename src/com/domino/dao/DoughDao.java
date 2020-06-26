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
	
	/**
	 * ResultSet에서 가져온 정보들을 dough 객체에 담는 메소드. 다른 메소드 안에서만 사용할 것이므로 private 제한자를 지정
	 * @param rs
	 * @return 정보가 채워진 dough객체
	 * @throws SQLException
	 * @author 연성
	 */
	private Dough resultSetToDough(ResultSet rs) throws SQLException {
		Dough dough = new Dough();
		
		dough.setNo(rs.getInt("dough_no"));
		dough.setName(rs.getString("dough_name"));
		dough.setPrice(rs.getInt("dough_price"));
		dough.setImageSrc(rs.getString("dough_image_src"));
		dough.setDisableYn(rs.getString("dough_disable_yn"));
		
		return dough;
	}
	
	/**
	 * 모든 도우를 반환하는 메소드
	 * @return 모든 도우
	 * @throws SQLException
	 * @author 연성
	 */
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
	
	/**
	 * 페이지네이션 범위에 해당하는 도우객체를  반환하는 메소드
	 * @param beginNumber 시작순번
	 * @param endNumber 끝순번
	 * @return 특정범위 사이의 도우
	 * @throws SQLException
	 */
	public List<Dough> getAllDough(int beginNumber, int endNumber) throws SQLException {
		List<Dough> doughs = new ArrayList<Dough>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("dough.getDoughsByRange"));
		pstmt.setInt(1, beginNumber);
		pstmt.setInt(2, endNumber);
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
	
	/**
	 * 도우테이블의 도우갯수를 반환하는 메소드
	 * @return 도우갯수
	 * @throws SQLException
	 * @author 연성
	 */
	public int getDoughsCount() throws SQLException {
		int count = 0;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("dough.getDoughsCount"));
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
	 * 도우번호에 해당하는 도우객체를 반환하는 메소드
	 * @param doughNo 도우번호
	 * @return 조건에 부합하는 도우객체
	 * @throws SQLException
	 * @author 연성
	 */
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
	
	/**
	 * 도우객체를 받아 도우테이블에 등록하는 메소드
	 * @param dough 도우객체
	 * @throws SQLException
	 * @author 연성
	 */
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
	
	/**
	 * 도우객체를 받아 해당 객체의 정보를 수정하는 메소드
	 * @param dough 도우객체
	 * @throws SQLException
	 * @author 연성
	 */
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
	
	/**
	 * 도우이름에 해당하는 도우객체를 반환하는 메소드
	 * @param doughName 도우이름
	 * @return 조건에 부합하는 도우객체
	 * @throws SQLException
	 * @author 연성
	 */
	public Dough getDoughByName(String doughName) throws SQLException {
		Dough dough = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("dough.getDoughByName"));
		pstmt.setString(1, doughName);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			dough = resultSetToDough(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return dough;
	}
}
