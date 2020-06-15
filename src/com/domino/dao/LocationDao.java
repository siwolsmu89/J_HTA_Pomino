package com.domino.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.domino.util.ConnectionUtil;
import com.domino.util.QueryUtil;
import com.domino.vo.Location;

public class LocationDao {
	
	private Location resultSetToLocation(ResultSet rs) throws SQLException {
		Location location = new Location();
		
		location.setNo(rs.getInt("location_no"));
		location.setAddrFirst(rs.getString("location_addr_first"));
		location.setAddrSecond(rs.getString("location_addr_second"));
		location.setAddrDetail(rs.getString("location_addr_detail"));
		location.setUserNo(rs.getInt("user_no"));
		
		return location;
	}

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
}
