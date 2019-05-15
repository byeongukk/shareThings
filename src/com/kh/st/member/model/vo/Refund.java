package com.kh.st.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Refund implements Serializable{
	private int rfNo;
	private String userId;
	private String userName;
	private int payNo;
	private String rfType;
	private Date reqDate;
	private String rfStatus;
	private Date rfDate;
	private String rfReason;
	
	public Refund() {}

	public Refund(int rfNo, String userId, String userName, int payNo, String rfType, Date reqDate, String rfStatus,
			Date rfDate, String rfReason) {
		super();
		this.rfNo = rfNo;
		this.userId = userId;
		this.userName = userName;
		this.payNo = payNo;
		this.rfType = rfType;
		this.reqDate = reqDate;
		this.rfStatus = rfStatus;
		this.rfDate = rfDate;
		this.rfReason = rfReason;
	}

	public int getRfNo() {
		return rfNo;
	}

	public String getUserId() {
		return userId;
	}

	public String getUserName() {
		return userName;
	}

	public int getPayNo() {
		return payNo;
	}

	public String getRfType() {
		return rfType;
	}

	public Date getReqDate() {
		return reqDate;
	}

	public String getRfStatus() {
		return rfStatus;
	}

	public Date getRfDate() {
		return rfDate;
	}

	public String getRfReason() {
		return rfReason;
	}

	public void setRfNo(int rfNo) {
		this.rfNo = rfNo;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}

	public void setRfType(String rfType) {
		this.rfType = rfType;
	}

	public void setReqDate(Date reqDate) {
		this.reqDate = reqDate;
	}

	public void setRfStatus(String rfStatus) {
		this.rfStatus = rfStatus;
	}

	public void setRfDate(Date rfDate) {
		this.rfDate = rfDate;
	}

	public void setRfReason(String rfReason) {
		this.rfReason = rfReason;
	}

	@Override
	public String toString() {
		return "Refund [rfNo=" + rfNo + ", userId=" + userId + ", userName=" + userName + ", payNo=" + payNo
				+ ", rfType=" + rfType + ", reqDate=" + reqDate + ", rfStatus=" + rfStatus + ", rfDate=" + rfDate
				+ ", rfReason=" + rfReason + "]";
	}
	
	
	
}
