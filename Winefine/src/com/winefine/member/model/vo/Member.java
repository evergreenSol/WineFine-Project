package com.winefine.member.model.vo;

import java.util.Date;

public class Member {

	//필드부
	
	private int userNo; //USER_NO NUMBER PRIMARY KEY,
    private String userId; //USER_ID VARCHAR2(15) UNIQUE NOT NULL,
    private String userPwd; //USER_PWD VARCHAR2(16) NOT NULL,
    private String userName; //USER_NAME VARCHAR2(30) NOT NULL,
    private String phone;//PHONE CHAR(13) NOT NULL,
    private String email; //EMAIL VARCHAR2(30) NOT NULL,
    private Date enrollDate; //ENROLL_DATE DATE DEFAULT SYSDATE,
    private String userSsn; //USER_SSN VARCHAR2(14) UNIQUE NOT NULL,
    private String blacklist; //BLACKLIST VARCHAR2(1) DEFAULT 'N' CHECK (BLACKLIST IN('Y','N')),
    private String status; //STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y','N'))
	
    //생성자부
    public Member() {
		super();
	}

	public Member(int userNo, String userId, String userPwd, String userName, String phone, String email,
			Date enrollDate, String userSsn, String blacklist, String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.phone = phone;
		this.email = email;
		this.enrollDate = enrollDate;
		this.userSsn = userSsn;
		this.blacklist = blacklist;
		this.status = status;
	}
	
	//회원 가입 시 필요한 생성자
	//입력받은 정보: 아이디, 비밀번호, 이름, 주민등록번호, 이메일, 핸드폰번호
	public Member(String userId, String userPwd, String userName, String phone, String email, String userSsn) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.phone = phone;
		this.email = email;
		this.userSsn = userSsn;
	}

	//메소드부
	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getUserSsn() {
		return userSsn;
	}

	public void setUserSsn(String userSsn) {
		this.userSsn = userSsn;
	}

	public String getBlacklist() {
		return blacklist;
	}

	public void setBlacklist(String blacklist) {
		this.blacklist = blacklist;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", phone=" + phone + ", email=" + email + ", enrollDate=" + enrollDate + ", userSsn=" + userSsn
				+ ", blacklist=" + blacklist + ", status=" + status + "]";
	}
	
	
}
