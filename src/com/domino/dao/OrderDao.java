package com.domino.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.domino.util.ConnectionUtil;
import com.domino.util.QueryUtil;
import com.domino.vo.Order;

public class OrderDao {
	
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
	
}
