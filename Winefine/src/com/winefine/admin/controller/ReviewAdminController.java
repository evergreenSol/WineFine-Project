package com.winefine.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.winefine.common.model.vo.PageNation;
import com.winefine.store.model.service.ReviewService;
import com.winefine.store.model.vo.Review;


/**
 * Servlet implementation class ReviewListController
 */
@WebServlet("/review.admin")
public class ReviewAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewAdminController() {
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
		
		ArrayList<Review> reviewList= new ReviewService().selectListAll(pn);

		request.setAttribute("reviewList", reviewList);
		request.setAttribute("pn", pn);
		request.getRequestDispatcher("views/admin/reviewAdminList.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
