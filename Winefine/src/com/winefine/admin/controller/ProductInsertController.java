package com.winefine.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.winefine.common.MyFileRenamePolicy;
import com.winefine.store.model.service.ProductService;
import com.winefine.store.model.vo.Product;

/**
 * Servlet implementation class ProductInsertController
 */
@WebServlet("/insertProduct.admin")
public class ProductInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/product_upfiles/");
			
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			Product p = new Product();
			
			p.setProductType(multiRequest.getParameter("productType"));
			p.setProductName(multiRequest.getParameter("productName"));
			p.setPrice(Integer.parseInt(multiRequest.getParameter("price")));	
			p.setBrand(multiRequest.getParameter("brand"));
			p.setAlcohol(Float.parseFloat(multiRequest.getParameter("alcohol")));
			p.setStock(Integer.parseInt(multiRequest.getParameter("stock")));
			p.setOrigin(multiRequest.getParameter("origin"));
			p.setSweetness(Integer.parseInt(multiRequest.getParameter("sweetness")));
			p.setAcidity(Integer.parseInt(multiRequest.getParameter("acidity")));
			p.setBody(Integer.parseInt(multiRequest.getParameter("body")));
			p.setTannin(Integer.parseInt(multiRequest.getParameter("tannin")));
			p.setStatus(multiRequest.getParameter("status"));
//			p.setThumbnail(multiRequest.getFilesystemName("thumbnail"));
			p.setThumbnail(request.getContextPath() + "/resources/product_upfiles/" + multiRequest.getFilesystemName("thumbnail"));
			p.setContentPhoto1(request.getContextPath() + "/resources/product_upfiles/" + multiRequest.getFilesystemName("contentPhoto1"));
			p.setContentPhoto2(request.getContextPath() + "/resources/product_upfiles/" + multiRequest.getFilesystemName("contentPhoto2"));
			p.setContent(multiRequest.getParameter("content"));
			
			
			int result = new ProductService().insertProduct(p);
			
			
			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/productView.admin?currentPage=1");
			}
			else {
				response.sendRedirect(request.getContextPath());
			}
			
			
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
