package com.winefine.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.winefine.board.model.service.BoardService;
import com.winefine.board.model.vo.Board;
import com.winefine.board.model.vo.Brattachment;

/**
 * Servlet implementation class BoardFormFetailController
 */
@WebServlet("/formdetail.bo")
public class BoardFormFetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardFormFetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 사용자가 요청 시 전달한 해당 글번호 뽑기
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		Board b = new BoardService().selectdBoard(boardNo);
		
		// 파일 조회 
		ArrayList<Brattachment> list = new BoardService().selectdBrattachment(boardNo);
		
		request.setAttribute("b", b);
		request.setAttribute("list", list);
		
		// 포워딩 테스트 
		request.getRequestDispatcher("views/admin/boardFormDetailView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
