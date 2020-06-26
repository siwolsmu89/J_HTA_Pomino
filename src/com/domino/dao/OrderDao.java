package com.domino.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.domino.dto.OrderDto;
import com.domino.dto.OrderGraphDataDto;
import com.domino.util.ConnectionUtil;
import com.domino.util.QueryUtil;
import com.domino.vo.Order;

public class OrderDao {
	
	/**
	 * ResultSet에서 가져온 정보들을 Order 객체에 담는 메소드. 다른 메소드 안에서만 사용할 것이므로 private 제한자를 지정
	 * @param ResultSet rs
	 * @return 정보가 채워진 Order 객체
	 * @throws SQLException
	 * @author 민석
	 */
	private Order resultSetToOrder(ResultSet rs) throws SQLException {
		Order order = new Order();
		
		order.setNo(rs.getInt("order_no"));
		order.setTotalPrice(rs.getInt("order_total_price"));
		order.setDiscountPrice(rs.getInt("order_discount_price"));
		order.setOrderStatus(rs.getInt("order_status"));
		order.setReceiverName(rs.getString("order_receiver_name"));
		order.setReceiverTel(rs.getString("order_receiver_tel"));
		order.setUserNo(rs.getInt("user_no"));
		order.setRequestTime(rs.getDate("order_request_time"));
		order.setBranchNo(rs.getInt("branch_no"));
		order.setRequestDetail(rs.getString("order_request_detail"));
		order.setLocationNo(rs.getInt("location_no"));
		order.setOrderType(rs.getString("order_type"));
		order.setRegDate(rs.getDate("order_reg_date"));
		
		return order;
	}
	
	/**
	 * ResultSet에서 가져온 정보들을 Order 객체에 담는 메소드. 다른 메소드 안에서만 사용할 것이므로 private 제한자를 지정
	 * 생각보다 OrderDto도 만들 일이 많아서 만들었습니다.
	 * @param ResultSet rs
	 * @return 정보가 채워진 Order 객체
	 * @throws SQLException
	 * @author 민석
	 */
	private OrderDto resultSetToOrderDto(ResultSet rs) throws SQLException {
		OrderDto orderDto = new OrderDto();
		
		orderDto.setOrderNo(rs.getInt("order_no"));
		orderDto.setBranchNo(rs.getInt("branch_no"));
		orderDto.setBranchName(rs.getString("branch_name"));
		orderDto.setTotalDiscountPrice(rs.getInt("order_discount_price"));
		orderDto.setRequestTime(rs.getDate("order_request_time"));
		orderDto.setOrderStatus(rs.getInt("order_status"));
		orderDto.setTotalAmount(rs.getInt("total_count"));
		orderDto.setPizzaName(rs.getString("pizza_name"));
		orderDto.setSideName(rs.getString("side_name"));
		orderDto.setEtcName(rs.getString("etc_name"));
		
		return orderDto;
	}

