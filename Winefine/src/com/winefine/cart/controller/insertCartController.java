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
 * Servlet implementation class insertCart
 */
@WebServlet("/insertList.ca")
public class insertCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertCartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("잘 실행되나?");
		
		// 1) 인코딩 셋팅 (Post 방식일 경우에만)
		request.setCharacterEncoding("UTF-8");
		
		// 2) 요청 시 전달값 뽑아서 변수에 기록 및 VO 객체로 가공
		// 제목, 내용, 작성자 회원번호
		String productNo = request.getParameter("productNo");
//		int userNo = Integer.parseInt(request.getParameter("userNo")); 
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		int price = Integer.parseInt(request.getParameter("price"));
		int bottle = Integer.parseInt(request.getParameter("bottle"));
		//int cartNo = Integer.parseInt(request.getParameter("cartNo"));
				
//		System.out.println(productNo);
//		System.out.println(userNo);
//		System.out.println(price);
//		System.out.println(bottle);
		
		Cart c = new Cart();
		//c.setCartNo(cartNo);
		c.setProductNo(productNo);
		c.setUserNo(userNo);
		c.setPrice(price);
		c.setBottle(bottle);
		
		request.setAttribute("c", c);
		
		// 3) NoticeService 의 어떤 메소드를 호출해서 결과 받기
		int result = new CartService().insertCart(c);
//		System.out.println("컨트롤러 : " + result);
		// 4) 결과에 따라 응답페이지 지정
		if(result > 0) { // 성공 
			
			// 장바구니페이지로 바로연결됨... 중간다리역할이 필요한데 모르겠음
			// 중간다리 역할로 장바구니 모달이 페이지로 되야할거같음 => insert.ca
			// 장바구니 리스트를 보여주는 페이지 => list.ca
//			System.out.println("인서트성공");
			request.getRequestDispatcher("/list.ca").forward(request, response);
			//모달창을 띄울수 있을까?
			// 
			
		}
		else { // 실패 => 에러페이지로 포워딩
			
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
