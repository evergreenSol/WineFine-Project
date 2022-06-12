package com.winefine.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.winefine.common.model.vo.PageNation;
import com.winefine.store.model.service.ReviewService;
import com.winefine.store.model.vo.Review;

/**
 * Servlet implementation class reviewAdminDateController
 */
@WebServlet("/review.admin_date")
public class reviewAdminDateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reviewAdminDateController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 페이징처리 변수 설정
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = new ReviewService().selectListCount();
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		pageLimit = 5;
		boardLimit = 10;
		maxPage = (int)Math.ceil((double)listCount / boardLimit); 
		startPage = ((currentPage-1) / pageLimit) * pageLimit + 1;
		endPage = startPage + pageLimit - 1 ;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}

		PageNation pn = new PageNation(listCount, currentPage, pageLimit, boardLimit, 
										maxPage, startPage, endPage);
		

		// 후기리스트 기간별로 뽑아오기
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		
		ArrayList<Review> reviewListDate= new ReviewService().reviewListDate(startDate, endDate, pn);
		
		
		
		// response.setContentType("application/json; charset=UTF8"
		response.setContentType("application/json; charset=UTF8");

		new Gson().toJson(reviewListDate, response.getWriter());
		

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
