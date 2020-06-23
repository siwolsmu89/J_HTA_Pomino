package com.domino.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.domino.dto.PizzaOrderDto;
import com.domino.util.ConnectionUtil;
import com.domino.util.QueryUtil;
import com.domino.vo.PizzaOrder;

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
		po.setImageSrc(rs.getString("pizza_image_src"));
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

	/**
	 * 새로운 피자주문 객체를 db에 저장하는 메소드
	 * @param PizzaOrder po 피자주문 정보가 담긴 객체
	 * @return int pizzaOrderNo 새로 등록된 피자 주문 번호
	 * @throws SQLException
	 * @author 민석
	 */
	public int insertNewPizzaOrder(PizzaOrder po) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		CallableStatement cstmt = connection.prepareCall(QueryUtil.getSQL("pizzadetail.insertNewPizzaOrder"));
		cstmt.setInt(1, po.getPizzaNo());
		cstmt.setString(2, po.getPizzaSize());
		cstmt.setInt(3, po.getDoughNo());
		cstmt.setInt(4, po.getOrderAmount());
		cstmt.setInt(5, po.getOrderPrice());
		cstmt.setInt(6, po.getDiscountPrice());
		cstmt.setInt(7, po.getOrderNo());
		cstmt.registerOutParameter(8, java.sql.Types.INTEGER);
		cstmt.execute();
		int pizzaOrderNo = cstmt.getInt(8);
		
		cstmt.close();
		connection.close();
		
		return pizzaOrderNo;
	}
	
	
	/**
	 * 피자 메뉴 주문 정보를 삭제하는 메소드
	 * @param no 피자 메뉴 주문 번호
	 * @throws SQLException
	 * @author 영준
	 */
	public void deletePizzaOrderByNo(int no) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("pizzadetail.deletePizzaOrderByNo"));
		pstmt.setInt(1, no);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	/**
	 * 피자 주문 수량을 업데이트하는 메소드
	 * @param amount 피자 주문 수량
	 * @param no 피자 주문 번호
	 * @throws SQLException
	 * @author 영준
	 */
	public void updatePizzaOrder(PizzaOrderDto pizzaOrderDto) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("pizzadetail.updatePizzaOrder"));
		pstmt.setInt(1, pizzaOrderDto.getOrderAmount());
		pstmt.setInt(2, pizzaOrderDto.getOrderPrice());
		pstmt.setInt(3, pizzaOrderDto.getDiscountPrice());
		pstmt.setInt(4, pizzaOrderDto.getNo());

		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
		
	}
	
	/**
	 * 퀵오더 또는 재주문하기 실행 시, 주문 번호를 입력받아 상세정보가 같은 주문 객체를 생성한다.
	 * @param orderNo
	 * @throws SQLException
	 * @author 민석
	 */
	public void insertReorderCart(int orderNo, int cartNo) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("pizzadetail.insertReorderCart"));
		pstmt.setInt(1, cartNo);
		pstmt.setInt(2, orderNo);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	/**
	 * 피자 주문 을 피자 주문번호로 가져오는 메소드
	 * @param no 피자주문번호
	 * @return PizzaOrderDto 피자주문Dto
	 * @throws SQLException
	 * @author 영준
	 */
	public PizzaOrderDto getPizzaOrderByNo(int no) throws SQLException {
		PizzaOrderDto pod = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("pizzadetail.getPizzaOrderByNo"));
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			pod = resultSetToPizzaOrderDto(rs);
		}
		return pod;
	}
}
