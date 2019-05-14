package com.kh.st.request.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class ReqProduct implements Serializable{
	private int upNo;
	private String bWriter;
	private String productName;
	private Date reqDate;
	private String bTitle;
	private String acceptResult;
	
	public ReqProduct() {}

	public ReqProduct(int upNo, String bWriter, String productName, Date reqDate, String bTitle, String acceptResult) {
		super();
		this.upNo = upNo;
		this.bWriter = bWriter;
		this.productName = productName;
		this.reqDate = reqDate;
		this.bTitle = bTitle;
		this.acceptResult = acceptResult;
	}

	public int getUpNo() {
		return upNo;
	}

	public void setUpNo(int upNo) {
		this.upNo = upNo;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Date getReqDate() {
		return reqDate;
	}

	public void setReqDate(Date reqDate) {
		this.reqDate = reqDate;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getAcceptResult() {
		return acceptResult;
	}

	public void setAcceptResult(String acceptResult) {
		this.acceptResult = acceptResult;
	}

	@Override
	public String toString() {
		return "ReqProduct [upNo=" + upNo + ", bWriter=" + bWriter + ", productName=" + productName + ", reqDate="
				+ reqDate + ", bTitle=" + bTitle + ", acceptResult=" + acceptResult + "]";
	}
}
