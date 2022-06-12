package com.winefine.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.winefine.oneqna.model.service.OneqnaService;
import com.winefine.oneqna.model.vo.Oneqna;

/**
 * Servlet implementation class OneqnaAnswerController
 */
@WebServlet("/answer.on")
public class OneqnaAnswerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OneqnaAnswerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int oneqnaNo = Integer.parseInt(request.getParameter("ono"));

		String answer = request.getParameter("answer");
		
		int result = new OneqnaService().updateOneqna(oneqnaNo, answer);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "답변하기에 성공했습니다.");
			response.sendRedirect(request.getContextPath() + "/Mmain.on");	
		}
		else {
			request.setAttribute("errorMsg", "답변하기에 실패했습니다.");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
