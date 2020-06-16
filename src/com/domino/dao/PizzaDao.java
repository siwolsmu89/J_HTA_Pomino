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
	/**
	 * 
	 * @param rs
	 * @return ResultSet에 들어있는 Pizza객체를 반환한다.
	 * @throws SQLException
	 * @author 연성
	 */
	private Pizza resultSetToPizza(ResultSet rs) throws SQLException {
		Pizza pizza = new Pizza();
		
		pizza.setNo(rs.getInt("pizza_no"));
		pizza.setName(rs.getString("pizza_name"));
		pizza.setImageSrc(rs.getString("pizza_image_src"));
		pizza.setLprice(rs.getInt("pizza_l_price"));
		pizza.setMprice(rs.getInt("pizza_m_price"));
		pizza.setDisableYn(rs.getString("pizza_disable_yn"));
		pizza.setRegDate(rs.getDate("pizza_reg_date"));
		
		return pizza;
	}
	
	public List<Pizza> getAllPizza() throws SQLException {
		List<Pizza> pizzas = new ArrayList<Pizza>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("pizza.getAllPizza"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Pizza pizza = resultSetToPizza(rs);			
			pizzas.add(pizza);			
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return pizzas;
	}
	
	public Pizza getPizzaByNo(int pizzaNo) throws SQLException {
		Pizza pizza = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("pizza.getPizzaByNo"));
		pstmt.setInt(1, pizzaNo);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			pizza = resultSetToPizza(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return pizza;
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
	
	public void updatePizza(Pizza pizza) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("pizza.updatePizza"));
		pstmt.setString(1, pizza.getName());
		pstmt.setString(2, pizza.getImageSrc());
		pstmt.setInt(3, pizza.getLprice());
		pstmt.setInt(4, pizza.getMprice());
		pstmt.setString(5, pizza.getDisableYn());
		pstmt.setInt(6, pizza.getNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
}













