package com.winefine.admin.controller;

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
 * Servlet implementation class EventAdminDetailController
 */
@WebServlet("/Mdetail.ev")
public class EventAdminDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventAdminDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int eventNo = Integer.parseInt(request.getParameter("eno"));
		
		Event e = new EventService().selectEvent(eventNo);
		
		if(e != null) {
		request.setAttribute("e", e);
			
		request.getRequestDispatcher("views/admin/eventDetailView.jsp").forward(request, response);
		}
		else {
			request.setAttribute("errorMsg", "이벤트 조회 실패!");
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
