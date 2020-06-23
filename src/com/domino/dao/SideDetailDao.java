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
import com.domino.vo.SideOrder;

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
		so.setSidePrice(rs.getInt("side_price"));
		so.setImageSrc(rs.getString("side_image_src"));
		
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

	/**
	 * 사이드 메뉴 주문 정보를 삭제하는 메소드
	 * @param no 사이드 메뉴 주문 번호
	 * @throws SQLException
	 * @author 영준
	 */
	public void deleteSideOrderByNo(int no) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("sidedetail.deleteSideOrderByNo"));
		pstmt.setInt(1, no);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	/**
	 * 새로운 사이드 주문 정보를 db에 저장하는 메소드
	 * @param SideOrder so 사이드 주문 정보를 담고 있는 객체
	 * @throws SQLException
	 * @author 민석
	 */
	public void insertNewSideOrder(SideOrder so) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("sidedetail.insertNewSideOrder"));
		pstmt.setInt(1, so.getSideNo());
		pstmt.setInt(2, so.getOrderAmount());
		pstmt.setInt(3, so.getOrderPrice());
		pstmt.setInt(4, so.getOrderNo());
		
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
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("sidedetail.insertReorderCart"));
		pstmt.setInt(1, cartNo);
		pstmt.setInt(2, orderNo);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	/**
	 * 사이드 주문 수량을 업데이트하는 메서드
	 * @param amount 사이드 주문 수량
	 * @param no 사이드 주문 번호
	 * @throws SQLException
	 * @author 영준
	 */
	public void updateSideOrder(SideOrderDto sideOrderDto) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("sidedetail.updateSideOrder"));
		pstmt.setInt(1, sideOrderDto.getOrderAmount());
		pstmt.setInt(2, sideOrderDto.getOrderPrice());
		pstmt.setInt(3, sideOrderDto.getNo());

		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	/**
	 * 사이드 주문을 사이드주문번호로 가져오는 메소드
	 * @param no 사이드주문번호
	 * @return SideOrderDto 사이드 주문 Dto
	 * @throws SQLException
	 * @author 영준
	 */
	public SideOrderDto getSideOrderByNo(int no) throws SQLException {
		SideOrderDto sod = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("sidedetail.getSideOrderByNo"));
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			sod = resultSetToSideOrderDto(rs);
		}
		return sod;
	}
}
