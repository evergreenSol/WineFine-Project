package com.winefine.board.model.vo;

import java.sql.Date;

public class Board {

	// 필드부

	// String 로 선언된 boardWriter 전부 int로 바꿨음

	private int boardNo; // BOARD_NO NUMBER PRIMARY KEY, -- 글번호
	  private String boardWriter; // BOARD_WRITER NUMBER NOT NULL, -- 회원번호
//	private int boardWriter;
	private String boardTitle; // BOARD_TITLE VARCHAR2(200) NOT NULL, -- 제목
	private String boardContent; // BOARD_CONTENT VARCHAR2(4000) NOT NULL, -- 내용
	private String boardFile; // BOARD_FILE VARCHAR2(4000), -- 첨부파일
	private Date createDate; // CREATE_DATE DATE DEFAULT SYSDATE, -- 등록일
	private String status; // STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y','N')), -- 상태값
	private String boardType; // BOARD_TYPE VARCHAR2(16) NOT NULL, -- 게시판 타입

	private String titleImg; // 썸네일 경로
	
	// 생성자부
	public Board() {
		super();
	}

	public Board(int boardNo, String boardWriter, String boardTitle, String boardContent, String boardFile,
			Date createDate, String status, String boardType) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardFile = boardFile;
		this.createDate = createDate;
		this.status = status;
		this.boardType = boardType;
	}

	 //board 조회
	    public Board(int boardNo, String boardWriter, String boardTitle, Date createDate, String boardType) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.createDate = createDate;
		this.boardType = boardType;
	}

//	public Board(int boardNo, int boardWriter, String boardTitle, Date createDate, String boardType) {
//		super();
//		this.boardNo = boardNo;
//		this.boardWriter = boardWriter;
//		this.boardTitle = boardTitle;
//		this.createDate = createDate;
//		this.boardType = boardType;
//	}

	// 메소드부
	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardFile() {
		return boardFile;
	}

	public void setBoardFile(String boardFile) {
		this.boardFile = boardFile;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	
	//---------- 썸네일 경로 포함한수정명 추가
	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardWriter=" + boardWriter + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", boardFile=" + boardFile + ", createDate=" + createDate
				+ ", status=" + status + ", boardType=" + boardType + "]";
	}

}