	/**
	 * 사용자 번호와 일치하는 장바구니 정보를 조회하는 메소드
	 * 장바구니는 주문 정보 테이블에서 type이 'C'(cart)로 지정된 것을 의미
	 * @param userNo 사용자 번호
	 * @return 조회에 성공할 경우 장바구니 정보가 들어있는 Order 객체 반환, 실패 시 null을 반환
	 * @throws SQLException
	 * @author 민석
	 */
	public Order getCartByUserNo(int userNo) throws SQLException {
		Order order = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getCartByUserNo"));
		pstmt.setInt(1, userNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			order = resultSetToOrder(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return order;
	}

	/**
	 * 사용자 번호로 전체 주문을 조회하는 메소드
	 * @param userNo 사용자번호
	 * @return 사용자 번호에 해당하는 Order 객체가 담긴 ArrayList
	 * @throws SQLException
	 * @author 민석
	 */
	public List<Order> getOrdersByUserNo(int userNo) throws SQLException {
		List<Order> ol = new ArrayList<Order>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getOrdersByUserNo"));
		pstmt.setInt(1, userNo);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Order order = resultSetToOrder(rs);
			ol.add(order);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return ol;
	}
	
	/**
	 * 사용자 정보로 주문을 가져오되, 일정 범위에 해당하는 주문만 가져오기
	 * @param userNo 사용자 번호
	 * @param begin 가져오기 시작할 주문 순서에 해당하는 숫자
	 * @param end 마지막으로 가져올 주문 순서에 해당하는 숫자
	 * @return 주문 순서 범위에 일치하는 Order 객체들을 담고 있는 ArrayList
	 * @throws SQLException
	 * @author 민석
	 */
	public List<Order> getOrdersByUserNoAndRange(int userNo, int begin, int end) throws SQLException {
		List<Order> ol = new ArrayList<Order>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getOrdersByUserNoAndRange"));
		
		if (begin > end) {
			end = begin;
		}
		pstmt.setInt(1, userNo);
		pstmt.setInt(2, begin);
		pstmt.setInt(3, end);
		pstmt.setInt(4, userNo);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Order order = resultSetToOrder(rs);
			ol.add(order);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return ol;
	}
	
	/**
	 * 퀵오더 또는 재주문하기 실행 시, 주문 번호를 입력받아 상세정보가 같은 주문 객체를 생성한다.
	 * @param orderNo
	 * @throws SQLException
	 * @author 민석
	 */
	public void insertReorderCart(int orderNo) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.insertReorderCart"));
		pstmt.setInt(1, orderNo);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	/**
	 * 새 장바구니를 만드는 메소드
	 *  이렇게 써도되는지 모르겠넹ㅋ
	 * @param cart 최소한의 장바구니 정보가 담긴 Order 객체
	 * @return int cartNo 새로 만들어진 장바구니 번호
	 * @throws SQLException
	 * @author 민석
	 */
	public int insertNewCart(Order cart) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		CallableStatement cstmt = connection.prepareCall(QueryUtil.getSQL("order.insertNewCart"));
		cstmt.setInt(1, cart.getUserNo());
		cstmt.setInt(2, cart.getBranchNo());
		cstmt.registerOutParameter(3, java.sql.Types.INTEGER);
		cstmt.execute();
		int cartNo = cstmt.getInt(3);
		
		cstmt.close();
		connection.close();
		
		return cartNo;
	}
	
	/**
	 * 주문 정보를 업데이트하는 메소드
	 * @param 업데이트할 주문 정보가 담긴 order 주문 객체
	 * @throws SQLException
	 * @author 민석
	 */
	public void updateOrder(Order order) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.updateOrder"));
		pstmt.setInt(1, order.getTotalPrice());
		pstmt.setInt(2, order.getDiscountPrice());
		pstmt.setInt(3, order.getOrderStatus());
		pstmt.setString(4, order.getReceiverName());
		pstmt.setString(5, order.getReceiverTel());
		pstmt.setString(6, order.getRequestDetail());
		pstmt.setInt(7, order.getLocationNo());
		pstmt.setString(8, order.getOrderType());
		pstmt.setInt(9, order.getNo());
		
		pstmt.executeUpdate();
		pstmt.close();
		connection.close();
	}
	
	/**
	 * 주문 번호에 해당하는 주문 정보를 삭제하는 메소드
	 * @param orderNo 주문 번호
	 * @throws SQLException
	 * @author 영준
	 */
	public void deleteOrder(int orderNo) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.deleteOrder"));
		
