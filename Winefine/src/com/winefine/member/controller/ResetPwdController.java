package com.winefine.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.winefine.member.model.service.MemberService;

/**
 * Servlet implementation class ResetPwdController
 */
@WebServlet("/resetPwd.me")
public class ResetPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetPwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String rPwd = request.getParameter("resetPwd2");
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		int result = new MemberService().resetPwd(rPwd, userNo);
		
		HttpSession session = request.getSession();	
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "비밀번호를 재설정하였습니다. 다시 로그인해주세요.");
			request.getRequestDispatcher("views/member/memberLogin.jsp").forward(request, response);
			
		} else {
			
			session.setAttribute("alertMsg", "비밀번호를 재설정하지 못했습니다.");
			response.sendRedirect(request.getContextPath()+"/main.do");
			
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
