package com.winefine.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.winefine.notice.model.service.NoticeService;
import com.winefine.store.model.service.ReviewService;

/**
 * Servlet implementation class ReviewAdminStatusController
 */
@WebServlet("/review.admin_do")
public class ReviewAdminStatusController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewAdminStatusController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String status = request.getParameter("reviewOpen");
		String answer = request.getParameter("reviewAnswer");
		int rNo = Integer.parseInt(request.getParameter("rno"));
		
		int result = new ReviewService().updateStatus(status, answer, rNo);
		
		if(result > 0) { // 상태 업데이트 (공개여부 수정, 답변달기) 성공 시 
			request.setAttribute("rNo", rNo);
			request.getSession().setAttribute("alertMsg", "수정되었습니다.");
			response.sendRedirect(request.getContextPath() + "/review.admin?currentPage=1");
			
		} else { // 오류 => 오류메세지
			request.setAttribute("errorMsg", "다시 시도해주세요.");
			response.sendRedirect(request.getContextPath() + "/review.admin?currentPage=1");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
