package com.kh.st.product.model.vo;

import java.sql.Date;

public class Product implements java.io.Serializable{
	
	
	private int pno; //물품번호
	private Date stDate; //등록시작일
	private Date edDate; //등록종료일
	private int price; //가격
	private int deposit; //보증금
	private int dlAmount; //배송비
	private String model; //모델명
	private int uno; //회원번호
	private int ctgId;//물품 분류 코드
	private Date purchaseDate; //구입시기
	private int purchasePrice;//구입가격
	private String condition;//물품상태
	private String sid; //상태코드
	
	
	public Product() {}


	public Product(int pno, Date stDate, Date edDate, int price, int deposit, int dlAmount, String model, int uno,
			int ctgId, Date purchaseDate, int purchasePrice, String condition, String sid) {
		super();
		this.pno = pno;
		this.stDate = stDate;
		this.edDate = edDate;
		this.price = price;
		this.deposit = deposit;
		this.dlAmount = dlAmount;
		this.model = model;
		this.uno = uno;
		this.ctgId = ctgId;
		this.purchaseDate = purchaseDate;
		this.purchasePrice = purchasePrice;
		this.condition = condition;
		this.sid = sid;
	}


	public int getPno() {
		return pno;
	}


	public void setPno(int pno) {
		this.pno = pno;
	}


	public Date getStDate() {
		return stDate;
	}


	public void setStDate(Date stDate) {
		this.stDate = stDate;
	}


	public Date getEdDate() {
		return edDate;
	}


	public void setEdDate(Date edDate) {
		this.edDate = edDate;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public int getDeposit() {
		return deposit;
	}


	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}


	public int getDlAmount() {
		return dlAmount;
	}


	public void setDlAmount(int dlAmount) {
		this.dlAmount = dlAmount;
	}


	public String getModel() {
		return model;
	}


	public void setModel(String model) {
		this.model = model;
	}


	public int getUno() {
		return uno;
	}


	public void setUno(int uno) {
		this.uno = uno;
	}


	public int getCtgId() {
		return ctgId;
	}


	public void setCtgId(int ctgId) {
		this.ctgId = ctgId;
	}


	public Date getPurchaseDate() {
		return purchaseDate;
	}


	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}


	public int getPurchasePrice() {
		return purchasePrice;
	}


	public void setPurchasePrice(int purchasePrice) {
		this.purchasePrice = purchasePrice;
	}


	public String getCondition() {
		return condition;
	}


	public void setCondition(String condition) {
		this.condition = condition;
	}


	public String getSid() {
		return sid;
	}


	public void setSid(String sid) {
		this.sid = sid;
	}


	@Override
	public String toString() {
		return "Product [pno=" + pno + ", stDate=" + stDate + ", edDate=" + edDate + ", price=" + price + ", deposit="
				+ deposit + ", dlAmount=" + dlAmount + ", model=" + model + ", uno=" + uno + ", ctgId=" + ctgId
				+ ", purchaseDate=" + purchaseDate + ", purchasePrice=" + purchasePrice + ", condition=" + condition
				+ ", sid=" + sid + "]";
	}
	
	
	
	
}
