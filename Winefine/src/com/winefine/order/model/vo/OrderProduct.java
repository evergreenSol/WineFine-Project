package com.winefine.order.model.vo;

public class OrderProduct {

	private int orderProductNo;
	private int orderNo;
	private int productNo;
	private String productName;
	private int pCount;
	private int pPrice;
	private String thumbnail;
	private int totalPrice;
	
	
	public OrderProduct() {
		super();
	}


	public OrderProduct(int orderProductNo, int orderNo, int productNo, String productName, int pCount, int pPrice, String thumbnail) {
		super();
		this.orderProductNo = orderProductNo;
		this.orderNo = orderNo;
		this.productNo = productNo;
		this.productName = productName;
		this.pCount = pCount;
		this.pPrice = pPrice;
		this.thumbnail = thumbnail;
		this.totalPrice = pCount * pPrice;
	}


	public int getOrderProductNo() {
		return orderProductNo;
	}


	public void setOrderProductNo(int orderProductNo) {
		this.orderProductNo = orderProductNo;
	}


	public int getOrderNo() {
		return orderNo;
	}


	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}


	public int getProductNo() {
		return productNo;
	}


	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public int getpCount() {
		return pCount;
	}


	public void setpCount(int pCount) {
		this.pCount = pCount;
	}


	public int getpPrice() {
		return pPrice;
	}


	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}


	public String getThumbnail() {
		return thumbnail;
	}


	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}


	public int getTotalPrice() {
		return totalPrice;
	}


	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}


	@Override
	public String toString() {
		return "OrderProduct [orderProductNo=" + orderProductNo + ", orderNo=" + orderNo + ", productNo=" + productNo
				+ ", productName=" + productName + ", pCount=" + pCount + ", pPrice=" + pPrice + ", thumbnail="
				+ thumbnail + ", totalPrice=" + totalPrice + "]";
	}


	
}
