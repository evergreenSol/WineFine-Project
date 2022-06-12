package com.winefine.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.winefine.member.model.service.MemberService;

/**
 * Servlet implementation class AjaxCheckEmailController
 */
@WebServlet("/checkEmail.me")
public class AjaxCheckEmailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCheckEmailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 전달 값을 뽑아서 변수에 담기
		String emailCheck = request.getParameter("emailCheck");
				
		// MemberService로 매개변수와 함께 요청 보내기
		int count = new MemberService().checkEmail(emailCheck);
				
		//세팅값 설정
		response.setContentType("text/html; charSet=UTF-8");
				
		if(count > 0) { //이미 이메일 주소가 존재할 경우 -> 사용 불가
					
			response.getWriter().print("NNNNN");
					
		}
		else { // 존재하지 않는 경우 -> 사용 가능
					
			response.getWriter().print("NNNNY");
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
