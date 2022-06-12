package com.winefine.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.winefine.member.model.vo.Member;
import com.winefine.store.model.service.ReviewService;
import com.winefine.store.model.vo.Review;

/**
 * Servlet implementation class MyPageReviewController
 */
@WebServlet("/review.me")
public class MyPageReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageReviewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		ArrayList<Review> list = new ReviewService().selectReviewList(userNo);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/member/myPage_viewReview.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
