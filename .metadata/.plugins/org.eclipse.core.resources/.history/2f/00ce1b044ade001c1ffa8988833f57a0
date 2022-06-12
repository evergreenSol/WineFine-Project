package com.winefine.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.winefine.member.model.service.MemberService;

/**
 * Servlet implementation class AjaxCheckPhoneController
 */
@WebServlet("/checkPhone.me")
public class AjaxCheckPhoneController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCheckPhoneController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 전달 값을 뽑아서 변수에 담기
		String phoneCheck = request.getParameter("phoneCheck");
		
		// MemberService로 매개변수와 함께 요청 보내기
		int count = new MemberService().checkPhone(phoneCheck);
		
		//세팅값 설정
		response.setContentType("text/html; charSet=UTF-8");
		
		if(count > 0) { //이미 핸드폰번호가 존재할 경우 -> 사용 불가
			
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
