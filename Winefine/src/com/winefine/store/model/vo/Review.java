package com.winefine.store.model.vo;

import java.sql.Date;

public class Review {

	//필드부
    private int reviewNo; //REVIEW_NO NUMBER PRIMARY KEY, 후기번호
    private String productNo; // PROCUNT_NO NUMBER 상품번호
    private int orderNo; //ORDER_NO NUMBER NOT NULL, 주문번호
    private String reviewWriter; // REVIEW_WRITER NUMBER 후기작성자
    private String reviewTitle; //REVIEW_TITLE VARCHAR2(30) NOT NULL, 후기제목
    private String reviewContent; //REVIEW_CONTENT VARCHAR2(1000) NOT NULL, 후기내용
    private Date createDate; //CREATE_DATE DATE DEFAULT SYSDATE NOT NULL, 작성일자
    private int count; //COUNT NUMBER DEFAULT 0, 조회수
    private String status; //STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')), 상태
    private String reviewPhoto; //REVIEW_PHOTO VARCHAR2(100), 후기사진
    private String answer; //ANSWER VARCHAR2(500), 답변
    private Date answerDate; //ANSWER_DATE DATE 답변일자
    private String answerYn; //ANSWER_YN 답변여부
	

    //생성자부 
    // - 기본생성자
    public Review() {
		super();
	}
    // - 모든 변수에 대해 매개변수로 가지는 생성자
	public Review(int reviewNo, String productNo, int orderNo, String reviewWriter, String reviewTitle, String reviewContent, Date createDate, int count,
			String status, String reviewPhoto, String answer, Date answerDate, String answerYn) {
		super();
		this.reviewNo = reviewNo;
		this.productNo = productNo;
		this.orderNo = orderNo;
		this.reviewWriter = reviewWriter;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.createDate = createDate;
		this.count = count;
		this.status = status;
		this.reviewPhoto = reviewPhoto;
		this.answer = answer;
		this.answerDate = answerDate;
		this.answerYn = answerYn;
	}
	
	// - 후기리스트용 생성자
	public Review(int reviewNo, String reviewTitle, Date createDate, String reviewWriter, int count, String reviewPhoto, String reviewContent, String answer, Date answerDate) {
		super();
		this.reviewNo = reviewNo;
		this.reviewTitle = reviewTitle;
		this.createDate = createDate;
		this.reviewWriter = reviewWriter;
		this.count = count;
		this.reviewPhoto = reviewPhoto;
		this.reviewContent = reviewContent;
		this.answer = answer;
		this.answerDate = answerDate;
	}
	
	public Review(int reviewNo, String productNo, String reviewTitle, Date createDate, String reviewWriter, int count, String reviewPhoto, String reviewContent, String answer, Date answerDate) {
		super();
		this.reviewNo = reviewNo;
		this.productNo = productNo;
		this.reviewTitle = reviewTitle;
		this.createDate = createDate;
		this.reviewWriter = reviewWriter;
		this.count = count;
		this.reviewPhoto = reviewPhoto;
		this.reviewContent = reviewContent;
		this.answer = answer;
		this.answerDate = answerDate;
	}


	//메소드부
	// - getter() & setter() 메소드
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getProductNo() {
		return productNo;
	}
	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getReviewWriter() {
		return reviewWriter;
	}
	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getReviewPhoto() {
		return reviewPhoto;
	}
	public void setReviewPhoto(String reviewPhoto) {
		this.reviewPhoto = reviewPhoto;
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
	public String getAnswerYn() {
		return answerYn;
	}
	public void setAnswerYn(String answerYn) {
		this.answerYn = answerYn;
	}
	
	// - toString()메소드
	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", productNo=" + productNo + ", orderNo=" + orderNo + ", reviewWriter="
				+ reviewWriter + ", reviewTitle=" + reviewTitle + ", reviewContent=" + reviewContent + ", createDate="
				+ createDate + ", count=" + count + ", status=" + status + ", reviewPhoto=" + reviewPhoto + ", answer="
				+ answer + ", answerDate=" + answerDate + ", answerYn=" + answerYn + "]";

	}
	

    
}
