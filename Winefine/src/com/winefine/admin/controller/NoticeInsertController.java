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
 * Servlet implementation class NoticeInsertController
 */
@WebServlet("/insert.no")
public class NoticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		
		// 전달값 뽑고 변수에 기록 및 VO 객체로 가공
		// 제목, 내용, 작성자회원번호
		String userNo = (request.getParameter("userNo"));
		String noticeTitle = request.getParameter("title");
		String noticeContent = request.getParameter("content");
		
		Notice n = new Notice();
		n.setNoticeWriter(userNo);
		n.setNoticeTitle(noticeTitle);
		n.setNoticeContent(noticeContent);
		
		int result = new NoticeService().insertNotice(n);
		
		if(result > 0) { // 성공 => /winefine/Mmain.no 로 요청
			
			request.getSession().setAttribute("alertMsg", "성공적으로 공지사항이 등록되었습니다.");
			
			response.sendRedirect(request.getContextPath() + "/Mmain.no");
			
		}
		else { // 오류 => 오류메세지
			request.setAttribute("errorMsg", "공지사항 등록 실패");
			
			request.getRequestDispatcher("views/common/errorMsg.jsp").forward(request, response);
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
