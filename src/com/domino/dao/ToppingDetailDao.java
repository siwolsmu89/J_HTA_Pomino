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
import com.domino.vo.ToppingOrder;

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
	 * 피자 주문 번호로 토핑주문상세정보를 조회하는 메소드
	 * 기타 토핑정보등을 추가하기위해서 ToppingOrderDto를 사용
	 * @param pizzaNo 피자 주문 번호
	 * @return ToppingOrderDto가 담긴 ArrayList
	 * @throws SQLException
	 * @author 영준
	 */
	public List<ToppingOrderDto> getToppingOrdersByPizzaNo(int pizzaOrderNo) throws SQLException{
		List<ToppingOrderDto> tol = new ArrayList<ToppingOrderDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("toppingdetail.getToppingOrdersByPizzaNo"));
		pstmt.setInt(1, pizzaOrderNo);
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
	
	/**
	 * 새로운 토핑 주문 정보를 db에 저장하는 메소드
	 * @param ToppingOrder tpo 토핑 주문 정보를 담고 있는 객체
	 * @throws SQLException
	 * @author 민석
	 */
	public void insertNewToppingOrder(ToppingOrder tpo) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("toppingdetail.insertNewToppingOrder"));
		pstmt.setInt(1, tpo.getPizzaOrderNo());
		pstmt.setInt(2, tpo.getToppigNo());
		pstmt.setInt(3, tpo.getOrderAmount());
		pstmt.setInt(4, tpo.getOrderPrice());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	/**
	 * 퀵오더 또는 재주문하기 실행 시 이전에 등록된 피자 주문 번호와 새롭게 등록된 주문 번호를 가져와서 토핑 주문을 생성한다.
	 * @param prevNo 이전에 등록된 피자 주문 번호
	 * @param thisNo 새롭게 등록된 피자 주문 번호
	 * @throws SQLException
	 */
	public void insertReorderCart(int prevNo, int thisNo) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("toppingdetail.insertReorderCart"));
		pstmt.setInt(1, thisNo);
		pstmt.setInt(2, prevNo);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	/**
	 * 토핑 주문 정보를 삭제하는 메소드
	 * @param no 토핑 주문 번호
	 * @throws SQLException
	 * @author 영준
	 */
	public void deleteToppingOrderByNo(int no) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("toppingdetail.deleteToppingOrderByNo"));
		pstmt.setInt(1, no);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	/**
	 * 토핑주문을 피자주문번호로 가져오는 메소드
	 * @param pizzaOrderNo 피자주문번호
	 * @throws SQLException
	 * @author 영준
	 */
	public void deleteToppingOrdersByPizzaOrderNo(int pizzaOrderNo) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("toppingdetail.deleteToppingOrdersByPizzaOrderNo"));
		pstmt.setInt(1, pizzaOrderNo);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
}
