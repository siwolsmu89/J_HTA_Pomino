package com.domino.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.domino.util.ConnectionUtil;
import com.domino.util.QueryUtil;
import com.domino.vo.Location;

public class LocationDao {
	
	/**
	 * ResultSet에서 가져온 정보들을 Location 객체에 담는 메소드. 다른 메소드 안에서만 사용할 것이므로 private 제한자를 지정
	 * @param ResultSet rs
	 * @return 정보가 채워진 Location 객체
	 * @throws SQLException
	 * @author 민석
	 */
	private Location resultSetToLocation(ResultSet rs) throws SQLException {
		Location location = new Location();
		
		location.setNo(rs.getInt("location_no"));
		location.setAddrFirst(rs.getString("location_addr_first"));
		location.setAddrSecond(rs.getString("location_addr_second"));
		location.setAddrDetail(rs.getString("location_addr_detail"));
		location.setUserNo(rs.getInt("user_no"));
		
		return location;
	}

	/**
	 * 배송지번호로 배송지정보를 조회하는 메소드
	 * @param locationNo 배송지번호
	 * @return 조회에 성공할 경우 배송지 정보가 담긴 Location 객체 반환, 실패시 null 반환
	 * @throws SQLException
	 * @author 민석
	 */
	public Location getLocationByNo(int locationNo) throws SQLException {
		Location location = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("location.getLocationByNo"));
		pstmt.setInt(1, locationNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			location = resultSetToLocation(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return location;
	}
	
	/**
	 * 유저번호로 지역 가져오기
	 * @param userNo 유저번호
	 * @return List<Location> 지역 리스트
	 * @throws SQLException
	 * @author 영준
	 */
	public List<Location> getLocationsByUserNo(int userNo) throws SQLException {
		List<Location> locations = new ArrayList<Location>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("location.getLocationsByUserNo"));
		pstmt.setInt(1, userNo);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Location location = resultSetToLocation(rs);
			locations.add(location);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return locations;
	}
	/**
	 * 배달지 정보를 입력받아 상세정보가 같은 배달지 객체를 생성한다.
	 * @param location 배달지정보 객체
	 * @throws SQLException
	 * @author 영준
	 */
	public void insertLocation(Location location) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("location.insertLocation"));
		
		pstmt.setString(1, location.getAddrFirst());
		pstmt.setString(2, location.getAddrSecond());
		pstmt.setString(3, location.getAddrDetail());
		pstmt.setInt(4, location.getUserNo());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	/**
	 * 선택된 배달지 정보의 locationNo를 받아와 그 객체를 삭제한다.
	 * @param locationNo 배달지역번호
	 * @throws SQLException
	 * @author 영준
	 */
	public void deleteLocation(int locationNo) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("location.deleteLocation"));
		
		pstmt.setInt(1,locationNo);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
}
