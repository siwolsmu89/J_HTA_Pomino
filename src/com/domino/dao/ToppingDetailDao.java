package com.domino.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.management.Query;

import com.domino.dto.ToppingOrderDto;
import com.domino.util.ConnectionUtil;
import com.domino.util.QueryUtil;

public class ToppingDetailDao {
	/**
	 * 
	 * @param orderNo
	 * @return
	 * @throws SQLException
	 */
	public List<ToppingOrderDto> getToppingOrdersByPizzaNo(int pizzaNo) throws SQLException{
		List<ToppingOrderDto> tol = new ArrayList<ToppingOrderDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("toppingdetail.getToppingOrdersByPizzaNo"));
		pstmt.setInt(1, pizzaNo);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			ToppingOrderDto to = new ToppingOrderDto();
			
			to.setNo(rs.getInt("topping_order_no"));
			to.setPizzaOrderNo(rs.getInt("pizza_order_no"));
			to.setToppigNo(rs.getInt("topping_no"));
			to.setOrderAmount(rs.getInt("topping_order_amount"));
			to.setOrderPrice(rs.getInt("topping_order_price"));
			to.setName(rs.getString("topping_name"));
			to.setPrice(rs.getInt("topping_price"));
			to.setCategory(rs.getString("topping_category"));
			to.setImageSrc(rs.getString("topping_image_src"));
			
			tol.add(to);
		}
			
		rs.close();
		pstmt.close();
		connection.close();
		
		return tol;
	}

}
