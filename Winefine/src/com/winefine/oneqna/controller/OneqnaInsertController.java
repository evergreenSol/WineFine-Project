package com.winefine.oneqna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.winefine.oneqna.model.service.OneqnaService;
import com.winefine.oneqna.model.vo.Oneqna;

/**
 * Servlet implementation class OneqnaListController
 */
@WebServlet("/insert.on")
public class OneqnaInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OneqnaInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String userNo = request.getParameter("userNo");
		String phone = request.getParameter("phone");
		String categoryNo = request.getParameter("category");
		String oneqnaTitle = request.getParameter("title");
		String oneqnaContent = request.getParameter("content");
		
		Oneqna o = new Oneqna();
		o.setOneqnaWriter(userNo);
		o.setPhone(phone);
		o.setCategoryNo(categoryNo);
		o.setOneqnaTitle(oneqnaTitle);
		o.setOneqnaContent(oneqnaContent);
		
		
		
		o.setOneqnaContent(oneqnaContent);
		
		int result = new OneqnaService().insertOneqna(o);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "성공적으로 문의가 요청되었습니다.");
			
			response.sendRedirect(request.getContextPath() + "/1on1.me");
		}
		else {
			request.setAttribute("errorMsg", "문의 요청 실패");
			
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
