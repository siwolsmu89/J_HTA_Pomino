package com.domino.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.domino.dto.SideOrderDto;
import com.domino.util.ConnectionUtil;
import com.domino.util.QueryUtil;

public class SideDetailDao {

	/**
	 * ResultSet에서 가져온 정보들을 SideOrderDto에 담는 메소드. 다른 메소드 안에서만 사용할 것이므로 private 제한자를 지정
	 * @param ResultSet rs
	 * @return 정보가 채워진 SideOrderDto 객체
	 * @throws SQLException
	 * @author 민석
	 */
	private SideOrderDto resultSetToSideOrderDto(ResultSet rs) throws SQLException {
		SideOrderDto so = new SideOrderDto();
		
		so.setNo(rs.getInt("side_order_no"));
		so.setSideNo(rs.getInt("side_no"));
		so.setOrderNo(rs.getInt("order_no"));
		so.setOrderAmount(rs.getInt("side_order_amount"));
		so.setOrderPrice(rs.getInt("side_order_price"));
		so.setSideName(rs.getString("side_name"));
		
		return so;
	}
	
	/**
	 * 주문번호로 사이드주문상세 정보들을 조회하는 메소드
	 * @param orderNo 주문번호
	 * @return SideOrderDto가 담긴 ArrayList
	 * @author 민석
	 * @throws SQLException 
	 */
	public List<SideOrderDto> getSideOrdersByOrderNo(int orderNo) throws SQLException {
		List<SideOrderDto> sol = new ArrayList<SideOrderDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("sidedetail.getSideOrdersByOrderNo"));
		pstmt.setInt(1, orderNo);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			SideOrderDto so = resultSetToSideOrderDto(rs);
			sol.add(so);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return sol;
	}
}
