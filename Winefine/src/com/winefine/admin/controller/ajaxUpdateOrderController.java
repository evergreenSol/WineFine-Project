package com.winefine.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.winefine.order.model.service.OrderService;
import com.winefine.order.model.vo.Order;

/**
 * Servlet implementation class ajaxUpdateOrderController
 */
@WebServlet("/orderUpdateAjax.admin")
public class ajaxUpdateOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ajaxUpdateOrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int orderNo = Integer.parseInt(request.getParameter("orderNo"));

		
		int result = new OrderService().updateOrder(orderNo);
		
		Order o = new OrderService().selectOrderByOrderNo(orderNo);
			
		response.setContentType("text/html charset=UTF-8");
			
		response.getWriter().print(o);
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
