package com.winefine.order.model.vo;

import java.sql.Date;

public class Order {
	
	
	private int orderNo; //ORDER_NO NUMBER PRIMARY KEY,
    private String orderUser; // ORDER_USER NUMBER NOT NULL,
    private String pickup; // PICKUP VARCHAR2(20) NOT NULL,
    private String pickupDate;
    private String orderStatus; // ORDER_STATUS VARCHAR2(20) DEFAULT '결제중',
    private int totalPrice; // TOTAL_PRICE NUMBER,
    private Date orderDate; // ORDER_DATE DATE DEFAULT SYSDATE,
    private String locationCode; // LOCATION_CODE NUMBER NOT NULL,
    private String paymentCode; // PAYMENT_CODE NUMBER NOT NULL,
    
    
	public Order() {
		super();
	}


	public Order(int orderNo, String orderUser, String pickup, String pickupDate, String orderStatus, int totalPrice,
			Date orderDate, String locationCode, String paymentCode) {
		super();
		this.orderNo = orderNo;
		this.orderUser = orderUser;
		this.pickup = pickup;
		this.pickupDate = pickupDate;
		this.orderStatus = orderStatus;
		this.totalPrice = totalPrice;
		this.orderDate = orderDate;
		this.locationCode = locationCode;
		this.paymentCode = paymentCode;
	}


	public int getOrderNo() {
		return orderNo;
	}


	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}


	public String getOrderUser() {
		return orderUser;
	}


	public void setOrderUser(String orderUser) {
		this.orderUser = orderUser;
	}


	public String getPickup() {
		return pickup;
	}


	public void setPickup(String pickup) {
		this.pickup = pickup;
	}


	public String getPickupDate() {
		return pickupDate;
	}


	public void setPickupDate(String pickupDate) {
		this.pickupDate = pickupDate;
	}


	public String getOrderStatus() {
		return orderStatus;
	}


	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}


	public int getTotalPrice() {
		return totalPrice;
	}


	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}


	public Date getOrderDate() {
		return orderDate;
	}


	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}


	public String getLocationCode() {
		return locationCode;
	}


	public void setLocationCode(String locationCode) {
		this.locationCode = locationCode;
	}


	public String getPaymentCode() {
		return paymentCode;
	}


	public void setPaymentCode(String paymentCode) {
		this.paymentCode = paymentCode;
	}


	

	
   
}
