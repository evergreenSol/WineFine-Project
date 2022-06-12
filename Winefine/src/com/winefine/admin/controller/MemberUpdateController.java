package com.winefine.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.winefine.member.model.service.MemberService;

/**
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/updateMember.admin")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String blacklist = request.getParameter("blacklist");
		
		int result = new MemberService().updateMemberAdmin(userNo, blacklist);
		
		if(result > 0) {
			
			request.setAttribute("alertMsg", "관리자님, 회원 정보 수정되었습니다.");
			response.sendRedirect(request.getContextPath() + "/memdetail.admin?mno=" + userNo);
		}
		else {
			request.setAttribute("alertMsg", "관리자님, 회원 정보 수정에 실패했습니다.");
			
			response.sendRedirect(request.getContextPath() + "/memList.me");
		
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
