package com.winefine.store.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.winefine.common.model.vo.PageNation;
import com.winefine.store.model.service.ProductService;
import com.winefine.store.model.service.ReviewService;
import com.winefine.store.model.vo.Product;
import com.winefine.store.model.vo.Review;

/**
 * Servlet implementation class StoreProductController
 */
@WebServlet("/store.pr")
public class StoreProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreProductController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		int productNo = Integer.parseInt(request.getParameter("pno"));
		
		Product p = new ProductService().selectOneProduct(productNo);

		request.setAttribute("p", p);
		
		
		request.getRequestDispatcher("views/store/storeProduct.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
