package com.winefine.member.model.service;

import static com.winefine.common.JDBCTemplate.close;
import static com.winefine.common.JDBCTemplate.commit;
import static com.winefine.common.JDBCTemplate.getConnection;
import static com.winefine.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.winefine.common.JDBCTemplate;
import com.winefine.common.model.vo.PageInfo;
import com.winefine.member.model.dao.MemberDao;
import com.winefine.member.model.vo.Member;

public class MemberService {

	public Member loginMember(String userId, String userPwd) {
		
		Connection conn = getConnection();
		
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		
		close(conn);
		
		return m;
	}
	
	
	public int insertMember(Member m) {
		
		//Connection 객체 생성
		Connection conn = getConnection();
		
		//MemberDao의 메소드 호출 후 결과값 받기
		int result = new MemberDao().insertMember(conn, m);
		
		//트랜잭션 처리
		if(result > 0) {  //성공한 경우
			
			commit(conn);
		}
		else { //실패한 경우
			
			rollback(conn);
		}
		return result;
	}
	
	
	// 아이디 찾기 메소드
	public Member selectMemberId(String userName, String phone) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new MemberDao().selectMemberId(conn, userName, phone);
		
		JDBCTemplate.close(conn);
		
		return m;
	}
	

	public Member updateMember(Member m) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMember(conn, m);
		
		Member updatedMem = null;
		
		if(result > 0) {
			commit(conn);
			
			updatedMem = new MemberDao().selectOneMember(conn, m); 
			
		}
		else {
			rollback(conn);
		}
		return updatedMem;
	}
	
	public int deleteMember(int userNo) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteMember(conn, userNo);
		
		if(result > 0) {
			commit(conn);
			
		}
		else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	// AJAX 중복 아이디 검사 메소드
	public int checkId(String idCheck) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int count = new MemberDao().checkId(conn, idCheck);
		
		JDBCTemplate.close(conn);
		
		return count;
	}
	
	// AJAX 중복 이메일 주소 검사 메소드
		public int checkEmail(String emailCheck) {
				
			Connection conn = JDBCTemplate.getConnection();
				
			int count = new MemberDao().checkEmail(conn, emailCheck);
				
			JDBCTemplate.close(conn);
				
			return count;
			}
		
		//아이디, 이름, 이메일 정보 넘겨 받아서 회원 정보 일치 여부 확인 메소드
		public Member selectMemberPwd(String userId, String userName, String email) {
			
			Connection conn = JDBCTemplate.getConnection();
			
			Member m = new MemberDao().selectMemberPwd(conn, userId, userName, email);
			
			JDBCTemplate.close(conn);
			
			return m;		
		}

	public int resetPwd(String rPwd, int userNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().resetPwd(conn, rPwd, userNo);
		
		
		if(result>0) {
			
			JDBCTemplate.commit(conn);
		} else {
			
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
		
		
	// 회원 리스트 수 조회 메소드
	public int selectMemberListCount() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new MemberDao().selectMemberListCount(conn);
		
		JDBCTemplate.close(conn);
		
		return listCount;
	}
	
	// 회원 리스트 조회 메소드
	public ArrayList<Member> selectMemberList(PageInfo pi){
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Member> list = new MemberDao().selectMemberList(conn, pi);
		
		JDBCTemplate.close(conn);
		
		return list;
	}
	
	 //회원 상태값 수정 메소드(블랙리스트)
	public int updateMemberAdmin(int userNo, String blacklist) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().updateMemberAdmin(conn, userNo, blacklist);
		
		if(result > 0) {
			
			JDBCTemplate.commit(conn);
		} 
		else {
			
			JDBCTemplate.rollback(conn);
		}
			JDBCTemplate.close(conn);
			
		return result;
	}
	
	
	public Member selectOneMember2(int userNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new MemberDao().selectOneMember2(conn, userNo);
		
		JDBCTemplate.close(conn);
		
		return m;
	}
	
	
	
	
}


















