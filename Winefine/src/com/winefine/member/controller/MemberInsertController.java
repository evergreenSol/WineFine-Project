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
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/insert.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 인코딩 세팅
		request.setCharacterEncoding("UTF-8");
		
		// 2. 변수에 값 대입 및 VO 객체 가공
		// 아이디, 비밀번호, 이름, 핸드폰번호, 이메일, 주민등록번호
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String userSsn = request.getParameter("userSsn");
		
		Member m = new Member(userId, userPwd, userName, phone, email, userSsn);
		
		// 3. MemberService의 메소드를 호출하기
		int result = new MemberService().insertMember(m);
		
		// 성공 시 세션 객체 생성
		HttpSession session = request.getSession();
					
		
		// 4. 반환된 결과에 따라 응답 페이지 지정
		if(result > 0) { // 성공
			
			// 환영 메세지 전달
			session.setAttribute("alertMsg", "WINE FINE의 회원이 되신 것을 진심으로 환영합니다! ");
			
			// URL 재요청하기
			response.sendRedirect("enrollFin.me");
			//request.getRequestDispatcher("views/member/memberEnrollFinish.jsp").forward(request, response);
			
		}
		else {	// 실패
			
			// 에러 메세지 담기
			session.setAttribute("alertMsg", "회원가입에 실패하였습니다.");
			// 에러 페이지로 포워딩
			request.getRequestDispatcher("views/member/memberEnrollForm.jsp").forward(request, response);
			
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
