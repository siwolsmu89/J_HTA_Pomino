package com.domino.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.domino.util.ConnectionUtil;
import com.domino.util.QueryUtil;
import com.domino.vo.Topping;

public class ToppingDao {
	
	private Topping resultSetToTopping(ResultSet rs) throws SQLException {
		Topping topping = new Topping();
		
		topping.setNo(rs.getInt("topping_no"));
		topping.setName(rs.getString("topping_name"));
		topping.setPrice(rs.getInt("topping_price"));
		topping.setDisableYn(rs.getString("topping_disable_yn"));
		topping.setImageSrc(rs.getString("topping_image_src"));
		topping.setCategory(rs.getInt("topping_category"));
		
		return topping;
	}
	
	public List<Topping> getAllTopping() throws SQLException {
		List<Topping> toppings = new ArrayList<Topping>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("topping.getAllTopping"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Topping topping = resultSetToTopping(rs);
			toppings.add(topping);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return toppings;
	}
	
	public Topping getToppingByNo(int toppingNo) throws SQLException {
		Topping topping = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("topping.getToppingByNo"));
		pstmt.setInt(1, toppingNo);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			topping = resultSetToTopping(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return topping;
	}
	
	public void insertTopping(Topping topping) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("topping.insertTopping"));
		pstmt.setString(1, topping.getName());
		pstmt.setInt(2, topping.getPrice());
		pstmt.setString(3, topping.getImageSrc());
		pstmt.setInt(4, topping.getCategory());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void updateTopping(Topping topping) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("topping.updateTopping"));
		pstmt.setString(1, topping.getName());
		pstmt.setInt(2, topping.getPrice());
		pstmt.setString(3, topping.getImageSrc());
		pstmt.setInt(4, topping.getCategory());
		pstmt.setString(5, topping.getDisableYn());
		pstmt.setInt(6, topping.getNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public List<Topping> getMainToppingList() throws SQLException {
		List<Topping> toppings = new ArrayList<Topping>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("topping.getMainToppingList"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Topping topping = resultSetToTopping(rs);
			toppings.add(topping);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return toppings;
	}
	
	public List<Topping> getCheezeToppingList() throws SQLException {
		List<Topping> toppings = new ArrayList<Topping>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("topping.getCheezeToppingList"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Topping topping = resultSetToTopping(rs);
			toppings.add(topping);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return toppings;
	}
	
	public List<Topping> getAfterToppingList() throws SQLException {
		List<Topping> toppings = new ArrayList<Topping>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("topping.getAfterToppingList"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Topping topping = resultSetToTopping(rs);
			toppings.add(topping);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return toppings;
	}	
	
}
