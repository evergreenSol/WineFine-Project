package com.winefine.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.winefine.notice.model.service.NoticeService;
import com.winefine.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdateController
 */
@WebServlet("/update.no")
public class NoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		
		// 전달값 뽑아서 변수에 기록
		// 글번호, 글제목, 글내용
		int noticeNo = Integer.parseInt(request.getParameter("nno"));
		String noticeTitle = request.getParameter("title");
		String noticeContent = request.getParameter("content");
		
		// VO 객체 가공
		Notice n = new Notice();
		n.setNoticeNo(noticeNo);
		n.setNoticeTitle(noticeTitle);
		n.setNoticeContent(noticeContent);
		
		// 서비스단으로 넘기기
		int result = new NoticeService().updateNotice(n);
		
		// 결과에 따른 응답페이지 
		if(result > 0) { // 성공 => 헤당 상세보기 페이지로 url 재요청
			
			// /detail.no?nno= 글번호
			request.getSession().setAttribute("alertMsg", "성공적으로 공지사항을 수정했습니다.");
			
			response.sendRedirect(request.getContextPath() + "/Mdetail.no?nno=" + noticeNo); 
			
		}
		else { // 실패 => 에러메세지 
			
			request.setAttribute("errorMsg", "공지사항 수정에 실패했습니다.");
			
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
