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
import com.domino.vo.EtcOrder;

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
		eo.setImageSrc(rs.getString("etc_image_src"));
		
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
	
	/**
	 * 기타 메뉴 주문 정보를 삭제하는 메소드
	 * @param no 기타 메뉴 주문 번호
	 * @throws SQLException
	 * @author 민석
	 */
	public void deleteEtcOrderByNo(int no) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("etcdetail.deleteEtcOrderByNo"));
		pstmt.setInt(1, no);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	/**
	 * 새로 기타 메뉴 주문 정보를 db에 저장하는 메소드 
	 * @param EtcOrder eo 기타 메뉴 주문 정보가 담긴 객체
	 * @throws SQLException
	 * @author 민석
	 */
	public void insertNewEtcOrder(EtcOrder eo) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("etcdetail.insertNewEtcOrder"));
		pstmt.setInt(1, eo.getEtcNo());
		pstmt.setInt(2, eo.getOrderAmount());
		pstmt.setInt(3, eo.getOrderPrice());
		pstmt.setInt(4, eo.getOrderNo());
		
		pstmt.executeUpdate();
		pstmt.close();
		connection.close();
	}

	/**
	 * 퀵오더 또는 재주문하기 실행 시, 주문 번호를 입력받아 상세정보가 같은 주문 객체를 생성한다.
	 * @param orderNo
	 * @throws SQLException
	 * @author 민석
	 */
	public void insertReorderCart(int orderNo, int cartNo) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("etcdetail.insertReorderCart"));
		pstmt.setInt(1, cartNo);
		pstmt.setInt(2, orderNo);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	/**
	 * 기타 주문 수량을 업데이트하는 메서드
	 * @param amount 기타 주문 수량
	 * @param no 기타 주문 번호
	 * @throws SQLException
	 * @author 영준
	 */
	public void updateEtcOrder(EtcOrderDto etcOrderDto) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("etcdetail.updateEtcOrder"));
		pstmt.setInt(1, etcOrderDto.getOrderAmount());
		pstmt.setInt(2, etcOrderDto.getOrderPrice());
		pstmt.setInt(3, etcOrderDto.getNo());

		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	/**
	 * 기타 주문 을 기타 주문번호로 가져오는 메소드
	 * @param no 기타주문번호
	 * @return EtcOrderDto 기타 주문 Dto
	 * @throws SQLException
	 * @author 영준
	 */
	public EtcOrderDto getEtcOrderByNo(int no) throws SQLException {
		EtcOrderDto eod = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("etcdetail.getEtcOrderByNo"));
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			eod = resultSetToEtcOrderDto(rs);
		}
		
		return eod;
	}
	
}
