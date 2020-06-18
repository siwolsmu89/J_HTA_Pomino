package com.domino.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

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
}