		pstmt.setInt(1, orderNo);
		pstmt.setInt(2, orderNo);
		pstmt.setInt(3, orderNo);
		pstmt.setInt(4, orderNo);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	/**
	 * 주문번호로 Order 객체를 조회하는 메소드
	 * @param orderNo 주문번호
	 * @return 조회 성공시 입력받은 주문번호에 해당하는 주문 정보를 담은 Order 객체를 반환하고 실패시 null을 반환
	 * @throws SQLException
	 * @author 민석
	 */
	public Order getOrderByNo(int orderNo) throws SQLException {
		Order order = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getOrderByNo"));
		pstmt.setInt(1, orderNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			order = resultSetToOrder(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return order;
	}
	
	/**
	 * 주문번호로 OrderDto 객체를 조회하는 메소드
	 * @param orderNo 주문번호
	 * @return 조회 성공시 입력받은 주문번호에 해당하는 정보를 담은 OrderDto 객체를 반환하고 실패시 null반환
	 * @throws SQLException
	 */
	public OrderDto getOrderDtoByNo(int orderNo) throws SQLException {
		OrderDto orderDto = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getOrderDtoByNo"));
		pstmt.setInt(1, orderNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			orderDto = resultSetToOrderDto(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return orderDto;
	}
	
	/**
	 * 모든 주문을 반환하는 메소드
	 * @return 모든주문반환
	 * @throws SQLException
	 */
	public List<Order> getAllOrders() throws SQLException {
		List<Order> orders = new ArrayList<Order>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getAllOrders"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Order order = new Order();
			order = resultSetToOrder(rs);
			orders.add(order);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return orders;
	}
	
	/**
	 * 페이지네이션 범위의 모든 오더객체를 반환하는 메소드
	 * @param beginNumber 시작순번
	 * @param endNumber 끝순번
	 * @return 조건에 부합하는 모든 오더객체
	 * @throws SQLException
	 * @author 연성
	 */
	public List<Order> getAllOrders(int beginNumber, int endNumber) throws SQLException {
		List<Order> orders = new ArrayList<Order>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getOrdersByRange"));
		pstmt.setInt(1, beginNumber);
		pstmt.setInt(2, endNumber);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Order order = new Order();
			order = resultSetToOrder(rs);
			orders.add(order);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return orders;
	}
	
	/**
	 * 오더테이블의 오더갯수를 반환하는 메소드
	 * @return 오더갯수
	 * @throws SQLException
	 * @author 연성
	 */
	public int getOrdersCount() throws SQLException {
		int count = 0;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getOrdersCount"));
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
	 * 오늘날짜의 모든 주문을 반환하는 메소드
	 * @return
	 * @throws SQLException
	 */
	public List<Order> getOrdersByDate() throws SQLException{
		List<Order> orders = new ArrayList<Order>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getOrdersByDate"));
		pstmt.setInt(1, 0);
		pstmt.setInt(2, 0);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Order order = new Order();
			order = resultSetToOrder(rs);
			
			orders.add(order);
		}
		
		return orders;
	}
	
	/**
	 * 특정날짜의 모든 주문을 반환하는 메소드
	 * @param pastDate 오늘날짜 기준으로 몇일전 값
	 * @return
	 * @throws SQLException
	 */
	public List<Order> getOrdersByDate(int pastDate) throws SQLException{
		List<Order> orders = new ArrayList<Order>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getOrdersByDate"));
		pstmt.setInt(1, pastDate);
		pstmt.setInt(2, pastDate);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Order order = new Order();
			order = resultSetToOrder(rs);
			
			orders.add(order);
		}
		
		return orders;
	}
	
	/**
	 * 특정날짜사이의 모든 주문을 반환하는 메소드
	 * @param morePastDate 오늘날짜 기준으로 몇일전 값(pastDate보다 더 커야한다)
	 * @param pastDate 오늘날짜 기준으로 몇일전 값
	 * @return
	 * @throws SQLException
	 */
	public List<Order> getOrdersByDate(int morePastDate, int pastDate) throws SQLException{
		List<Order> orders = new ArrayList<Order>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getOrdersByDate"));
		pstmt.setInt(1, morePastDate);
		pstmt.setInt(2, pastDate);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Order order = new Order();
			order = resultSetToOrder(rs);
			
			orders.add(order);
		}
		
		return orders;
	}
	
	/**
	 * 해당 가맹점의 오늘날짜에 해당하는 모든 주문을 반환하는 메소드
	 * @param branchNo
	 * @return
	 * @throws SQLException
	 */
	public List<Order> getOrdersByBranchnoWithDate(int branchNo) throws SQLException{
		List<Order> orders = new ArrayList<Order>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getOrdersByBranchNoWithDate"));
		pstmt.setInt(1, 0);
		pstmt.setInt(2, 0);
		pstmt.setInt(3, branchNo);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Order order = new Order();
			order = resultSetToOrder(rs);
			
			orders.add(order);
		}
		
		return orders;
	}
	
	/**
	 * 해당 가맹점의 특정날짜에 해당하는 모든 주문을 반환하는 메소드
	 * @param branchNo
	 * @return
	 * @throws SQLException
	 */
	public List<Order> getOrdersByBranchnoWithDate(int pastDate, int branchNo) throws SQLException{
		List<Order> orders = new ArrayList<Order>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getOrdersByBranchNoWithDate"));
		pstmt.setInt(1, pastDate);
		pstmt.setInt(2, pastDate);
		pstmt.setInt(3, branchNo);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Order order = new Order();
			order = resultSetToOrder(rs);
			
			orders.add(order);
		}
		
		return orders;
	}
	
