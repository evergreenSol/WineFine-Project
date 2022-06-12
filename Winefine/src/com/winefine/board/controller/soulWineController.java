package com.winefine.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.winefine.board.model.service.SoulWineService;
import com.winefine.store.model.vo.Product;

/**
 * Servlet implementation class soulWineController
 */
@WebServlet("/result.bo")
public class soulWineController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public soulWineController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		int sweetness = Integer.parseInt(request.getParameter("sweetness"));
		int acidity = Integer.parseInt(request.getParameter("acidity"));
		int body = Integer.parseInt(request.getParameter("body"));
		int tannin = Integer.parseInt(request.getParameter("tannin"));
		
		
		ArrayList<Product> list = new SoulWineService().selectSoulWineList(sweetness, acidity, body, tannin);
		request.setAttribute("soulWineResultList", list);
		
		// 응답페이지 : 소울와인찾기 결과 페이지 (myPage_viewCart.jsp)
		request.getRequestDispatcher("views/board/soulWineResult.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
