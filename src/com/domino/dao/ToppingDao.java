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
	
	/**
	 * ResultSet에서 가져온 정보들을 Topping 객체에 담는 메소드. 다른 메소드 안에서만 사용할 것이므로 private 제한자를 지정
	 * @param rs
	 * @return 정보가 채워진 Topping 객체
	 * @throws SQLException
	 * @author 연성
	 */
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
	
	/**
	 * 모든 토핑을 조회하는 메소드
	 * @return 모든 토핑
	 * @throws SQLException
	 */
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
	
	/**
	 * 특정범위 사이의 토핑을 조회하는 메소드
	 * @param beginNumber 범위 시작 값
	 * @param endNumber 범위 끝 값
	 * @return 특정범위 사이의 토핑
	 * @throws SQLException
	 */
	public List<Topping> getAllTopping(int beginNumber, int endNumber) throws SQLException {
		List<Topping> toppings = new ArrayList<Topping>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("topping.getToppingsByRange"));
		pstmt.setInt(1, beginNumber);
		pstmt.setInt(2, endNumber);
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
	
	/**
	 * 토핑테이블에 등록된 모든 토핑의 갯수를 반환하는 메소드
	 * @return 모든 토핑갯수
	 * @throws SQLException
	 * @author 연성
	 */
	public int getToppingsCount() throws SQLException {
		int count = 0;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("topping.getToppingsCount"));
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
	 * 토핑번호에 해당하는 토핑객체를 반환하는 메소드
	 * @param toppingNo 토핑번호
	 * @return 토핑번호에 해당하는 토핑객체
	 * @throws SQLException
	 * @author 연성
	 */
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
	
	/**
	 * 토핑객체를 토핑테이블에 등록하는 메소드
	 * @param topping 토핑객체
	 * @throws SQLException
	 * @author 연성
	 */
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
	
	/**
	 * 토핑객체를 받아서 해당 토핑객체의 정보를 수정하는 메소드
	 * @param topping 토핑객체
	 * @throws SQLException
	 * @author 연성
	 */
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
	
	/**
	 * 주문정보창 메인에 보여줄 토핑 객체를 반환하는 메소드
	 * @return 주문정보창 메인에 보여줄 토핑객체
	 * @throws SQLException
	 * @author 예범
	 */
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
	
	/**
	 * 치즈 카테고리에 해당하는 토핑만 반환하는 메소드
	 * @return 치즈 카테고리에 해당하는 토핑객체
	 * @throws SQLException
	 * @author 예범
	 */
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
	
	/**
	 * 에프터 카테고리에 해당하는 토핑만 반환하는 메소드
	 * @return 에프터 카테고리에 해당하는 토핑객체
	 * @throws SQLException
	 * @author 예범
	 */
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
	
	/**
	 * 전달받은 토핑이름과 일치하는 토핑객체를 반환하는 메소드
	 * @param toppingName 토핑이름
	 * @return 조건에 부합하는 토핑객체
	 * @throws SQLException
	 * @author 연성
	 */
	public Topping getToppingByName(String toppingName) throws SQLException {
		Topping topping = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("topping.getToppingByName"));
		pstmt.setString(1, toppingName);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			topping = resultSetToTopping(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return topping;
	}
}
