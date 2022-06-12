package com.winefine.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.winefine.member.model.service.MemberService;
import com.winefine.member.model.vo.Member;

/**
 * Servlet implementation class MyPageUpdateMember
 */
@WebServlet("/update.me")
public class MyPageUpdateMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageUpdateMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		Member m = new Member();
 
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		String newUserName = request.getParameter("userName");
		String newEmail = request.getParameter("email");
		String newPhone = request.getParameter("phone");
		
		m.setUserNo(userNo);
		m.setUserName(newUserName);
		m.setEmail(newEmail);
		m.setPhone(newPhone);
		
		if(request.getParameter("newUserPwd") != "") { // 새 비번이 입력되어서 넘어온 경우
			m.setUserPwd(request.getParameter("newUserPwd"));
		}

		Member updatedMem = new MemberService().updateMember(m);
		
		if(updatedMem != null) {
			
			request.getSession().setAttribute("loginUser", updatedMem);
			
			request.getSession().setAttribute("alertMsg", "회원정보 수정에 성공했습니다.");
			
			response.sendRedirect(request.getContextPath() + "/updateInfForm.me");
		}
		else {
			request.setAttribute("errorMsg", "회원정보 수정에 실패했습니다.");
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
