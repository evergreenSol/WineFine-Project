package com.winefine.store.model.vo;

import java.sql.Date;

public class Qna {

	//필드부
	private int qnaNo;  // QNA_NO NUMBER PRIMARY KEY, 상품문의번호
	private int productNo; // PRODUCT_NO NUMBER NOT NULL, 상품번호
			/* ▽ NUMBER타입이지만 작성자의 아이디로 가져올것이므로*/
	private String qnaWriter; // QNA_WRITER NUMBER NOT NULL, 상품문의작성자
	private String qnaTitle; // QNA_TITLE VARCHAR2(30) NOT NULL, 상품문의제목
	private String qnaContent; 	// QNA_CONTENT VARCHAR2(1000) NOT NULL, 상품문의내용
	private Date createDate; // CREATE_DATE DATE DEFAULT SYSDATE NOT NULL, 작성일자
	private int count;	// COUNT NUMBER DEFAULT 0, 조회수
	private String qnaOpen;	 // QNA_OPEN VARCHAR2(10) DEFAULT '공개' CHECK (QNA_OPEN IN('공개', '비공개')), 공개여부
			/*     ▽ Yn임 주의 !*/
	private String answerYn; // ANSWER_YN VARCHAR2(1) DEFAULT 'N' CHECK (ANSWER_YN IN('Y', 'N')), 답변여부
	private String status; // STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')), 상태
	private String qnaPhoto; // QNA_PHOTO VARCHAR2(100), 상품문의사진
	private String answer;	 // ANSWER VARCHAR2(500), 답변
	private Date answerDate; // ANSWER_DATE DATE DEFAULT SYSDATE, 답변일자

	//생성자부
	// - 기본생성자
	public Qna() {
		super();
	}
	// - 모든 변수에 대해 매개변수로 가지는 생성자
	public Qna(int qnaNo, int productNo, String qnaWriter, String qnaTitle, String qnaContent, Date createDate, int count,
			String qnaOpen, String answerYn, String status, String qnaPhoto, String answer, Date answerDate) {
		super();
		this.qnaNo = qnaNo;
		this.productNo = productNo;
		this.qnaWriter = qnaWriter;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.createDate = createDate;
		this.count = count;
		this.qnaOpen = qnaOpen;
		this.answerYn = answerYn;
		this.status = status;
		this.qnaPhoto = qnaPhoto;
		this.answer = answer;
		this.answerDate = answerDate;
	}
	// - 후기리스트용 생성자
	public Qna(int qnaNo, String qnaOpen, String qnaTitle, Date createDate, String qnaWriter, int count,
			String qnaContent, String qnaPhoto, String answer, Date answerDate, String answerYn) {
		super();
		this.qnaNo = qnaNo;
		this.qnaOpen = qnaOpen;
		this.qnaTitle = qnaTitle;
		this.createDate = createDate;
		this.qnaWriter = qnaWriter;
		this.count = count;
		this.qnaContent = qnaContent;
		this.qnaPhoto = qnaPhoto;
		this.answer = answer;
		this.answerYn = answerYn;
	}
	
	public Qna(int qnaNo, int productNo, String qnaOpen, String qnaTitle, Date createDate, String qnaWriter, int count,
			String qnaContent, String qnaPhoto, String answer, Date answerDate, String answerYn) {
		super();
		this.qnaNo = qnaNo;
		this.productNo = productNo;
		this.qnaOpen = qnaOpen;
		this.qnaTitle = qnaTitle;
		this.createDate = createDate;
		this.qnaWriter = qnaWriter;
		this.count = count;
		this.qnaContent = qnaContent;
		this.qnaPhoto = qnaPhoto;
		this.answer = answer;
		this.answerYn = answerYn;
	}
	
	//메소드부
	//-getter() & setter()
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getQnaWriter() {
		return qnaWriter;
	}
	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getQnaOpen() {
		return qnaOpen;
	}
	public void setQnaOpen(String qnaOpen) {
		this.qnaOpen = qnaOpen;
	}
	public String getAnswerYn() {
		return answerYn;
	}
	public void setAnswerYn(String answerYn) {
		this.answerYn = answerYn;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getQnaPhoto() {
		return qnaPhoto;
	}
	public void setQnaPhoto(String qnaPhoto) {
		this.qnaPhoto = qnaPhoto;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Date getAnswerDate() {
		return answerDate;
	}
	public void setAnswerDate(Date answerDate) {
		this.answerDate = answerDate;
	}
	// - toString()
	@Override
	public String toString() {
		return "Qna [qnaNo=" + qnaNo + ", productNo=" + productNo + ", qnaWriter=" + qnaWriter + ", qnaTitle="
				+ qnaTitle + ", qnaContent=" + qnaContent + ", createDate=" + createDate + ", count=" + count
				+ ", qnaOpen=" + qnaOpen + ", answerYn=" + answerYn + ", status=" + status + ", qnaPhoto=" + qnaPhoto
				+ ", answer=" + answer + ", answerDate=" + answerDate + "]";
	}
	
	
	

	
}

