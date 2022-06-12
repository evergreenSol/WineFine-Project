package com.winefine.member.model.dao;

import static com.winefine.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.winefine.common.JDBCTemplate;
import com.winefine.common.model.vo.PageInfo;
import com.winefine.member.model.vo.Member;

	
public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		
		String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}

	public Member loginMember(Connection conn, String userId, String userPwd) {
		
		// select 문 => ResultSet 조회
		
		// 필요한 변수들 세팅
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			
			
			if(rset.next()) {
				m = new Member();
				m.setUserNo(rset.getInt("USER_NO"));
				m.setUserId(rset.getString("USER_ID"));
				m.setUserPwd(rset.getString("USER_PWD"));
				m.setUserName(rset.getString("USER_NAME"));
				m.setPhone(rset.getString("PHONE"));
				m.setEmail(rset.getString("EMAIL"));
				m.setEnrollDate(rset.getDate("ENROLL_DATE"));
				m.setUserSsn(rset.getString("USER_SSN"));
				m.setBlacklist(rset.getString("BLACKLIST"));
				m.setStatus(rset.getString("STATUS"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			// 자원 반납
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		//결과값 리턴
		return m;
	}
	
	public int insertMember(Connection conn, Member m) {
		
		//필요한 변수들 세팅
		int result=0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getUserSsn());
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	// 아이디 찾기 메소드
	public Member selectMemberId(Connection conn, String userName, String phone) {
		
		// 필요한 변수들 세팅
		Member m = null;
		ResultSet rset=null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectMemberId");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userName);
			pstmt.setString(2, phone);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member();
				
				m.setUserId(rset.getString("USER_ID"));
				m.setUserNo(rset.getInt("USER_NO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
			
		}
		return m;
	}
	
	
	
	public int updateMember(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		if(m.getUserPwd() == null) {
			
			String sql = prop.getProperty("updateMember1");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, m.getUserName());
				pstmt.setString(2, m.getEmail());
				pstmt.setString(3, m.getPhone());
				pstmt.setInt(4, m.getUserNo());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(pstmt);
			}
		}
		else {
			
			String sql = prop.getProperty("updateMember2");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, m.getUserName());
				pstmt.setString(2, m.getEmail());
				pstmt.setString(3, m.getPhone());
				pstmt.setString(4, m.getUserPwd());
				pstmt.setInt(5, m.getUserNo());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(pstmt);
			}
			
		}
		
		return result;

	}
	
	public Member selectOneMember(Connection conn, Member m) {
		
		Member updatedMem = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOneMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, m.getUserNo());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				updatedMem = new Member(rset.getInt("USER_NO"),
						rset.getString("USER_ID"),
						rset.getString("USER_PWD"),
						rset.getString("USER_NAME"),
						rset.getString("PHONE"),
						rset.getString("EMAIL"),
						rset.getDate("ENROLL_DATE"),
						rset.getString("USER_SSN"),
						rset.getString("BLACKLIST"),
						rset.getString("STATUS"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return updatedMem;
	}
	
	public int deleteMember(Connection conn, int userNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;

	}
	
	
// AJAX 아이디 중복 검사
	public int checkId(Connection conn, String idCheck) {
		
		// 필요한 변수들 세팅
		int count = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("checkId");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, idCheck);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				count = rset.getInt("COUNT(*)");			
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 생성 역순으로 자원 반납
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return count;
	}
		
		//AJAX 이메일 주소 중복 검사
	public int checkEmail(Connection conn, String emailCheck) {
		
		// 필요한 변수들 세팅
		int count = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("checkEmail");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, emailCheck);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				count = rset.getInt("COUNT(*)");			
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 생성 역순으로 자원 반납
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return count;
	}
		
		
public Member selectMemberPwd(Connection conn, String userId, String userName, String email) {
		
		// 필요한 변수들 세팅
		Member m = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
				
		String sql = prop.getProperty("selectMemberPwd");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userName);
			pstmt.setString(3, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				m = new Member();
				
				m.setUserNo(rset.getInt("USER_NO"));
				m.setUserName(rset.getString("USER_NAME"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}
		
	public int resetPwd(Connection conn, String rPwd, int userNo) {
		
		int result=0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("resetPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, rPwd);
			pstmt.setInt(2, userNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}
	
	public int updateRandomPwd(Connection conn, String userId, String ranPwd) {
		
		int result=0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateRandomPwd");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, ranPwd);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			JDBCTemplate.close(pstmt);
			
		}
		return result;
		
		
	}


	
	// admin 에서 전체 회원 조회하는 메소드
	public int selectMemberListCount(Connection conn) {
		
		//필요한 변수들 세팅
		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectMemberListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				listCount = rset.getInt("COUNT");
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return listCount;
	}

	public ArrayList<Member> selectMemberList(Connection conn, PageInfo pi){
		
		//select 문 -> ResultSet 객체(여러 행 조회) => ArrayList
		ArrayList<Member> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMemberList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			//boardLimit은 10
			//시작값 : (currentPage-1)*boardLimit +1
			//끝 값 : 시작값 + boardLimit -1
			int startRow = (pi.getCurrentPage() - 1)* pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Member(rset.getInt("USER_NO")
									,rset.getString("USER_ID")
									,rset.getString("USER_PWD")
									,rset.getString("USER_NAME")
									,rset.getString("PHONE")
									,rset.getString("EMAIL")
									,rset.getDate("ENROLL_DATE")
									,rset.getString("USER_SSN")
									,rset.getString("BLACKLIST")
									,rset.getString("STATUS")));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	
	
	
	// 관리자가 블랙리스트 값 수정하는 메소드
	public int updateMemberAdmin(Connection conn, int userNo, String blacklist) {
		
		//update 문 -> 결과값 int 로 나옴
		//필요한 변수들 세팅
		int result=0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateMemberAdmin");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, blacklist);
			pstmt.setInt(2, userNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			JDBCTemplate.close(pstmt);
		}
		
		return result;
		
	}
		
	public Member selectOneMember2(Connection conn, int userNo) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset=null;
		
		String sql = prop.getProperty("selectOneMember2");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member();
				
				m.setUserNo(rset.getInt("USER_NO"));
				m.setUserId(rset.getString("USER_ID"));
				m.setUserPwd(rset.getString("USER_PWD"));
				m.setUserName(rset.getString("USER_NAME"));
				m.setPhone(rset.getString("PHONE"));
				m.setEmail(rset.getString("EMAIL"));
				m.setEnrollDate(rset.getDate("ENROLL_DATE"));
				m.setUserSsn(rset.getString("USER_SSN"));
				m.setBlacklist(rset.getString("BLACKLIST"));
				m.setStatus(rset.getString("STATUS"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}
	
	
	
	
}
