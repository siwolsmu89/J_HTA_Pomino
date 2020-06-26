package com.domino.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.domino.util.ConnectionUtil;
import com.domino.util.QueryUtil;
import com.domino.vo.Event;

public class EventDao {
	
	/**
	 * ResultSet에서 가져온 정보들을 event 객체에 담는 메소드. 다른 메소드 안에서만 사용할 것이므로 private 제한자를 지정
	 * @param rs
	 * @return 정보가 채워진 event객체
	 * @throws SQLException
	 * @author 연성
	 */
	private Event resultSetToEvent(ResultSet rs) throws SQLException {
		Event event = new Event();
		
		event.setNo(rs.getInt("event_no"));
		event.setName(rs.getString("event_name"));
		event.setStartDate(rs.getDate("event_start_date"));
		event.setEndDate(rs.getDate("event_end_date"));
		event.setImageSrc(rs.getString("event_image_src"));
		event.setDiscountRate(rs.getDouble("event_discount_rate"));
		event.setDisableYn(rs.getString("event_disable_yn"));
		event.setRegDate(rs.getDate("event_reg_date"));
		event.setPizzaNo(rs.getInt("pizza_no"));
		
		return event;
	}
	
	/**
	 * 이벤트테이블의 모든 이벤트객체를 반환하는 메소드
	 * @return 모든 이벤트 객체
	 * @throws SQLException
	 * @author 연성
	 */
	public List<Event> getAllEvent() throws SQLException {
		List<Event> events = new ArrayList<Event>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("event.getAllEvent"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Event event = resultSetToEvent(rs);			
			events.add(event);			
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return events;
	}
	
	/**
	 * 활성화된 이벤트만 반환하는 메소드
	 * @return 조건에 부합하는 이벤트객체 리스트
	 * @throws SQLException
	 * @author 연성
	 */
	public List<Event> getListEvent() throws SQLException {
		List<Event> events = new ArrayList<Event>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("event.getListEvent"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Event event = resultSetToEvent(rs);			
			events.add(event);			
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return events;
	}
	
	/**
	 * 페이지네이션 범위에 해당하는 모든 이벤트 객체를 반환하는 메소드
	 * @param beginNumber 시작순번
	 * @param endNumber 끝순번
	 * @return 조건에 부합하는 이벤트 객체 리스트
	 * @throws SQLException
	 * @author 연성
	 */
	public List<Event> getAllEvent(int beginNumber, int endNumber) throws SQLException {
		List<Event> events = new ArrayList<Event>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("event.getEventByRange"));
		pstmt.setInt(1, beginNumber);
		pstmt.setInt(2, endNumber);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Event event = resultSetToEvent(rs);			
			events.add(event);			
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return events;
	}
	
	/**
	 * 이벤트테이블의 이벤트갯수를 반환하는 메소드
	 * @return 이벤트 갯수
	 * @throws SQLException
	 * @author 연성
	 */
	public int getEventsCount() throws SQLException {
		int count = 0;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("event.getEventsCount"));
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
	 * 이벤트번호에 해당하는 이벤트객체를 반환하는 메소드
	 * @param eventNo 이벤트 번호
	 * @return 조건에 부합하는 이벤트 객체
	 * @throws SQLException
	 * @author 연성
	 */
	public Event getEventByNo(int eventNo) throws SQLException {
		Event event = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("event.getEventByNo"));
		pstmt.setInt(1, eventNo);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			event = resultSetToEvent(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return event;
	}
	
	/**
	 * 이벤트 이름에 해당하는 이벤트객체를 반환하는 메소드
	 * @param eventName 이벤트 이름
	 * @return 조건에 부합하는 이벤트 객체
	 * @throws SQLException 
	 * @author 연성
	 */
	public Event getEventByName(String eventName) throws SQLException {
		Event event = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("event.getEventByName"));
		pstmt.setString(1, eventName);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			event = resultSetToEvent(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return event;
	}
	
	/**
	 * 페이지네이션 범위에 해당하고, 이벤트이름에 해당하는 이벤트객체를 반환하는 메소드
	 * @param eventName 이벤트 이름
	 * @param beginNumber 시작순번
	 * @param endNumber 끝순번
	 * @return 조건에 부합하는 이벤트 객체 리스트
	 * @throws SQLException
	 * @author 연성
	 */
	public List<Event> getEventsByNameWithRange(String eventName, int beginNumber, int endNumber) throws SQLException {
		List<Event> events = new ArrayList<Event>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("event.getEventsByNameWithRange"));
		pstmt.setString(1, eventName);
		pstmt.setInt(2, beginNumber);
		pstmt.setInt(3, endNumber);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Event event = resultSetToEvent(rs);
			events.add(event);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return events;
	}
	
	/**
	 * 이벤트 객체를 받아서 이벤트테이블에 등록하는 메소드
	 * @param event 이벤트 객체
	 * @throws SQLException
	 * @author 하영
	 */
	public void insertEvent(Event event) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("event.insertEvent2"));
		pstmt.setString(1, event.getName());
		pstmt.setDate(2, new java.sql.Date(event.getStartDate().getTime()));
		pstmt.setDate(3, new java.sql.Date(event.getEndDate().getTime()));
		pstmt.setString(4, event.getImageSrc());
		pstmt.setDouble(5, event.getDiscountRate());
		pstmt.setInt(6, event.getPizzaNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	/**
	 * 이벤트객체를 받아 해당 이벤트 객체의 정보를 수정하는 메소드
	 * @param event 이벤트 객체
	 * @throws SQLException
	 * @author 하영
	 */
	public void updateEvent(Event event) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("event.updateEvent"));
		pstmt.setString(1, event.getName());
		pstmt.setDate(2, new java.sql.Date(event.getStartDate().getTime()));
		pstmt.setDate(3, new java.sql.Date(event.getEndDate().getTime()));
		pstmt.setString(4, event.getImageSrc());
		pstmt.setDouble(5, event.getDiscountRate());
		pstmt.setString(6, event.getDisableYn());
		pstmt.setInt(7, event.getPizzaNo());
		pstmt.setInt(8, event.getNo());		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	/**
	 * 피자번호에 해당하는 이벤트 객체를 반환하는 메소드
	 * @param pizzaNo 피자번호
	 * @return 조건에 부합하는 이벤트 객체
	 * @throws SQLException
	 * @author 연성
	 */
	public Event getEventByPizzaNo(int pizzaNo) throws SQLException {
		Event event = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("event.getEventByPizzaNo"));
		pstmt.setInt(1, pizzaNo);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			event = resultSetToEvent(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return event;
	}
}




























