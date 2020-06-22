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
}




























