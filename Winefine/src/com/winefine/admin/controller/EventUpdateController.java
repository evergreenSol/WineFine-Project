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
 * Servlet implementation class EventUpdateController
 */
@WebServlet("/update.ev")
public class EventUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("resources/event/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			Event e = new Event();
			
			e.setEventNo(Integer.parseInt(multiRequest.getParameter("eno")));
			e.setEventWriter(multiRequest.getParameter("userNo"));
			e.setEventTitle(multiRequest.getParameter("title"));
			e.setStartDate(multiRequest.getParameter("startDate"));
			e.setEndDate(multiRequest.getParameter("endDate"));
			if(multiRequest.getOriginalFileName("thumbnail") != null) {
				e.setThumbnail(request.getContextPath() + "/resources/event/" + multiRequest.getFilesystemName("thumbnail"));	
			}
			if(multiRequest.getOriginalFileName("contentPhoto") != null) {
				e.setContentPhoto(request.getContextPath() + "/resources/event/" + multiRequest.getFilesystemName("contentPhoto"));
			}
			
			int result = new EventService().updateEvent(e);
			

		
		
		if(result > 0) {
			
			request.setAttribute("e", e);
			
			request.getSession().setAttribute("alertMsg", "성공적으로 수정되었습니다.");
//			request.getRequestDispatcher("views/admin/eventDetailView.jsp").forward(request, response);
			response.sendRedirect(request.getContextPath() + "/Mmain.ev");
					
		}
		else {
			
			request.setAttribute("errorMsg", "이벤트 수정 실패");
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
