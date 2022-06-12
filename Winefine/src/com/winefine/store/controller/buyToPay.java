package com.winefine.store.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.winefine.member.model.vo.Member;

/**
 * Servlet implementation class payToBuy
 */
@WebServlet("/buyToPay.st")
public class buyToPay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public buyToPay() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String pickup = request.getParameter("pickup"); // 수령인
		String locationCode = request.getParameter("locationCode"); // 수령장소
		String pickupDate = request.getParameter("pickupDate"); // 수령일자 [[[Date -> String??]]]
		String paymentCode = request.getParameter("paymentCode"); // 결제방법
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice")); // 총결제금액
		
		request.setAttribute("pickup", pickup);
		request.setAttribute("locationCode", locationCode);
		request.setAttribute("pickupDate", pickupDate);
		request.setAttribute("paymentCode", paymentCode);
		request.setAttribute("totalPrice", totalPrice);
		
		//System.out.println(orderUser);
		//System.out.println(locationName);
		//System.out.println(orderDate);
		//System.out.println(payment);
		//System.out.println(totalPrice);
		
		if(paymentCode.equals("1")) {
			// 카카오페이 선택시 pay.jsp (buyToPay.st)
			request.getRequestDispatcher("views/store/pay.jsp").forward(request, response);
		} else {
			// 현장결제 선택시 (myPage.me)
			request.getRequestDispatcher("/insertOrder.me?pickup=<%= pickup %>&pickupDate=<%= pickupDate %>&locationCode=<%= locationCode %>&paymentCode=<%= paymentCode %>").forward(request, response);
		}
		//request.getRequestDispatcher("views/store/pay.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
