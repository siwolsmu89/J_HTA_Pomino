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
	
	/**
	 * 모든 피자를 조회하는 메소드
	 * @return 모든 피자
	 * @throws SQLException
	 */
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
	
	/**
	 * 특정범위 사이의 피자를 조회하는 메소드
	 * @param beginNumber
	 * @param endNumber
	 * @return 특정범위 사이의 피자
	 * @throws SQLException
	 */
	public List<Pizza> getAllPizza(int beginNumber, int endNumber) throws SQLException {
		List<Pizza> pizzas = new ArrayList<Pizza>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("pizza.getPizzasByRange"));
		pstmt.setInt(1, beginNumber);
		pstmt.setInt(2, endNumber);
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
	
	/**
	 * 피자테이블의 피자갯수를 반환하는 메소드
	 * @return 피자갯수
	 * @throws SQLException
	 * @author 연성
	 */
	public int getPizzasCount() throws SQLException {
		int count = 0;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("pizza.getPizzasCount"));
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			count = rs.getInt("cnt");
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return count;
	}
	
	/**
	 * 피자번호에 해당하는 피자객체를 반환하는 메소드
	 * @param pizzaNo 피자번호
	 * @return 조건에 부합하는 피자객체
	 * @throws SQLException
	 * @author 연성
	 */
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
	
	/**
	 * 피자이름에 해당하는 피자객체를 반환하는 메소드
	 * @param pizzaName 피자이름
	 * @return 조건에 부합하는 피자객체
	 * @throws SQLException
	 * @author 연성
	 */
	public Pizza getPizzaByName(String pizzaName) throws SQLException {
		Pizza pizza = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("pizza.getPizzaByName"));
		pstmt.setString(1, pizzaName);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			pizza = resultSetToPizza(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return pizza;
	}
	
	/**
	 * 피자객체를 받아 피자테이블에 등록하는 메소드
	 * @param pizza 피자객체
	 * @throws SQLException
	 * @author 연성
	 */
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
	
	/**
	 * 피자객체를 받아 해당 피자객체의 정보를 수정하는 메소드
	 * @param pizza 피자객체
	 * @throws SQLException
	 * @author 연성
	 */
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













