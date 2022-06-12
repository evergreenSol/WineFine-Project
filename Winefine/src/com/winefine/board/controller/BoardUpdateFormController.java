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
 * Servlet implementation class BoardUpdateFormController
 */
@WebServlet("/updateForm.bo")
public class BoardUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자 게시판 수정... 
		
		// 카테고리 전체조회, 해당게시글조회, 해당게시글에 딸린 첨부파일 상세 조회
		BoardService bService = new BoardService();
		
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		// 카테고리는... 어쩌지..?
		
		// 제목, 내용, 사진 (기존에 사용했던거 불러온거)
		Board b = bService.selectBoard(boardNo);
		ArrayList<Brattachment> list = bService.selectBrattachment(boardNo);

		
		// 수화물 붙이기
		request.setAttribute("b", b);
		request.setAttribute("list", list);
		
		// 포워딩
		request.getRequestDispatcher("views/admin/boardUpdateForm.jsp").forward(request, response);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
