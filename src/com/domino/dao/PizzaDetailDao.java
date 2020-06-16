package com.domino.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.domino.dto.PizzaOrderDto;
import com.domino.util.ConnectionUtil;
import com.domino.util.QueryUtil;

public class PizzaDetailDao {
	
	/**
	 * ResultSet에서 가져온 정보들을 PizzaOrderDto에 담는 메소드. 다른 메소드 안에서만 사용할 것이므로 private 제한자를 지정
	 * @param ResultSet rs
	 * @return 정보가 채워진 PizzaOrderDto 객체
	 * @throws SQLException
	 * @author 민석
	 */
	private PizzaOrderDto resultSetToPizzaOrderDto(ResultSet rs) throws SQLException {
		PizzaOrderDto po = new PizzaOrderDto();
		
		String pizzaSize = rs.getString("pizza_size");
		po.setNo(rs.getInt("pizza_order_no"));
		po.setPizzaNo(rs.getInt("pizza_no"));
		po.setPizzaSize(pizzaSize);
		po.setDoughNo(rs.getInt("dough_no"));
		po.setOrderAmount(rs.getInt("pizza_order_amount"));
		po.setOrderPrice(rs.getInt("pizza_order_price"));
		po.setDiscountPrice(rs.getInt("pizza_discount_price"));
		po.setOrderNo(rs.getInt("order_no"));
		po.setPizzaName(rs.getString("pizza_name"));
		po.setDoughName(rs.getString("dough_name"));
		po.setDoughPrice(rs.getInt("dough_price"));
		if ("L".equalsIgnoreCase(pizzaSize)) {
			po.setPizzaPrice(rs.getInt("pizza_L_price"));
		} else {
			po.setPizzaPrice(rs.getInt("pizza_M_price"));
		}
		
		return po;
	}

	/**
	 * 주문번호로 피자주문상세 정보들을 조회하는 메소드
	 * 피자이름, 도우이름, 피자+도우 가격 등의 정보를 담기 위해 PizzaOrderDto를 사용
	 * @param orderNo 주문번호
	 * @return PizzaOrderDto가 담긴 ArrayList
	 * @throws SQLException
	 * @author 민석
	 */
	public List<PizzaOrderDto> getPizzaOrdersByOrderNo(int orderNo) throws SQLException {
		List<PizzaOrderDto> pol = new ArrayList<PizzaOrderDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("pizzadetail.getPizzaOrdersByOrderNo"));
		pstmt.setInt(1, orderNo);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			PizzaOrderDto po = resultSetToPizzaOrderDto(rs);
			pol.add(po);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return pol;
	}
}
