package com.domino.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.domino.util.ConnectionUtil;
import com.domino.util.QueryUtil;
import com.domino.vo.Etc;

public class EtcDao {
	
	private Etc resultSetEtc(ResultSet rs) throws SQLException {
		Etc etc = new Etc();
		
		etc.setNo(rs.getInt("etc_no"));
		etc.setName(rs.getString("etc_name"));
		etc.setPrice(rs.getInt("etc_price"));
		etc.setImageSrc(rs.getString("etc_image_src"));
		etc.setDisableYn(rs.getString("etc_disable_yn"));
			
		return etc;
	}
	
	public List<Etc> getAllEtc() throws SQLException {
		List<Etc> etcs = new ArrayList<Etc>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("etc.getAllEtc"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Etc etc = resultSetEtc(rs);
			etcs.add(etc);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return etcs;
	}
	
	public Etc getEtcByNo(int etcNo) throws SQLException {
		Etc etc = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("etc.getEtcByNo"));
		pstmt.setInt(1, etcNo);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			etc = resultSetEtc(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return etc;
	}
	
	public void insertEtc(Etc etc) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("etc.insertEtc"));
		pstmt.setString(1, etc.getName());
		pstmt.setInt(2, etc.getPrice());
		pstmt.setString(3, etc.getImageSrc());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void updateEtc(Etc etc) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("etc.updateEtc"));
		pstmt.setString(1, etc.getName());
		pstmt.setInt(2, etc.getPrice());
		pstmt.setString(3, etc.getImageSrc());
		pstmt.setString(4, etc.getDisableYn());
		pstmt.setInt(5, etc.getNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
}
