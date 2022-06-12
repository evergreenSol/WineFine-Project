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
 * Servlet implementation class ThumbnailPairingDetailController
 */
@WebServlet("/detailp.bo")
public class ThumbnailPairingDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThumbnailPairingDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // 페어링 상세조회 
		
			// get 방식
			// 글번호 뽑기
			int boardNo = Integer.parseInt(request.getParameter("bno"));
			
			// 조회 요청
			// 조회수 증가 생략 했음
			// 제목과 내용 사진 3가지만 상세로 보여주기로 함.
			Board b = new BoardService().selectpBoard(boardNo);
			
			// 해당게시글에 딸린 첨부파일들 조회
			ArrayList<Brattachment> list = new BoardService().selectpBrattachment(boardNo);
			
			// 수화물붙이기
			request.setAttribute("b", b);
			request.setAttribute("list", list);
			
			// 상세보기 포워딩
			request.getRequestDispatcher("views/board/wineDetailView.jsp").forward(request, response);
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
