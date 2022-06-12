package com.winefine.event.model.dao;

import static com.winefine.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.winefine.event.model.vo.Attachment;
import com.winefine.event.model.vo.Event;


public class EventDao {
	
	private Properties prop = new Properties();
	
	public EventDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(EventDao.class.getResource("/sql/event/event-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Event> selectEventList(Connection conn) {
		
		// SELECT문 => ResultSet 여러행 조회
		ArrayList<Event> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectEventList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Event e = new Event();
				e.setEventNo(rset.getInt("EVENT_NO"));
				e.setEventTitle(rset.getString("EVENT_TITLE"));
				e.setEventWriter(rset.getString("USER_ID"));
				e.setCount(rset.getInt("COUNT"));
				e.setThumbnail(rset.getString("THUMBNAIL"));
				e.setEndDate(rset.getString("END_DATE"));
				
				
				list.add(e);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		
		}
		return list;
		
	}
public ArrayList<Event> selectList(Connection conn) {
		
		// SELECT문 => ResultSet 여러행 조회
		ArrayList<Event> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			
			while(rset.next()) {
				
				Event e = new Event();
				
				e.setEventNo(rset.getInt("EVENT_NO"));
				e.setEventTitle(rset.getString("EVENT_TITLE"));
				e.setEventWriter(rset.getString("USER_ID"));
				e.setCreateDate(rset.getDate("CREATE_DATE"));
				e.setStartDate(rset.getString("START_DATE"));
				e.setEndDate(rset.getString("END_DATE"));
				e.setCount(rset.getInt("COUNT"));
				
				list.add(e);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		
		}
		return list;
		
	}

	public int insertEvent(Connection conn, Event e) {
		
			// INSERT 문 => int(처리된 행의 갯수)
			int result = 0;
			
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("insertEvent");
			
			try {
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, e.getEventTitle());
				pstmt.setString(2, e.getEventWriter());
				pstmt.setString(3, e.getStartDate());
				pstmt.setString(4, e.getEndDate());
				pstmt.setString(5, e.getThumbnail());
				pstmt.setString(6, e.getContentPhoto());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e1) {
				e1.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}
	
	
		public int increaseCount(Connection conn, int eventNo) {
			
			// UPDATE문 => int
			
			int result = 0;
			
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("increaseCount");
			
			try {
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, eventNo);
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				
				close(pstmt);
			}
			
			return result;
		}
		
		public Event selectEvent(Connection conn, int eventNo) {
			
			Event e = null;
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectEvent");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, eventNo);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					
					e = new Event();
					e.setEventNo(rset.getInt("EVENT_NO"));
					e.setEventTitle(rset.getString("EVENT_TITLE"));
					e.setEventWriter(rset.getString("USER_ID"));
					e.setCreateDate(rset.getDate("CREATE_DATE"));
					e.setStartDate(rset.getString("START_DATE"));
					e.setEndDate(rset.getString("END_DATE"));
					e.setThumbnail(rset.getString("THUMBNAIL"));
					e.setContentPhoto(rset.getString("CONTENT_PHOTO"));
					
				}
	
			} catch (SQLException e1) {
				e1.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return e;
			
		}
		
		
		public int updateEvent(Connection conn, Event e) {
			
			//UPDATE 문 => int
			int result = 0;
			
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("updateEvent");
			
			try {
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, e.getEventTitle());
				pstmt.setString(2, e.getStartDate());
				pstmt.setString(3, e.getEndDate());
				pstmt.setString(4, e.getThumbnail());
				pstmt.setString(5, e.getContentPhoto());
				pstmt.setInt(6, e.getEventNo());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e1) {
				e1.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
			
		}
		
		public int deleteEvent(Connection conn, int eventNo) {
			
			// UPDATE 문
			int result = 0;
			
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("deleteEvent");
			
			try {
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, eventNo);
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}
	
}	