package com.winefine.event.model.vo;

import java.sql.Date;

public class Event {
	
	private int eventNo;// EVENT_NO NUMBER PRIMARY KEY,
    private String eventTitle;// EVENT_TITLE VARCHAR2(100) NOT NULL,
    private String eventWriter;// EVENT_WRITER NUMBER NOT NULL,
    private int count;// COUNT NUMBER DEFAULT 0,
    private String thumbnail;// THUMBNAIL VARCHAR2(100) NOT NULL,
    private String contentPhoto;// CONTENT_PHOTO VARCHAR2(100),
    private Date createDate;// CREATE_DATE DATE DEFAULT SYSDATE,
    private String startDate;// START_DATE DATE,
    private String endDate;// END_DATE DATE,
    private String status;// STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
	
    public Event() {
		super();
	}

	public Event(int eventNo, String eventTitle, String eventWriter, int count, String thumbnail, String contentPhoto,
			Date createDate, String startDate, String endDate, String status) {
		super();
		this.eventNo = eventNo;
		this.eventTitle = eventTitle;
		this.eventWriter = eventWriter;
		this.count = count;
		this.thumbnail = thumbnail;
		this.contentPhoto = contentPhoto;
		this.createDate = createDate;
		this.startDate = startDate;
		this.endDate = endDate;
		this.status = status;
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}

	public String getEventTitle() {
		return eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	public String getEventWriter() {
		return eventWriter;
	}

	public void setEventWriter(String eventWriter) {
		this.eventWriter = eventWriter;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getContentPhoto() {
		return contentPhoto;
	}

	public void setContentPhoto(String contentPhoto) {
		this.contentPhoto = contentPhoto;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Event [eventNo=" + eventNo + ", eventTitle=" + eventTitle + ", eventWriter=" + eventWriter + ", count="
				+ count + ", thumbnail=" + thumbnail + ", contentPhoto=" + contentPhoto + ", createDate=" + createDate
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", status=" + status + "]";
	}
   
    
	
    
}
