package com.domino.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.domino.dto.EtcOrderDto;
import com.domino.util.ConnectionUtil;
import com.domino.util.QueryUtil;

public class EtcDetailDao {
	
	/**
	 * ResultSet에서 가져온 정보들을 EtcOrderDto 객체에 담는 메소드. 다른 메소드 안에서만 사용할 것이므로 private 제한자를 지정
	 * @param ResultSet rs
	 * @return 정보가 채워진 EtcOrderDto 객체
	 * @throws SQLException 
	 * @author 민석
	 */
	private EtcOrderDto resultSetToEtcOrderDto(ResultSet rs) throws SQLException {
		EtcOrderDto eo = new EtcOrderDto();
		
		eo.setNo(rs.getInt("etc_order_no"));
		eo.setEtcNo(rs.getInt("etc_no"));
		eo.setOrderAmount(rs.getInt("etc_order_amount"));
		eo.setOrderPrice(rs.getInt("etc_order_price"));
		eo.setOrderNo(rs.getInt("order_no"));
		eo.setEtcName(rs.getString("etc_name"));
		eo.setEtcPrice(rs.getInt("etc_price"));
		
		return eo;
	}
	
	/**
	 * 주문번호로 기타메뉴 주문 상세 정보들을 조회하는 메소드
	 * @param orderNo 주문번호
	 * @return EtcOrderDto가 담긴 ArrayList
	 * @throws SQLException 
	 * @author 민석
	 */
	public List<EtcOrderDto> getEtcOrdersByOrderNo(int orderNo) throws SQLException {
		List<EtcOrderDto> eol = new ArrayList<EtcOrderDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("etcdetail.getEtcOrdersByOrderNo"));
		pstmt.setInt(1, orderNo);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			EtcOrderDto eo = resultSetToEtcOrderDto(rs);
			eol.add(eo);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return eol;
	}
}
