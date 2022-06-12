package com.winefine.board.controller;

import java.io.IOException;
import java.util.ArrayList;

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
// 사용자 계시판 파일 작성 
/**
 * Servlet implementation class ThumbnailInserController
 */
@WebServlet("/insert.th")
public class ThumbnailInserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThumbnailInserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		// muitipart/form-data 로 전송 되었는지 부터 검사
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			
			// 파일 저장경로 지정 (resources 폴더의 thumbnail_upfiles 폴더)
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles/");
			
			// 전달된 파일명을 수정 후 서버에 업로드
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 요청 시 전달값 뽑기 (글제목, 글내용, 대표이미지, 상세이미지1,2) 작성자 정보.. ?
			// Board 테이블에 Insert 할 데이터 
			Board b = new Board();
			b.setBoardWriter(multiRequest.getParameter("userNo"));
			b.setBoardTitle(multiRequest.getParameter("title"));
			b.setBoardContent(multiRequest.getParameter("content"));
			b.setBoardType(multiRequest.getParameter("boardtype"));

			
			//Attachment 테이블에 Insert 할 데이터
			ArrayList<Brattachment> list = new ArrayList<>();
			
			for(int i = 1; i <= 4; i++) {
				
				String key = "file" + i;
				
				// 첨부파일 존재 확인
				if(multiRequest.getOriginalFileName(key) != null) {
					
					//Attachment 객체 생성
					// => 원본명, 수정명, 저장경로, 파일레벨 필드 가공
					Brattachment at = new Brattachment();
					
					at.setBroriginName(multiRequest.getOriginalFileName(key));
					at.setBrchangeName(multiRequest.getFilesystemName(key));
					at.setBrfilePath("resources/board_upfiles/");
					
					if(i == 1) { 
						at.setBrfileLevel(1);
					}					
					else { 
						at.setBrfileLevel(2);
					}
					list.add(at);

				}
					
			}

		
			int result = new BoardService().insertThumbnailBoard(b, list);
			
			if(result > 0) {//성공 공 => list.th 요청
				
				request.getSession().setAttribute("alertMsg", "성공적으로 업로드 되었습니다.");
				response.sendRedirect(request.getContextPath() + "/list.bo?currentPage=1");
				
			}
			else {//실패
				
				request.setAttribute("errorMag", "사진게시판 업로드 실패");
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
