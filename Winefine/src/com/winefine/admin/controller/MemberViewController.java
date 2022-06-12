package com.winefine.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.winefine.common.model.vo.PageInfo;
import com.winefine.member.model.service.MemberService;
import com.winefine.member.model.vo.Member;

/**
 * Servlet implementation class MemberViewController
 */
@WebServlet("/memList.me")
public class MemberViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// ----- 페이징 처리 -----
		// 기본적으로 구해야 하는 변수들
		int listCount; // 현재 총 게시글 개수
		int currentPage; //현재 보여질 페이지(즉, 사용자가 요청한 페이지)
		int pageLimit; // 페이지 하단에 보여질 페이징 바의 페이지 최대 개수
		int boardLimit; //한 페이지에 보여질 게시글의 최대 개수(한 페이지당 게시글 몇 개 씩 보여줄건지)
				
		// 위의 변수들을 이용해서 계산해서 구해야 하는 변수들
		int maxPage; // 가장 마지막 페이지가 몇 번 페이지인지 알려줌(총 페이지 수)
		int startPage; // 페이지 하단에 보여질 페이징 바의 시작 수
		int endPage; // 페이지 하단에 보여질 페이징 바의 끝 수
		
		// * listCount : 현재 총 게시글 개수(단 STATUS 값이 'Y'일 경우만)
		listCount = new MemberService().selectMemberListCount(); //총 회원 수(조건: STATUS='Y')
		currentPage = Integer.parseInt(request.getParameter("currentPage")); //관리자가 요청한 페이지
		pageLimit =5; //페이징 바의 페이지 최대 개수
		boardLimit=10; //한 페이지에 보일 회원 수
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit +1;
		endPage = startPage + pageLimit -1;
		
		if(endPage > maxPage) {
			
			endPage = maxPage;
		}
		
		// 위의 페이지 정보들을 페이지 vo 클래스에 객체로 담기
		
		//1. 페이징 바를 만들 때 필요한 객체 세팅
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		//2. 현재 사용자가 요청한 페이지에 보여질 회원 리스트 요청하기
		ArrayList<Member> list = new MemberService().selectMemberList(pi);
		
		//3. 반환된 값들을 포워딩
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
		
		// 리스트 화면 포워딩 
		request.getRequestDispatcher("/views/admin/memberListView.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
