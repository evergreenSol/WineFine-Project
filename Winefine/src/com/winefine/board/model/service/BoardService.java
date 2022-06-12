package com.winefine.board.model.service;

import static com.winefine.common.JDBCTemplate.close;
import static com.winefine.common.JDBCTemplate.commit;
import static com.winefine.common.JDBCTemplate.getConnection;
import static com.winefine.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;


import com.winefine.board.model.dao.BoardDao;

import com.winefine.board.model.vo.Board;
import com.winefine.board.model.vo.Brattachment;
import com.winefine.common.model.vo.PageInfo;

public class BoardService {

	// 페이지 수, 페이징 처리 
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new BoardDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	public ArrayList<Board> selectList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	//---------- 썸네일
	// 관리자 게시판 글작성 
	public int insertThumbnailBoard(Board b, ArrayList<Brattachment> list) {
		
		Connection conn = getConnection();
		
		// Board 테이블에 Insert 해주는 메소드
		int result1 = new BoardDao().insertThumbnailBoard(conn, b);
		
		// Attachment 테이블에 Insert 해주는 메소드
		int result2 = new BoardDao().insertBrattachmentList(conn, list);
		
		if(result1 > 0 && result2 > 0) { // 성공
			
			commit(conn);
		}
		else { // 실패
			
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}
	
	// 사용자 와인용어
	public ArrayList<Board> selectThumbnailList(String boardType) {
		
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectThumbnailList(conn, boardType);
		
		close(conn);
		
		return list;
		
	}
	
	// 사용자 페어링
	public ArrayList<Board> selectThumbnailPairingList(String boardType) {
		
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectThumbnailList(conn, boardType);
		
		close(conn);
		
		return list;
		
	}
	
	// 사용자 메거진
	public ArrayList<Board> selectThumbnailMagazineList(String boardType) {
		
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectThumbnailList(conn, boardType);
		
		close(conn);
		
		return list;
		
	}
	
	// 와인용어 상세조회
	public Board selectBoard(int boardNo) {
		
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectBoard(conn, boardNo);
		
		close(conn);
		
		return b;
	}
	
	
	public ArrayList<Brattachment> selectBrattachment(int boardNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Brattachment> list = new BoardDao().selectBrattachmentList(conn, boardNo);
		
		close(conn);
		
		return list;
	}
	
	// 페어링 상세조회
	public Board selectpBoard(int boardNo) {
		
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectBoard(conn, boardNo);
		
		close(conn);
		
		return b;
	}
	
	
	public ArrayList<Brattachment> selectpBrattachment(int boardNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Brattachment> list = new BoardDao().selectBrattachmentList(conn, boardNo);
		
		close(conn);
		
		return list;
	}
	
	// 매거진 상세조회
	public Board selectmBoard(int boardNo) {
		
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectBoard(conn, boardNo);
		
		close(conn);
		
		return b;
	}
	
	
	public ArrayList<Brattachment> selectmBrattachment(int boardNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Brattachment> list = new BoardDao().selectBrattachmentList(conn, boardNo);
		
		close(conn);
		
		return list;
	}
	
	// 관리자 게시판 상세조회 

	public Board selectdBoard(int boardNo) {
		
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectdBoard(conn, boardNo);
		
		close(conn);
		
		return b;
	}
	
	public ArrayList<Brattachment> selectdBrattachment(int boardNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Brattachment> list = new BoardDao().selectBrattachmentList(conn, boardNo);
		
		close(conn);
		
		return list;
	}
	
	// 게시판 글수정
   public int updateBoard(Board b, Brattachment at) {
		
		Connection conn = getConnection();
		
		// 우선적으로 공통적으로 실행해야하는 BOARD 테이블 UPDATE 구문
		int result1 = new BoardDao().updateBoard(conn, b);
		
		int result2 = 1;
		// CASE0. BOARD 테이블만 UPDATE 하고 마는 경우를 생각해서 result2 는 1로 초기화
		
		// 새롭게 첨부파일이 있을 경우
		if(at != null) {
			
			if(at.getBrfileNo() != 0) {

				// CASE1. 기존에 첨부파일이 있었는데 새로운 첨부파일이 업로드 된 경우
				// => Attachment 테이블 Update
				result2 = new BoardDao().updateAttachment(conn, at);
			}
			else {

				// CASE2. 기존에 첨부파일이 없었는데 새로운 첨부파일이 업로드 된 경우
				// => Attachment 테이블 Insert
				result2 = new BoardDao().insertNewAttachment(conn, at);
			}
		}
		
		// 트랜잭션 처리
		if(result1 > 0 && result2 > 0) { // 성공
			
			commit(conn);
		}
		else { // 실패
			
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}
   
   // 게시글 삭제
   
	public int deleteBoard(int boardNo) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteBoard(conn, boardNo);
		
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
	