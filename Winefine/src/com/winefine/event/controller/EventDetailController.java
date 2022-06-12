package com.winefine.event.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.winefine.event.model.service.EventService;
import com.winefine.event.model.vo.Attachment;
import com.winefine.event.model.vo.Event;

/**
 * Servlet implementation class EventDetailController
 */
@WebServlet("/detail.ev")
public class EventDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int eventNo = Integer.parseInt(request.getParameter("eno"));
		
		int result = new EventService().increaseCount(eventNo);
		
		if(result > 0) {
			
			Event e = new EventService().selectEvent(eventNo);
			
			request.setAttribute("e", e);
			
			request.getRequestDispatcher("views/event/eventDetailView.jsp").forward(request, response);
		}
		else {
			request.setAttribute("errorMsg", "사진게시글 조회 실패");
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
