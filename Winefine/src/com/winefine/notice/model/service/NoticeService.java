package com.winefine.notice.model.service;


import static com.winefine.common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.winefine.event.model.dao.EventDao;
import com.winefine.notice.model.dao.NoticeDao;
import com.winefine.notice.model.vo.Notice;

public class NoticeService {
	
	// notice 전체조회
	public ArrayList<Notice> selectNoticeList() {
		
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn);
		
		close(conn);
		
		return list;
	}
	
	// notice 작성
	public int insertNotice(Notice n) {
		
		Connection conn = getConnection();
		
		int result = new NoticeDao().insertNotice(conn, n);
		
		if(result > 0) { // 성공
			commit(conn);
		}
		else { // 실패
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	// 조회수 증가
	public int increaseCount(int noticeNo) {
		
		Connection conn = getConnection();
		
		int result = new NoticeDao().increaseCount(conn, noticeNo);
		
		if(result > 0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	// 상세보기
	public Notice selectNotice(int noticeNo) {
		
		Connection conn = getConnection();
		
		Notice n = new NoticeDao().selectNotice(conn, noticeNo);
	
		close(conn);
		
		return n;
	}
	
	// update
	public int updateNotice(Notice n) {
		
		Connection conn = getConnection();
		
		int result = new NoticeDao().updateNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	// delete 
	public int deleteNotice(int noticeNo) {
		
		Connection conn = getConnection();
		
		int result = new NoticeDao().deleteNotice(conn, noticeNo);
		
		if(result > 0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int selectListCount() {
			
			Connection conn = getConnection();
			
			int listCount = new NoticeDao().selectListCount(conn);
			
			close(conn);
			
			return listCount;
		}
	
	
}