	/**
	 * 해당 가맹점의 특정날짜사이에 해당하는 모든 주문을 반환하는 메소드
	 * @param branchNo
	 * @return
	 * @throws SQLException
	 */
	public List<Order> getOrdersByBranchnoWithDate(int morePastDate, int pastDate, int branchNo) throws SQLException{
		List<Order> orders = new ArrayList<Order>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getOrdersByBranchNoWithDate"));
		pstmt.setInt(1, morePastDate);
		pstmt.setInt(2, pastDate);
		pstmt.setInt(3, branchNo);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Order order = new Order();
			order = resultSetToOrder(rs);
			
			orders.add(order);
		}
		
		return orders;
	}
	
	/**
	 * 지점번호로 모든 주문을 가져오는 메소드
	 * @param branchNo 지점번호
	 * @return Order리스트
	 * @throws SQLException
	 * @author 영준 
	 * orderDto로 하고 싶어서 이거 조금 수정합니다. / 민석
	 */
	public List<OrderDto> getAllOrdersByBranchNo(int branchNo) throws SQLException{
		List<OrderDto> orders = new ArrayList<OrderDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getAllOrdersByBranchNo"));
		pstmt.setInt(1, branchNo);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			OrderDto order = resultSetToOrderDto(rs);
			orders.add(order);
		}
		
		return orders;
	}
	
	/**
	 * 매장번호와 범위를 가지고 모든 주문정보를 조회하는 메소드
	 * @param branchName
	 * @return
	 * @throws SQLException
	 * @author 민석
	 */
	public List<OrderDto> getAllOrdersByBranchNoWithRange(int branchNo, int beginNumber, int endNumber) throws SQLException{
		List<OrderDto> orders = new ArrayList<OrderDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getAllOrdersByBranchNoWithRange"));
		pstmt.setInt(1, branchNo);
		pstmt.setInt(2, beginNumber);
		pstmt.setInt(3, endNumber);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			OrderDto order = resultSetToOrderDto(rs);
			orders.add(order);
		}
		
		return orders;
	}
	
	/**
	 * 가맹점 메인 페이지에 표시하기 위해 오늘의 주문을 가져오는 메소드
	 * @param branchNo 가맹점번호
	 * @return 가맹점 메인 페이지에 표시될 오늘의 주문 목록
	 * @throws SQLException
	 * @author 민석
	 */
	public List<OrderDto> getTodayOrdersByBranchNo(int branchNo) throws SQLException{
		List<OrderDto> orders = new ArrayList<OrderDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getTodayOrdersByBranchNo"));
		pstmt.setInt(1, branchNo);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			OrderDto order = resultSetToOrderDto(rs);
			orders.add(order);
		}
		
		return orders;
	}
	
	/**
	 * 범위에 맞는 모든 주문을 가져오는 메소드
	 * @param beginNumber 시작번호
	 * @param endNumber 끝번호
	 * @return 주문정보 객체가 담긴 리스트
	 * @throws SQLException
	 * @author 민석
	 */
	public List<OrderDto> getAllOrdersWithRange(int beginNumber, int endNumber) throws SQLException{
		List<OrderDto> orders = new ArrayList<OrderDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getAllOrdersWithRange"));
		pstmt.setInt(1, beginNumber);
		pstmt.setInt(2, endNumber);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			OrderDto order = resultSetToOrderDto(rs);
			orders.add(order);
		}
		
		return orders;
	}
	
	/**
	 * 가맹점이름에 해당하는 오더객체를 반환하는 메소드
	 * @param branchName 가맹점 이름
	 * @return 조건에 부합하는 오더객체
	 * @throws SQLException
	 * @author 연성
	 */
	public List<Order> getAllOrdersByBranchname(String branchName) throws SQLException{
		List<Order> orders = new ArrayList<Order>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getAllOrdersByBranchname"));
		pstmt.setString(1, branchName);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Order order = resultSetToOrder(rs);
			
			orders.add(order);
		}
		
		return orders;
	}
	
	/**
	 * 오더상태에 해당하는 오더객체를 반환하는 메소드
	 * @param status 오더상태
	 * @return 조건에 부합하는 오더객체 리스트
	 * @throws SQLException
	 * @author 연성
	 */
	public List<Order> getAllOrdersByStatus(int status) throws SQLException{
		List<Order> orders = new ArrayList<Order>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getAllOrdersByStatus"));
		pstmt.setInt(1, status);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Order order = resultSetToOrder(rs);
			
			orders.add(order);
		}
		
		return orders;
	}
	
	/**
	 * 주문번호로 간단한 상품목록을 조회하는 메소드
	 * 아마 될거같은데 안되면 저한테 문의하세요
	 * @param orderNo 주문번호
	 * @return OrderDto 객체가 담긴 ArrayList (OrderDto는 간단한 주문 정보와 하위 상품명, 해당 상품의 주문 수량 등이 담긴 객체)
	 * @throws SQLException
	 * @author 민석
	 */
	public List<OrderDto> getAllSimpleOrderInfos() throws SQLException {
		List<OrderDto> orderInfos = new ArrayList<OrderDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getAllSimpleOrderInfos"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			OrderDto orderDto = resultSetToOrderDto(rs);
			orderInfos.add(orderDto);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return orderInfos;
	}
	
	/**
	 * 가맹점명에 해당하고 페이지네이션 범위안의 주문을 조회하는 메소드
	 * @param beginNumber 시작순번
	 * @param endNumber 끝순번
	 * @param branchName 가맹점명
	 * @return
	 * @throws SQLException
	 */
	public List<OrderDto> getOrderByBranchNameWithRange(int beginNumber, int endNumber, String branchName) throws SQLException {
		List<OrderDto> orderInfos = new ArrayList<OrderDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getOrdersByBranchNameWithRange"));
		pstmt.setInt(1, beginNumber);
		pstmt.setInt(2, endNumber);
		pstmt.setString(3, branchName);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			OrderDto orderDto = resultSetToOrderDto(rs);
			orderInfos.add(orderDto);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return orderInfos;
	}
	
	/**
	 * 페이지네이션 범위에 해당하고, 오더상태에 해당하는 오더객체를 반환하는 메소드
	 * @param beginNumber 시작순번
	 * @param endNumber 끝순번
	 * @param orderStatus 오더상태
	 * @return 조건에 부합하는 오더객체
	 * @throws SQLException
	 * @author 연성
	 */
	public List<OrderDto> getOrdersByStatusWithRange(int beginNumber, int endNumber, int orderStatus) throws SQLException {
		List<OrderDto> orderInfos = new ArrayList<OrderDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getOrdersByStatusWithRange"));
		pstmt.setInt(1, beginNumber);
		pstmt.setInt(2, endNumber);
		pstmt.setInt(3, orderStatus);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			OrderDto orderDto = resultSetToOrderDto(rs);
			orderInfos.add(orderDto);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return orderInfos;
	}
	
	/**
	 * 오늘날짜부터 오늘날짜-입력받은데이터 일 사이의 일매출을 반환하는 메소드
	 * @param date 데이트
	 * @return 날짜와 매출
	 * @throws SQLException
	 * @throws ParseException
	 * @author 연성
	 */
	public List<OrderGraphDataDto> getOrderCountByDateRange(int date) throws SQLException, ParseException {
		List<OrderGraphDataDto> orders = new ArrayList<OrderGraphDataDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getOrderCountByDateRange"));
		pstmt.setInt(1, date);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			OrderGraphDataDto orderGraphDataDto = new OrderGraphDataDto();
			orderGraphDataDto.setRegDate(rs.getString("day"));
			orderGraphDataDto.setDiscountPrice(rs.getInt("total"));
						
			orders.add(orderGraphDataDto);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return orders;
	}

	/**
	 * 로그인이 되었을 때 해당하는 사용자번호와 order_type이 'C'인 (카트)데이터를 삭제
	 * @param userNo 사용자번호
	 * @throws SQLException
	 * @author 하영
	 */
	public void deleteCartByUserNo(int userNo) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getdeleteCartByUserNo"));
		
		pstmt.setInt(1, userNo);
		pstmt.executeUpdate();
		
		connection.close();
		pstmt.close();
		
	}
}
