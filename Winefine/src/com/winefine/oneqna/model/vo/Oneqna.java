package com.winefine.oneqna.model.vo;

import java.sql.Date;

public class Oneqna {
	
	private int oneqnaNo;// ONE_QNA_NO NUMBER PRIMARY KEY,
	private String categoryNo;// CATEGORY_NO NUMBER,
    private String oneqnaWriter;// ONE_QNA_WRITER NUMBER NOT NULL,
    private String oneqnaTitle;// ONE_QNA_TITLE VARCHAR2(100) NOT NULL,
    private String oneqnaContent;// ONE_QNA_CONTENT VARCHAR2(4000) NOT NULL,
    private Date createDate;// CREATE_DATE DATE DEFAULT SYSDATE,
    private String phone; //
    private String answer;// ANSWER VARCHAR2(500),
    private Date answerDate;// ANSWER_DATE DATE DEFAULT SYSDATE,
    private String answerYn;//ANSWER_YN VARCHAR2(1) DEFAULT 'N' CHECK (ANSWER_YN IN('Y', 'N')),
    private String status; // STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
    
    
    public Oneqna() {
    	super();
    }


	public Oneqna(int oneqnaNo, String categoryNo, String oneqnaWriter, String oneqnaTitle, String oneqnaContent,
			Date createDate, String phone, String answer, Date answerDate, String answerYn, String status) {
		super();
		this.oneqnaNo = oneqnaNo;
		this.categoryNo = categoryNo;
		this.oneqnaWriter = oneqnaWriter;
		this.oneqnaTitle = oneqnaTitle;
		this.oneqnaContent = oneqnaContent;
		this.createDate = createDate;
		this.phone = phone;
		this.answer = answer;
		this.answerDate = answerDate;
		this.answerYn = answerYn;
		this.status = status;
	}


	public int getOneqnaNo() {
		return oneqnaNo;
	}


	public void setOneqnaNo(int oneqnaNo) {
		this.oneqnaNo = oneqnaNo;
	}


	public String getCategoryNo() {
		return categoryNo;
	}


	public void setCategoryNo(String categoryNo) {
		this.categoryNo = categoryNo;
	}


	public String getOneqnaWriter() {
		return oneqnaWriter;
	}


	public void setOneqnaWriter(String oneqnaWriter) {
		this.oneqnaWriter = oneqnaWriter;
	}


	public String getOneqnaTitle() {
		return oneqnaTitle;
	}


	public void setOneqnaTitle(String oneqnaTitle) {
		this.oneqnaTitle = oneqnaTitle;
	}


	public String getOneqnaContent() {
		return oneqnaContent;
	}


	public void setOneqnaContent(String oneqnaContent) {
		this.oneqnaContent = oneqnaContent;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
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


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Oneqna [oneqnaNo=" + oneqnaNo + ", categoryNo=" + categoryNo + ", oneqnaWriter=" + oneqnaWriter
				+ ", oneqnaTitle=" + oneqnaTitle + ", oneqnaContent=" + oneqnaContent + ", createDate=" + createDate
				+ ", phone=" + phone + ", answer=" + answer + ", answerDate=" + answerDate + ", answerYn=" + answerYn
				+ ", status=" + status + "]";
	}
    
    
		
}
	
    
    