package com.winefine.store.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.winefine.store.model.service.ProductService;
import com.winefine.store.model.vo.Product;

/**
 * Servlet implementation class StoreController
 */
@WebServlet("/store.th")
public class StoreListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreListController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String searchWord = "";
		
		if(request.getParameter("searchWord") != null) {
			searchWord = request.getParameter("searchWord");
			
			ArrayList<Product> list = new ProductService().selectProduct(searchWord);
			
			request.setAttribute("list",list);
			
			request.getRequestDispatcher("views/store/storeThumbnailList.jsp").forward(request,response);

		}
		else {
			
			ArrayList<Product> list = new ProductService().selectProduct();
			
			request.setAttribute("list",list);
			
			request.getRequestDispatcher("views/store/storeThumbnailList.jsp").forward(request,response);
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
