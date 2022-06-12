package com.winefine.cart.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.winefine.cart.model.service.CartService;
import com.winefine.cart.model.vo.Cart;
import com.winefine.member.model.vo.Member;

/**
 * Servlet implementation class CartListController
 */
@WebServlet("/list.ca")
public class CartListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 우리가 원하는거 : 응답페이지에 DB 로부터 조회한 내용을 찍어내는것
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		// System.out.println(userNo);
		// 요청 시 전달값이 없기 때문에 1, 2 번 단계는 건너뜀
		// => href 속성값에 쿼리스트링이 없음!!
		
		// 3) NoticeService 클래스의 어떤 메소드를 호출해서 결과값을 받기
		ArrayList<Cart> list = new CartService().selectCartList(userNo);
		
		// 4) 결과값에 따라 응답화면 지정
		//System.out.println(list);
		request.setAttribute("cartList", list);
		
		// 응답페이지 : 장바구니 리스트 페이지 (myPage_viewCart.jsp)
		request.getRequestDispatcher("views/cart/myPage_viewCart.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
