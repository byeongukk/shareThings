package com.kh.st.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Report implements Serializable{
	private int reportNo;
	private String reject;
	private Date reportDate;
	private String reportUser;
	private String targetUser;
	private String reportResult;
	private Date complateDate;
	private String reportName;
	private String reportInsert;
	private int penalty;
	private int sumPenalty;
	private String status;
	
	public Report() {}

	public Report(int reportNo, String reject, Date reportDate, String reportUser, String targetUser,
			String reportResult, Date complateDate, String reportName, String reportInsert, int penalty, int sumPenalty,
			String status) {
		super();
		this.reportNo = reportNo;
		this.reject = reject;
		this.reportDate = reportDate;
		this.reportUser = reportUser;
		this.targetUser = targetUser;
		this.reportResult = reportResult;
		this.complateDate = complateDate;
		this.reportName = reportName;
		this.reportInsert = reportInsert;
		this.penalty = penalty;
		this.sumPenalty = sumPenalty;
		this.status = status;
	}

	public int getReportNo() {
		return reportNo;
	}

	public String getReject() {
		return reject;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public String getReportUser() {
		return reportUser;
	}

	public String getTargetUser() {
		return targetUser;
	}

	public String getReportResult() {
		return reportResult;
	}

	public Date getComplateDate() {
		return complateDate;
	}

	public String getReportName() {
		return reportName;
	}

	public String getReportInsert() {
		return reportInsert;
	}

	public int getPenalty() {
		return penalty;
	}

	public int getSumPenalty() {
		return sumPenalty;
	}

	public String getStatus() {
		return status;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public void setReject(String reject) {
		this.reject = reject;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public void setReportUser(String reportUser) {
		this.reportUser = reportUser;
	}

	public void setTargetUser(String targetUser) {
		this.targetUser = targetUser;
	}

	public void setReportResult(String reportResult) {
		this.reportResult = reportResult;
	}

	public void setComplateDate(Date complateDate) {
		this.complateDate = complateDate;
	}

	public void setReportName(String reportName) {
		this.reportName = reportName;
	}

	public void setReportInsert(String reportInsert) {
		this.reportInsert = reportInsert;
	}

	public void setPenalty(int penalty) {
		this.penalty = penalty;
	}

	public void setSumPenalty(int sumPenalty) {
		this.sumPenalty = sumPenalty;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reject=" + reject + ", reportDate=" + reportDate + ", reportUser="
				+ reportUser + ", targetUser=" + targetUser + ", reportResult=" + reportResult + ", complateDate="
				+ complateDate + ", reportName=" + reportName + ", reportInsert=" + reportInsert + ", penalty="
				+ penalty + ", sumPenalty=" + sumPenalty + ", status=" + status + "]";
	}
	
	
	
	
}
