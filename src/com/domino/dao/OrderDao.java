package com.domino.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.domino.util.ConnectionUtil;
import com.domino.util.QueryUtil;
import com.domino.vo.Order;

public class OrderDao {
	
	/**
	 * ResultSet에서 가져온 정보들을 Order 객체에 담는 메소드. 다른 메소드 안에서만 사용할 것이므로 private 제한자를 지정
	 * @param ResultSet rs
	 * @return 정보가 채워진 Order 객체
	 * @throws SQLException
	 * @author 민석
	 */
	private Order resultSetToOrder(ResultSet rs) throws SQLException {
		Order order = new Order();
		
		order.setNo(rs.getInt("order_no"));
		order.setTotalPrice(rs.getInt("order_total_price"));
		order.setDiscountPrice(rs.getInt("order_discount_price"));
		order.setOrderStatus(rs.getInt("order_status"));
		order.setReceiverName(rs.getString("order_receiver_name"));
		order.setReceiverTel(rs.getString("order_receiver_tel"));
		order.setUserNo(rs.getInt("user_no"));
		order.setRequestTime(rs.getDate("order_request_time"));
		order.setBranchNo(rs.getInt("branch_no"));
		order.setRequestDetail(rs.getString("order_request_detail"));
		order.setLocationNo(rs.getInt("location_no"));
		order.setOrderType(rs.getString("order_type"));
		order.setRegDate(rs.getDate("order_reg_date"));
		
		return order;
	}

	/**
	 * 사용자 번호와 일치하는 장바구니 정보를 조회하는 메소드
	 * 장바구니는 주문 정보 테이블에서 type이 'C'(cart)로 지정된 것을 의미
	 * @param userNo 사용자 번호
	 * @return 조회에 성공할 경우 장바구니 정보가 들어있는 Order 객체 반환, 실패 시 null을 반환
	 * @throws SQLException
	 * @author 민석
	 */
	public Order getCartByUserNo(int userNo) throws SQLException {
		Order order = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getCartByUserNo"));
		pstmt.setInt(1, userNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			order = resultSetToOrder(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return order;
	}

	/**
	 * 사용자 번호로 전체 주문을 조회하는 메소드
	 * @param userNo 사용자번호
	 * @return 사용자 번호에 해당하는 Order 객체가 담긴 ArrayList
	 * @throws SQLException
	 * @author 민석
	 */
	public List<Order> getOrdersByUserNo(int userNo) throws SQLException {
		List<Order> ol = new ArrayList<Order>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getOrdersByUserNo"));
		pstmt.setInt(1, userNo);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Order order = resultSetToOrder(rs);
			ol.add(order);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return ol;
	}
	
	/**
	 * 주문 정보를 업데이트하는 메소드
	 * @param 업데이트할 주문 정보가 담긴 order 주문 객체
	 * @throws SQLException
	 * @author 민석
	 */
	public void updateOrder(Order order) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.updateOrder"));
		pstmt.setInt(1, order.getTotalPrice());
		pstmt.setInt(2, order.getDiscountPrice());
		pstmt.setInt(3, order.getOrderStatus());
		pstmt.setString(4, order.getReceiverName());
		pstmt.setString(5, order.getReceiverTel());
		pstmt.setString(6, order.getRequestDetail());
		pstmt.setInt(7, order.getLocationNo());
		pstmt.setString(8, order.getOrderType());
		pstmt.setInt(9, order.getNo());
		
		pstmt.executeUpdate();
		pstmt.close();
		connection.close();
	}
	
	/**
	 * 주문 번호에 해당하는 주문 정보를 삭제하는 메소드
	 * @param orderNo 주문 번호
	 * @throws SQLException
	 * @author 영준
	 */
	public void deleteOrder(int orderNo) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.deleteOrder"));
		
		pstmt.setInt(1, orderNo);
		pstmt.setInt(2, orderNo);
		pstmt.setInt(3, orderNo);
		pstmt.setInt(4, orderNo);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
}
