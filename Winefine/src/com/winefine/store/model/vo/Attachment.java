package com.winefine.store.model.vo;

import java.sql.Date;

public class Attachment {

	// 필드부 
	private int fileNo; //파일번호
	private int refNo; //참조게시글번호
	private String originName; //원본파일명
	private String changeName; //수정파일명
	private String filePath; //파일경로
	private Date uploadDate; //업로드날짜
	private int fileLevel; //사진게시판 썸네일구분용
	private String status; //상태값(삭제유무)
	
	//생성자부
	public Attachment() {
		super();
	}
	public Attachment(int fileNo, int refNo, String originName, String changeName, String filePath, Date uploadDate,
			int fileLevel, String status) {
		super();
		this.fileNo = fileNo;
		this.refNo = refNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
		this.status = status;
	}
	
	//메소드부
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public int getRefNo() {
		return refNo;
	}
	public void setRefNo(int refNo) {
		this.refNo = refNo;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getChangeName() {
		return changeName;
	}
	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public Date getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}
	public int getFileLevel() {
		return fileLevel;
	}
	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", refNo=" + refNo + ", originName=" + originName + ", changeName="
				+ changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", fileLevel=" + fileLevel
				+ ", status=" + status + "]";
	}
	
	
}
