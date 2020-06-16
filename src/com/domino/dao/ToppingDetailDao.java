package com.domino.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.domino.dto.ToppingOrderDto;
import com.domino.util.ConnectionUtil;
import com.domino.util.QueryUtil;

public class ToppingDetailDao {
	
	/**
	 * ResultSet에서 가져온 정보들을 ToppingOrderDto에 담는 메소드. 다른 메소드 안에서만 사용할 것이므로 private 제한자를 지정
	 * @param ResultSet rs
	 * @return 정보가 채워진 ToppingOrderDto 객체
	 * @throws SQLException
	 * @author 영준
	 */
	private ToppingOrderDto resultSetToToppingOrderDto(ResultSet rs) throws SQLException {
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
		
		return to;
	}
	 
	/**
	 * 피자번호로 토핑주문상세정보를 조회하는 메소드
	 * 기타 토핑정보등을 추가하기위해서 ToppingOrderDto를 사용
	 * @param pizzaNo 피자번호
	 * @return ToppingOrderDto가 담긴 ArrayList
	 * @throws SQLException
	 * @author 영준
	 */
	public List<ToppingOrderDto> getToppingOrdersByPizzaNo(int pizzaNo) throws SQLException{
		List<ToppingOrderDto> tol = new ArrayList<ToppingOrderDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("toppingdetail.getToppingOrdersByPizzaNo"));
		pstmt.setInt(1, pizzaNo);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			ToppingOrderDto to = resultSetToToppingOrderDto(rs);
			
			tol.add(to);
		}
			
		rs.close();
		pstmt.close();
		connection.close();
		
		return tol;
	}

}
