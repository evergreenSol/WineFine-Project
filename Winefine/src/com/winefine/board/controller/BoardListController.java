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
import com.winefine.common.model.vo.PageInfo;
// 관리자 게시판 list.bo?currentPage=1
/**
 * Servlet implementation class BoardListController
 */
@WebServlet("/list.bo")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// ----- 페이징 처리 -----
		// 기본적으로 구해야 하는 변수들
		int listCount; // 현재 총 게시글 갯수
		int currentPage; // 현재 보여질 페이지 (즉, 사용자가 요청한 페이지)
		int pageLimit; // 페이지 하단에 보여질 페이징바의 페이지 최대 갯수
		int boardLimit; // 한 페이지에 보여질 게시글의 최대 갯수 (한 페이지당 게시글이 몇개 단위씩 보여질건지)
		
		// 위의 변수들을 이용해서 계산해서 구해야 하는 변수들
		int maxPage; // 가장 마지막 페이지가 몇번페이지인지 (총 페이지 수)
		int startPage; // 페이지 하단에 보여질 페이징바의 시작수
		int endPage; // 페이지 하단에 보여질 페이징바의 끝수
		
		// * listCount : 현재 총 게시글 갯수 (단, STATUS 값이 'Y' 일 경우)
		listCount = new BoardService().selectListCount();
		
		// System.out.println(listCount);
		
		// * currentPage : 현재페이지 (즉, 사용자가 요청한 페이지)
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		// * pageLimit : 페이지 하단에 보여질 페이징바의 페이지의 최대 갯수
		//				 (페이지 목록들이 몇개 단위씩 보여질건지 지정)
		pageLimit = 10;
		
		// * boardLimit : 한 페이지에 보여질 게시글의 최대 갯수 
		//				  (게시글을 몇개 단위씩 보여질건지 지정)
		boardLimit = 10;
		
		// * maxPage : 가장 마지막 페이지가 몇번째 페이지인지 (총 페이지 갯수)
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			
			endPage = maxPage;
		}
		
		// 페이지 정보들을 하나의 공간에 담아서 보내자
		// 페이지 정보들을 담을 VO 클래스를 하나 더 만들 것 (PageInfo)
		// => 일반게시판 뿐만 아니라 공지사항 게시판이나 사진게시판에서도 쓸 수 있게끔 common 패키지에 만들것임
		
		// 1. 페이징 바 만들때 필요한 객체 셋팅
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, 
								   maxPage, startPage, endPage);
		
		// 2. 현재 사용자가 요청한  페이지(currentPage) 에 보여질 게시글 리스트 요청하기
		ArrayList<Board> list = new BoardService().selectList(pi);
		
		// System.out.println(list);
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
	
		request.getRequestDispatcher("views/admin/boardListView.jsp").forward(request, response);
	}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
