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
	
	/**
	 * ResultSet에서 가져온 정보들을 etc 객체에 담는 메소드. 다른 메소드 안에서만 사용할 것이므로 private 제한자를 지정
	 * @param rs
	 * @return 정보가 채워진 etc 객체
	 * @throws SQLException
	 * @author 연성
	 */
	private Etc resultSetToEtc(ResultSet rs) throws SQLException {
		Etc etc = new Etc();
		
		etc.setNo(rs.getInt("etc_no"));
		etc.setName(rs.getString("etc_name"));
		etc.setPrice(rs.getInt("etc_price"));
		etc.setImageSrc(rs.getString("etc_image_src"));
		etc.setDisableYn(rs.getString("etc_disable_yn"));
			
		return etc;
	}
	
	/**
	 * 모든 기타메뉴를 반환하는 메소드
	 * @return 모든 기타메뉴
	 * @throws SQLException
	 * @author 연성
	 */
	public List<Etc> getAllEtc() throws SQLException {
		List<Etc> etcs = new ArrayList<Etc>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("etc.getAllEtc"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Etc etc = resultSetToEtc(rs);
			etcs.add(etc);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return etcs;
	}
	
	/**
	 * 페이지네이션 범위에 해당하는 기타메뉴를 반환하는 메소드
	 * @param beginNumber
	 * @param endNumber
	 * @return 조건에 부합하는 기타메뉴 객체 리스트
	 * @throws SQLException
	 * @author 연성
	 */
	public List<Etc> getAllEtc(int beginNumber, int endNumber) throws SQLException {
		List<Etc> etcs = new ArrayList<Etc>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("etc.getEtcByRange"));
		pstmt.setInt(1, beginNumber);
		pstmt.setInt(2, endNumber);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Etc etc = resultSetToEtc(rs);
			etcs.add(etc);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return etcs;
	}
	
	/**
	 * 기타메뉴테이블의 메뉴갯수를 반환하는 메소드
	 * @return 기타메뉴 갯수
	 * @throws SQLException
	 * @author 연성
	 */
	public int getEtcsCount() throws SQLException {
		int count = 0;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("etc.getEtcsCount"));
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
	 * 기타메뉴번호에 해당하는 기타메뉴객체를 반환하는 메소드
	 * @param etcNo 기타메뉴번호
	 * @return 조건에 부합하는 기타메뉴객체
	 * @throws SQLException
	 * @author 연성
	 */
	public Etc getEtcByNo(int etcNo) throws SQLException {
		Etc etc = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("etc.getEtcByNo"));
		pstmt.setInt(1, etcNo);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			etc = resultSetToEtc(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return etc;
	}
	
	/**
	 * 기타메뉴객체를 받아 기타메뉴테이블에 등록하는 메소드
	 * @param etc 기타메뉴
	 * @throws SQLException
	 * @author 연성
	 */
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
	
	/**
	 * 기타메뉴객체를 받아 해당 객체의 정보를 수정하는 메소드
	 * @param etc 기타메뉴객체
	 * @throws SQLException
	 * @author 연성
	 */
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
	
	/**
	 * 기타메뉴이름에 해당하는 기타메뉴객체를 반환하는 메소드
	 * @param etcName 기타메뉴이름
	 * @return 조건에 부합하는 기타메뉴객체
	 * @throws SQLException
	 * @author 연성
	 */
	public Etc getEtcByName(String etcName) throws SQLException {
		Etc etc = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("etc.getEtcByName"));
		pstmt.setString(1, etcName);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			etc = resultSetToEtc(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return etc;
	}
}
