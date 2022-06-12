package com.winefine.event.model.service;

import static com.winefine.common.JDBCTemplate.close;
import static com.winefine.common.JDBCTemplate.commit;
import static com.winefine.common.JDBCTemplate.getConnection;
import static com.winefine.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.winefine.event.model.dao.EventDao;
import com.winefine.event.model.vo.Attachment;
import com.winefine.event.model.vo.Event;


public class EventService {
	
	public ArrayList<Event> selectEventList() {
		
		Connection conn = getConnection();
		
		ArrayList<Event> list = new EventDao().selectEventList(conn);
		
		close(conn);
		
		return list;
			
	}
	
	public ArrayList<Event> selectList() {
		
		Connection conn = getConnection();
		
		ArrayList<Event> list = new EventDao().selectList(conn);
		
		close(conn);
		
		return list;
			
	}
	
	public int insertEvent(Event e) {
		
		
		Connection conn = getConnection();
		
		// Event 테이블에 Insert 해주는 메소드
		int result1 = new EventDao().insertEvent(conn, e);
		
		if(result1 > 0) { // 성공
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		
		return result1;
	}
	
	public int increaseCount(int eventNo) {
		
		Connection conn = getConnection();
		
		int result = new EventDao().increaseCount(conn, eventNo);
		
		if(result > 0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public Event selectEvent(int eventNo) {
		
		Connection conn = getConnection();
		
		Event e = new EventDao().selectEvent(conn, eventNo);
		
		close(conn);
		
		return e;
	}
	
	
	
	public int updateEvent(Event e) {
		
		Connection conn = getConnection();
		
		
		int result = new EventDao().updateEvent(conn, e);
		
		if(result > 0) { // 성공
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int deleteEvent(int eventNo) {
		
		Connection conn = getConnection();
		
		int result = new EventDao().deleteEvent(conn, eventNo);
		
		if(result > 0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
}	