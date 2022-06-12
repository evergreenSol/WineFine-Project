package com.winefine.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.winefine.board.model.service.BoardService;
import com.winefine.board.model.vo.Board;
import com.winefine.board.model.vo.Brattachment;
import com.winefine.common.MyFileRenamePolicy;

/**
 * Servlet implementation class BoardUpdateController
 */
@WebServlet("/update.bo")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       // 사용자 게시판 수정게시판2
    	
	    	// post 방식 인코딩
	    	request.setCharacterEncoding("UTF-8");
	    	
	    	// enctype 이 multipart/form-date 로 잘 전송이 되었나 검사
	    	if(ServletFileUpload.isMultipartContent(request)) {
	    		
	    		// 1. 파일 용량 지정경로
	    		int maxSize = 10 * 1024 * 1024;
	    		
	    		//2. 전달된 파일의 저장경로
	    		String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles/");
	    		
	    		// 3. 전달된 파일명을 수정
	    		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize,"UTF-8", new MyFileRenamePolicy());
	    		
	    		// 여기까지 서버에 저장된 시점
	    		
	    		// 4. SQL 문을 실행할때 필요한 요청 시 전달값들을 뽑아서 변수에 기록 및 VO 객체로 가공
	    		// - 공통 : Board 테이블
	    		int boardNo = Integer.parseInt(multiRequest.getParameter("bno"));
				String boardTitle = multiRequest.getParameter("title");
				String boardContent = multiRequest.getParameter("content");
				
				Board b = new Board();
				b.setBoardNo(boardNo);
				b.setBoardTitle(boardTitle);
				b.setBoardContent(boardContent);
				
				// - 옵션으로 수행 : 새로이 전달된 첨부파일이 있을 경우 필요한 값 뽑기 
				// 				 Attachment 테이블에 Update 또는 Insert
				Brattachment at = null;
				
			
				
				
				// 우선적으로 전달된 첨부파일이 있는지 검사
				// 전달된 원본파일명이 있는지
				if(multiRequest.getOriginalFileName("reUpfile") != null) {
					
					// Attachment 관련한 쿼리문들 중에서 공통적으로 필요한 값들만 우선적으로 가공
					// 원본명, 수정명, 저장경로
					at = new Brattachment();
					at.setBroriginName(multiRequest.getOriginalFileName("reUpfile"));
					at.setBrchangeName(multiRequest.getFilesystemName("reUpfile"));
					at.setBrfilePath("resources/board_upfiles/");
					
					// 수정 전에 해당 글에 원래 첨부파일이 있었나..?
					// 만약 원래 첨부파일이 있었다면
					// 원래 파일의 파일번호, 수정명을 넘겨줬었음
					if(multiRequest.getParameter("originFileNo") != null) { // 원래 파일이 있었다면
						
						// CASE1. Attachment 테이블 Update 
						// 필요한 필드값만 셋팅

						
						at.setBrfileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
						
						// 기존의 첨부파일 삭제
					}
					else { // 원래 파일이 없었다면
						
						// CASE2. Attachment 테이블 Insert
						// 필요한 필드값만 셋팅
						at.setBrrefNo(boardNo);
					}
				}
				
				// 모두 한개의 트랜잭션으로 처리하기 위해 이 지점에서 Service 로 요청
				int result = new BoardService().updateBoard(b, at);
				
				// 결과에 따른 응답화면 지정
				if(result > 0) { // 성공 => 해당 글의 상세보기페이지로 (detail.bo?bno=x)
					
					request.getSession().setAttribute("alertMsg", "성공적으로 수정되었습니다.");
					response.sendRedirect(request.getContextPath() + "/formdetail.bo?bno=" + boardNo);
				}
				else { // 실패 => 에러페이    지
					
					request.setAttribute("errorMsg", "게시글 수정 실패");
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
