package com.winefine.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.winefine.oneqna.model.service.OneqnaService;
import com.winefine.oneqna.model.vo.Category;
import com.winefine.oneqna.model.vo.Oneqna;

/**
 * Servlet implementation class OneqnaAnswerFormController
 */
@WebServlet("/answerForm.on")
public class OneqnaAnswerFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OneqnaAnswerFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int oneqnaNo = Integer.parseInt(request.getParameter("nno"));
		
		Oneqna o = new OneqnaService().selectOneqna(oneqnaNo);
		
		request.setAttribute("o", o);
		
		request.getRequestDispatcher("views/admin/oneqnaDetailView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
