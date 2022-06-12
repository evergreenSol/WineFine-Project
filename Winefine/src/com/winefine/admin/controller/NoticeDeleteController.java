package com.winefine.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.winefine.notice.model.service.NoticeService;

/**
 * Servlet implementation class NoticeDeleteController
 */
@WebServlet("/delete.no")
public class NoticeDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// get 방식
		
		// 전달값 뽑아서 변수에 기록
		int noticeNo = Integer.parseInt(request.getParameter("nno"));
		
		// 서비스로 전달값 넘김
		int result = new NoticeService().deleteNotice(noticeNo);
		
		// 응답처리
		if(result > 0) {
			
			// 공지사항 리스트 페이지로 재요청
			request.getSession().setAttribute("alertMsg", "성공적으로 공지사항이 삭제되었습니다");
			
			response.sendRedirect(request.getContextPath() + "/Mmain.no");
			
		}
		else {
			request.setAttribute("errorMsg", "공지사항 삭제 실패");
			
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
