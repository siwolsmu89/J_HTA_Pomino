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

public class OrderDetailDao {
	
	public PizzaOrderDto resultSetToPizzaOrderDto(ResultSet rs) throws SQLException {
		PizzaOrderDto po = new PizzaOrderDto();
		
		int pizzaOrderPrice = rs.getInt("pizza_order_price");
		int pizzaDiscountPrice = rs.getInt("pizza_discount_price");
		int doughPrice = rs.getInt("dough_price");
		int amount = rs.getInt("pizza_order_amount");

		po.setNo(rs.getInt("pizza_order_no"));
		po.setPizzaNo(rs.getInt("pizza_no"));
		po.setPizzaSize(rs.getString("pizza_size"));
		po.setDoughNo(rs.getInt("dough_no"));
		po.setOrderAmount(amount);
		po.setOrderPrice(pizzaOrderPrice);
		po.setDiscountPrice(pizzaDiscountPrice);
		po.setOrderNo(rs.getInt("order_no"));
		po.setPizzaName(rs.getString("pizza_name"));
		po.setDoughName(rs.getString("dough_name"));
		po.setDoughPrice(doughPrice);
		po.setTotalOrderPrice((pizzaOrderPrice+doughPrice)*amount);
		po.setTotalDiscountPrice((pizzaDiscountPrice+doughPrice)*amount);
		
		return po;
	}

	public List<PizzaOrderDto> getPizzaOrdersByOrderNo(int orderNo) throws SQLException {
		List<PizzaOrderDto> pol = new ArrayList<PizzaOrderDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("orderdetail.getPizzaOrdersByOrderNo"));
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
