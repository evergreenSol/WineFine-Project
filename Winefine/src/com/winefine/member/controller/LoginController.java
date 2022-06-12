package com.winefine.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.winefine.member.model.service.MemberService;
import com.winefine.member.model.vo.Member;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login.me")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		
		// 2. 필요한 정보 변수에 담기
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		// 쿠키 설정
		String saveId = request.getParameter("saveId");
		
		if(saveId != null && saveId.equals("y")) {
			
			Cookie cookie = new Cookie("saveId", userId);
			
			cookie.setMaxAge(2 * 24 * 60 * 60);
			
			response.addCookie(cookie);
		}
		else { //쿠키 삭제
			
			Cookie cookie = new Cookie("saveId", userId);
			cookie.setMaxAge(0);
			response.addCookie(cookie);
			
		}
		
		// 3. MemberService의 메소드를 호출하기
	      Member loginUser = new MemberService().loginMember(userId, userPwd);
	      
	      //loginUser가 null 이 아님==login한 사용자의 정보가 들어있다 : 세션 객체에 담아서 전달
	      HttpSession session = request.getSession();
	      
	      // 4. 결과값에 따라 응답 화면 지정
	      if(loginUser != null) {
	               
	         session.setAttribute("loginUser", loginUser);
	         
	         response.sendRedirect(request.getContextPath() + "/main.do");
	         
	         //로그인 성공 시 알람 메세지도 함께 전송
	         session.setAttribute("alertMsg", "WINE FINE에 오신 것을 환영합니다 :D");
	      }
	      else {
	         
	         //로그인에 실패했을 경우
	         session.setAttribute("alertMsg", "로그인에 실패하였습니다. 다시 시도해 주세요.");
	         
	         request.getRequestDispatcher("views/member/memberLogin.jsp").forward(request, response);
	         
	      }   
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
