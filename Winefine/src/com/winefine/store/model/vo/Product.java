package com.winefine.store.model.vo;

public class Product {

	// 필드부
	private int productNo;// PRODUCT_NO NUMBER PRIMARY KEY, 상품번호
	private String productType;// PRODUCT_TYPE VARCHAR2(30) NOT NULL, 종류
	private String productName;// PRODUCT_NAME VARCHAR2(60) NOT NULL, 상품명
	private int price;// PRICE NUMBER NOT NULL, 가격
	private String brand;// BRAND VARCHAR2(30) NOT NULL, 브랜드
	private float alcohol;// ALCOHOL NUMBER NOT NULL, 도수
	private int stock;// STOCK NUMBER NOT NULL, 재고수량
	private String origin;// ORIGIN VARCHAR2(30) NOT NULL, 원산지
	private int sweetness;// SWEETNESS NUMBER NOT NULL, 당도
	private int acidity;// ACIDITY NUMBER NOT NULL, 산도
	private int body;// BODY NUMBER NOT NULL, 바디
	private int tannin;// TANNIN NUMBER NOT NULL, 탄닌
	private String status;// STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')), 상태
	private int count;// COUNT NUMBER DEFAULT 0, 누적판매
	private String thumbnail;// THUMBNAIL VARCHAR2(100) NOT NULL, 썸네일 사진
	private String contentPhoto1;// CONTENT_PHOTO1 VARCHAR2(100), 상품상세사진1
	private String contentPhoto2;// CONTENT_PHOTO2 VARCHAR2(100), 상품상세사진2
	private String content;// CONTENT VARCHAR2(4000) 상세내용

	// 생성자부
	public Product() {
		super();
	}

	public Product(int productNo, String productType, String productName, int price, String brand, float alcohol,
			int stock, String origin, int sweetness, int acidity, int body, int tannin, String status, int count,
			String thumbnail, String contentPhoto1, String contentPhoto2, String content) {
		super();
		this.productNo = productNo;
		this.productType = productType;
		this.productName = productName;
		this.price = price;
		this.brand = brand;
		this.alcohol = alcohol;
		this.stock = stock;
		this.origin = origin;
		this.sweetness = sweetness;
		this.acidity = acidity;
		this.body = body;
		this.tannin = tannin;
		this.status = status;
		this.count = count;
		this.thumbnail = thumbnail;
		this.contentPhoto1 = contentPhoto1;
		this.contentPhoto2 = contentPhoto2;
		this.content = content;
	}

	// 메소드부
	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public float getAlcohol() {
		return alcohol;
	}

	public void setAlcohol(float alcohol) {
		this.alcohol = alcohol;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public int getSweetness() {
		return sweetness;
	}

	public void setSweetness(int sweetness) {
		this.sweetness = sweetness;
	}

	public int getAcidity() {
		return acidity;
	}

	public void setAcidity(int acidity) {
		this.acidity = acidity;
	}

	public int getBody() {
		return body;
	}

	public void setBody(int body) {
		this.body = body;
	}

	public int getTannin() {
		return tannin;
	}

	public void setTannin(int tannin) {
		this.tannin = tannin;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public String getContentPhoto1() {
		return contentPhoto1;
	}

	public void setContentPhoto1(String contentPhoto1) {
		this.contentPhoto1 = contentPhoto1;
	}

	public String getContentPhoto2() {
		return contentPhoto2;
	}

	public void setContentPhoto2(String contentPhoto2) {
		this.contentPhoto2 = contentPhoto2;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productType=" + productType + ", productName=" + productName
				+ ", price=" + price + ", brand=" + brand + ", alcohol=" + alcohol + ", stock=" + stock + ", origin="
				+ origin + ", sweetness=" + sweetness + ", acidity=" + acidity + ", body=" + body + ", tannin=" + tannin
				+ ", status=" + status + ", count=" + count + ", thumbnail=" + thumbnail + ", contentPhoto1="
				+ contentPhoto1 + ", contentPhoto2=" + contentPhoto2 + ", content=" + content + "]";
	}

}
