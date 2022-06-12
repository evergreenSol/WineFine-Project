package com.winefine.board.model.vo;

import java.sql.Date;

public class Brattachment {

	// 필드부
	private int brfileNo; // FILE_NO NUMBER PRIMARY KEY,
	private int brrefNo; // REF_BNO NUMBER NOT NULL,
	private String broriginName; // ORIGIN_NAME VARCHAR2(255) NOT NULL,
	private String brchangeName; // CHANGE_NAME VARCHAR2(255) NOT NULL,
	private String brfilePath; // FILE_PATH VARCHAR2(1000),
	private Date bruploadDate; // UPLOAD_DATE DATE DEFAULT SYSDATE NOT NULL,
	private int brfileLevel; // FILE_LEVEL NUMBER,
	private String brstatus; // STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
	
	public Brattachment() {
		super();
	}

	public Brattachment(int brfileNo, int brrefNo, String broriginName, String brchangeName, String brfilePath,
			Date bruploadDate, int brfileLevel, String brstatus) {
		super();
		this.brfileNo = brfileNo;
		this.brrefNo = brrefNo;
		this.broriginName = broriginName;
		this.brchangeName = brchangeName;
		this.brfilePath = brfilePath;
		this.bruploadDate = bruploadDate;
		this.brfileLevel = brfileLevel;
		this.brstatus = brstatus;
	}

	public int getBrfileNo() {
		return brfileNo;
	}

	public void setBrfileNo(int brfileNo) {
		this.brfileNo = brfileNo;
	}

	public int getBrrefNo() {
		return brrefNo;
	}

	public void setBrrefNo(int brrefNo) {
		this.brrefNo = brrefNo;
	}

	public String getBroriginName() {
		return broriginName;
	}

	public void setBroriginName(String broriginName) {
		this.broriginName = broriginName;
	}

	public String getBrchangeName() {
		return brchangeName;
	}

	public void setBrchangeName(String brchangeName) {
		this.brchangeName = brchangeName;
	}

	public String getBrfilePath() {
		return brfilePath;
	}

	public void setBrfilePath(String brfilePath) {
		this.brfilePath = brfilePath;
	}

	public Date getBruploadDate() {
		return bruploadDate;
	}

	public void setBruploadDate(Date bruploadDate) {
		this.bruploadDate = bruploadDate;
	}

	public int getBrfileLevel() {
		return brfileLevel;
	}

	public void setBrfileLevel(int brfileLevel) {
		this.brfileLevel = brfileLevel;
	}

	public String getBrstatus() {
		return brstatus;
	}

	public void setBrstatus(String brstatus) {
		this.brstatus = brstatus;
	}

	@Override
	public String toString() {
		return "Brattachment [brfileNo=" + brfileNo + ", brrefNo=" + brrefNo + ", broriginName=" + broriginName
				+ ", brchangeName=" + brchangeName + ", brfilePath=" + brfilePath + ", bruploadDate=" + bruploadDate
				+ ", brfileLevel=" + brfileLevel + ", brstatus=" + brstatus + "]";
	}
	
	
	
	}