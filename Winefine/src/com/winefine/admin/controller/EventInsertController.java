package com.winefine.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.winefine.common.MyFileRenamePolicy;
import com.winefine.event.model.service.EventService;
import com.winefine.event.model.vo.Attachment;
import com.winefine.event.model.vo.Event;

/**
 * Servlet implementation class insertEventController
 */
@WebServlet("/insert.ev")
public class EventInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 1_1. 최대 용량
			int maxSize = 10 * 1024 * 1024;
			
			// 1_2. 저장 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/event/");
			
			// 2. 전달된 파일명 수정 후 서버 업로드
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 3. 요청 시 전달값 뽑기
			Event e = new Event();
			
			
			e.setEventWriter(multiRequest.getParameter("userNo"));
			e.setEventTitle(multiRequest.getParameter("title"));
			e.setStartDate(multiRequest.getParameter("startDate"));
			e.setEndDate(multiRequest.getParameter("endDate"));
			e.setThumbnail(request.getContextPath() + "/resources/event/" + multiRequest.getFilesystemName("thumbnail"));
			e.setContentPhoto(request.getContextPath() + "/resources/event/" + multiRequest.getFilesystemName("contentPhoto"));
		
			
			int result = new EventService().insertEvent(e);
			

			
			if(result > 0) {
				
				request.getSession().setAttribute("alertMsg", "성공적으로 업로드 하였습니다.");
				response.sendRedirect(request.getContextPath() + "/Mmain.ev");
			}
			else { 
				request.setAttribute("errorMsg", "업로드에 실패했습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
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
