package com.winefine.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.winefine.member.model.service.MemberService;
import com.winefine.member.model.vo.Member;

/**
 * Servlet implementation class FindPwdController
 */
@WebServlet("/findPwd.me")
public class FindPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//인코딩 설정
		request.setCharacterEncoding("UTF-8");
		
		// jsp에서 넘긴 값 뽑아서 변수에 담기
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		
		HttpSession session = request.getSession();	
		
		//서비스 단에 메소드 호출 후 결과값 받기
		Member m = new MemberService().selectMemberPwd(userId, userName, email);
		
		if(m != null) {
			
			request.setAttribute("m", m);
			request.getRequestDispatcher("views/member/resetPwd.jsp").forward(request, response);
			
		} else {
			
			session.setAttribute("alertMsg", "회원 정보가 일치하지 않습니다. 다시 입력해 주세요.");
			request.getRequestDispatcher("views/member/findPwd.jsp").forward(request, response);
		}
		
		
		
		
		//랜덤값 생성
		/*
		String ranPwd = "";
		StringBuffer sb = new StringBuffer();
		StringBuffer sc = new StringBuffer("!@#$%^&*-=?~");
		
		sb.append((char)((Math.random()*26)+65));
			
		for(int i=0; i<3; i++) { //아스키번호 65(A)부터 26글자 중에 택일
			
			sb.append((char)((Math.random()*26)+65));
		}
			
		for(int i=0; i<4;i++) { //소문자 4개 임의 발생
			
			sb.append((char)((Math.random()*26)+97));
		}
		for(int i=0; i<2; i++) { //숫자 2개 임의 발생
			
			sb.append((char)((Math.random()*26)+48));
		}
		
		sb.setCharAt(((int)(Math.random()*3)+1), sc.charAt((int)(Math.random()*sc.length()-1)));//대문자3개중 하나   
		sb.setCharAt(((int)(Math.random()*4)+4), sc.charAt((int)(Math.random()*sc.length()-1))); //소문자4개중 하나
		
		ranPwd = sb.toString();
		
		
		// MemberService의 메소드를 호출 후 결과값 받기
		int result = new MemberService().selectPwd(userId, userName, phone, ranPwd);
		
		
		if(result>0) { //조회 성공 시 난수 비밀번호 조회 페이지로 이동
			
			session.setAttribute("ranPwd", ranPwd); // 비밀번호 수정할 회원 정보를 세션 객체에 담기
			
			request.getRequestDispatcher("views/member/randomPwd.jsp").forward(request, response);
		}
		
		else { //조회 실패
			session.setAttribute("alertMsg", "일치하는 회원의 정보가 없습니다. 다시 시도해 주세요."); 
			
			response.sendRedirect(request.getContextPath() + "/findPwdForm.me");
		}
		*/
		
		/*
	 // MemberService의 메소드를 호출해서 결과값 받기 - 비밀번호 정보가 담겨옴
		String userPwd = new MemberService().selectPwd(userId, phone);
	
		HttpSession session = request.getSession();	
		
		if(userPwd != null) { //회원 조회 성공 
		
			
			int pwdSize = userPwd.length()/2; //비밀번호를 반으로 나눴을 때의 길이
			String halfPwd = userPwd.substring(0, pwdSize); //비밀번호를 0번째 부터 pwdSize번째까지 저장한 변수
			
			String tmp = "";
			if(pwdSize % 2 == 1) { //비밀번호 길이가 홀수일 경우 * 한 개 더 추가
				
				for(int i=0; i<pwdSize+1; i++) {
					tmp += "*";
				}
			} else {
				
				for(int i=0; i<pwdSize; i++) {
					tmp += "*";
				}
			}
			
			String resultPwd = halfPwd + tmp;
			
			request.setAttribute("resultPwd", resultPwd);
			
			request.getRequestDispatcher("views/member/findPwd.jsp").forward(request, response);
		}
		else { // 조회 실패 -> 
			
			session.setAttribute("alertMsg", "일치하는 회원의 정보가 없습니다. 다시 시도해 주세요."); 
			//System.out.println("null이란다");
			
			response.sendRedirect(request.getContextPath() + "/findPwdForm.me");
		}
		*/
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
