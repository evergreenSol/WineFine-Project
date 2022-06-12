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
 * Servlet implementation class EventUpdateFormController
 */
@WebServlet("/updateForm.ev")
public class EventUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		int eventNo = Integer.parseInt(request.getParameter("eno"));
		
		Event e = new EventService().selectEvent(eventNo);
		
		request.setAttribute("e", e);
		
		request.getRequestDispatcher("views/admin/eventUpdateView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
