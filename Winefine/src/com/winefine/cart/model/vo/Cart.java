package com.winefine.cart.model.vo;

public class Cart {

	// 필드부
	private int cartNo;// CART_NO NUMBER PRIMARY KEY, 장바구니번호
	private String productNo;// PRODUCT_NO NUMBER NOT NULL, 상품번호
	private String productName;
	private int userNo;// USER_NO NUMBER NOT NULL, 회원번호
	private int price;// PRICE NUMBER NOT NULL, 상품가격
	private int bottle;// BOTTLE NUMBER, 수량
	private String thumbnail;

	// 생성자부
	public Cart() {
		super();
	}

	/*
	 * public Cart(int cartNo, String productNo, int userNo, int price, int bottle)
	 * { super(); this.cartNo = cartNo; this.productNo = productNo; this.userNo =
	 * userNo; this.price = price; this.bottle = bottle; }
	 */

	public Cart(String productNo, int price, int bottle) {
		super();
		this.productNo = productNo;
		this.price = price;
		this.bottle = bottle;
	}

	public Cart(int cartNo, String productNo, int userNo, int price, int bottle, String thumbnail) {
		super();
		this.cartNo = cartNo;
		this.productNo = productNo;
		this.userNo = userNo;
		this.price = price;
		this.bottle = bottle;
		this.thumbnail = thumbnail;
	}

	// 솔 추가
	public Cart(int cartNo, String productNo, String productName, int userNo, int price, int bottle, String thumbnail) {
		super();
		this.cartNo = cartNo;
		this.productNo = productNo;
		this.productName = productName;
		this.userNo = userNo;
		this.price = price;
		this.bottle = bottle;
		this.thumbnail = thumbnail;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	// 메소드부
	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getBottle() {
		return bottle;
	}

	public void setBottle(int bottle) {
		this.bottle = bottle;
	}

	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", productNo=" + productNo + ", userNo=" + userNo + ", price=" + price
				+ ", bottle=" + bottle + "]";
	}

}
