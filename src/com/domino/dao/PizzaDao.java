package com.domino.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.domino.util.ConnectionUtil;
import com.domino.util.QueryUtil;
import com.domino.vo.Pizza;

public class PizzaDao {
	
	public List<Pizza> getAllPizza() throws SQLException {
		List<Pizza> pizzas = new ArrayList<Pizza>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("pizza.getAllPizza"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Pizza pizza = new Pizza();
			pizza.setNo(rs.getInt("pizza_no"));
			pizza.setName(rs.getString("pizza_name"));
			pizza.setImageSrc(rs.getString("pizza_image_src"));
			pizza.setLprice(rs.getInt("pizza_l_price"));
			pizza.setMprice(rs.getInt("pizza_m_price"));
			pizza.setDisableYn(rs.getString("pizza_disable_yn"));
			pizza.setRegDate(rs.getDate("pizza_reg_date"));
			pizzas.add(pizza);			
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return pizzas;
	}
	
	public void insertPizza(Pizza pizza) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("pizza.insertPizza"));
		pstmt.setString(1, pizza.getName());
		pstmt.setString(2, pizza.getImageSrc());
		pstmt.setInt(3, pizza.getLprice());
		pstmt.setInt(4, pizza.getMprice());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();		
	}
}
