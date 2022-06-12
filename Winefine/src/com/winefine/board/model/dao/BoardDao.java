package com.winefine.board.model.dao;

import static com.winefine.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.winefine.board.model.vo.Board;
import com.winefine.board.model.vo.Brattachment;
import com.winefine.common.model.vo.PageInfo;

public class BoardDao {
	// 페이지 수, 페이징 처리 
	private Properties prop = new Properties();
	
	public BoardDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(BoardDao.class.getResource("/sql/board/board-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn) {
		
		// SELECT 문 => ResultSet 객체 (한개의 행)
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
		
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
		    close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	public ArrayList<Board> selectList(Connection conn, PageInfo pi) {
		
		// SELECT 문 => ResultSet 객체 (여러 행 조회) => ArrayList
		
		ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
	
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Board(rset.getInt("BOARD_NO")
								 , rset.getString("USER_ID")
								 , rset.getString("BOARD_TITLE")
								 , rset.getDate("CREATE_DATE")
								 , rset.getString("BOARD_TYPE")));
								 
								
								 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}
		
		return list;   
	}
	
	
	//---------- 썸네일
	// 관리자 게시판 작성
	
		public int insertThumbnailBoard(Connection conn, Board b) {
		
		// INSERT 문 => int (처리된 행의 갯수)
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertThumbnailBoard");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getBoardType());
			pstmt.setString(2, b.getBoardTitle());
			pstmt.setString(3, b.getBoardContent());
			pstmt.setString(4, b.getBoardWriter());
			
			result = pstmt.executeUpdate();
			//System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
		
	
	public int insertBrattachmentList(Connection conn, ArrayList<Brattachment> list) {
		
		// INSERT 문 => int (처리된 행의 갯수)
		int result = 1; 
		// insert 를 반복해서 진행 => 하나라도 실패할경우 실패처리
		// result 를 애초에 1 로 셋팅해두고 누적 곱을 구할 예정
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertBrattachmentList");
		
		try {
			
			for(Brattachment at : list) {
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, at.getBroriginName());
				pstmt.setString(2, at.getBrchangeName());
				pstmt.setString(3, at.getBrfilePath());
				pstmt.setInt(4, at.getBrfileLevel());
				
				result *= pstmt.executeUpdate();
				// 하나라도 실패할 경우 0 이 뜰 것임!!
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}

		return result;
	}
	
	// 사용자 와인용어
	 
	public ArrayList<Board> selectThumbnailList(Connection conn, String boardType) {
		
		ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectThumbnailList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, boardType);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Board b = new Board();
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setTitleImg(rset.getString("TITLEIMG"));
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	// 사용자페어링
	 
	public ArrayList<Board> selectThumbnailPairingList(Connection conn, String boardType) {
		
		ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectThumbnailList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, boardType);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Board b = new Board();
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setTitleImg(rset.getString("TITLEIMG"));
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	// 사용자매거진
	 
	public ArrayList<Board> selectThumbnailMagazineList(Connection conn, String boardType) {
		
		ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectThumbnailList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, boardType);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Board b = new Board();
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setTitleImg(rset.getString("TITLEIMG"));
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	// 와인용어 상세조회 
    public Board selectBoard(Connection conn, int boardNo) {
		
		// SELECT 문 => ResultSet 객체 (한 행 조회)
		
		Board b = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBoard");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				b = new Board();
				
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setBoardWriter(rset.getString("USER_ID"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setBoardContent(rset.getString("BOARD_CONTENT"));
				b.setBoardFile(rset.getString("BOARD_FILE"));
				b.setCreateDate(rset.getDate("CREATE_DATE"));
				b.setStatus(rset.getString("STATUS"));
				b.setBoardType(rset.getString("BOARD_TYPE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}
		
		return b;
	}

	public ArrayList<Brattachment> selectBrattachmentList(Connection conn, int boardNo) {
		
		ArrayList<Brattachment> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBrattachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				
				Brattachment at = new Brattachment();
				at.setBrfileNo(rset.getInt("BRFILE_NO"));
				at.setBroriginName(rset.getString("BRORIGIN_NAME"));
				at.setBrchangeName(rset.getString("BRCHANGE_NAME"));
				at.setBrfilePath(rset.getString("BRFILE_PATH"));
				
				// 여기서 우리가 상세조회 시 CHANGE_NAME, FILE_PATH 값만 이용해도 충분
				// 단, FILE_NO, ORIGIN_NAME 은 수정 또는 삭제 시 필요하므로 조회
				
				list.add(at);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	// 페어링 상세조회 
    public Board selectpBoard(Connection conn, int boardNo) {
		
		// SELECT 문 => ResultSet 객체 (한 행 조회)
		
		Board b = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBoard");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				b = new Board();
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setBoardContent(rset.getString("BOARD_CONTENT"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}
		
		return b;
	}

	public ArrayList<Brattachment> selectpBrattachmentList(Connection conn, int boardNo) {
		
		ArrayList<Brattachment> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBrattachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				
				Brattachment at = new Brattachment();
				at.setBrfileNo(rset.getInt("BRFILE_NO"));
				at.setBroriginName(rset.getString("BRORIGIN_NAME"));
				at.setBrchangeName(rset.getString("BRCHANGE_NAME"));
				at.setBrfilePath(rset.getString("BRFILE_PATH"));
				
				// 여기서 우리가 상세조회 시 CHANGE_NAME, FILE_PATH 값만 이용해도 충분
				// 단, FILE_NO, ORIGIN_NAME 은 수정 또는 삭제 시 필요하므로 조회
				
				list.add(at);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}
		return list;
	}

	// 매거진 상세조회 
    public Board selectmBoard(Connection conn, int boardNo) {
		
		// SELECT 문 => ResultSet 객체 (한 행 조회)
		
		Board b = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBoard");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				b = new Board();
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setBoardContent(rset.getString("BOARD_CONTENT"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}
		
		return b;
	}

	public ArrayList<Brattachment> selectmBrattachmentList(Connection conn, int boardNo) {
		
		ArrayList<Brattachment> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBrattachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				
				Brattachment at = new Brattachment();
				at.setBrfileNo(rset.getInt("BRFILE_NO"));
				at.setBroriginName(rset.getString("BRORIGIN_NAME"));
				at.setBrchangeName(rset.getString("BRCHANGE_NAME"));
				at.setBrfilePath(rset.getString("BRFILE_PATH"));
				
				// 여기서 우리가 상세조회 시 CHANGE_NAME, FILE_PATH 값만 이용해도 충분
				// 단, FILE_NO, ORIGIN_NAME 은 수정 또는 삭제 시 필요하므로 조회
				
				list.add(at);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}
		return list;
	}

	// 관리자 게시판 상세조회 및 업로드
    public Board selectdBoard(Connection conn, int boardNo) {
		
		// SELECT 문 => ResultSet 객체 (한 행 조회)
		
		Board b = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectdBoard");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				b = new Board();
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setBoardContent(rset.getString("BOARD_CONTENT"));
				b.setBoardWriter(rset.getString("USER_ID"));
				b.setCreateDate(rset.getDate("CREATE_DATE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}
		
		return b;
	}


    public ArrayList<Brattachment> selectdBrattachmentList(Connection conn, int boardNo) {
		
		ArrayList<Brattachment> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBrattachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				
				Brattachment at = new Brattachment();
				at.setBrfileNo(rset.getInt("BRFILE_NO"));
				at.setBroriginName(rset.getString("BRORIGIN_NAME"));
				at.setBrchangeName(rset.getString("BRCHANGE_NAME"));
				at.setBrfilePath(rset.getString("BRFILE_PATH"));
				
				// 여기서 우리가 상세조회 시 CHANGE_NAME, FILE_PATH 값만 이용해도 충분
				// 단, FILE_NO, ORIGIN_NAME 은 수정 또는 삭제 시 필요하므로 조회
				
				list.add(at);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
     //게시판 글수정
    public int updateBoard(Connection conn, Board b) {
		
		// UPDATE 문 => int (처리된 행의 갯수)
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateBoard");
				
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, b.getBoardNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateAttachment(Connection conn, Brattachment at) {

		// UPDATE 문 => int (처리된 행의 갯수)
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateAttachment");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getBroriginName());
			pstmt.setString(2, at.getBrchangeName());
			pstmt.setString(3, at.getBrfilePath());
			pstmt.setInt(4, at.getBrfileNo());

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertNewAttachment(Connection conn, Brattachment at) {
		
		// INSERT 문 => int (처리된 행의 갯수)
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertNewAttachment");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, at.getBrrefNo());
			pstmt.setString(2, at.getBroriginName());
			pstmt.setString(3, at.getBrchangeName());
			pstmt.setString(4, at.getBrfilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}
			
		return result;
	}
  	
	// 게시글 삭제
	
	public int deleteBoard(Connection conn, int boardNo) {
		
		// UPDATE 문 => int (처리된 행의 갯수)
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteBoard");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}
		
		return result;
	}
	
}