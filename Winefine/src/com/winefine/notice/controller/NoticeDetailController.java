package com.winefine.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.winefine.notice.model.service.NoticeService;
import com.winefine.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeDetailController
 */
@WebServlet("/detail.no")
public class NoticeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Get 방식
		
		// 클릭시 글번호
		int noticeNo = Integer.parseInt(request.getParameter("nno"));
		
		// 조회수 증가
		int result = new NoticeService().increaseCount(noticeNo);
		
		if(result > 0) { // 조회수 증가되면 상세보기 서비스 요청 후 상세보기 페이지로 포워딩
			
			Notice n = new NoticeService().selectNotice(noticeNo);
			
			request.setAttribute("n", n);
			
			request.getRequestDispatcher("views/notice/noticeDetailView.jsp").forward(request, response);
		}
		else { // 조회수 증가에 실패했다면 => 에러페이지
			
			request.setAttribute("errorMsg", "공지사항 조회 실패");
			
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
