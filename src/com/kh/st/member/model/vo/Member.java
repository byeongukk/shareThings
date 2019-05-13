package com.kh.st.member.model.vo;

import java.sql.Date;

public class Member implements java.io.Serializable{
	private int uno;
	private String userId;
	private String userPwd;
	private String userName;
	private Date birth;
	private String gender;
	private String phone;
	private String emgPhone;
	private String address;
	private String linkAge;
	private String snsCheck;
	private Date enrollDate;
	private Date modifyDate;
	private int profits;
	private int point;
	private int penalty;
	private String status;
	
	public Member() {}

	public Member(int uno, String userId, String userPwd, String userName, Date birth, String gender, String phone,
			String emgPhone, String address, String linkAge, String snsCheck, Date enrollDate, Date modifyDate,
			int profits, int point, int penalty, String status) {
		super();
		this.uno = uno;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.birth = birth;
		this.gender = gender;
		this.phone = phone;
		this.emgPhone = emgPhone;
		this.address = address;
		this.linkAge = linkAge;
		this.snsCheck = snsCheck;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.profits = profits;
		this.point = point;
		this.penalty = penalty;
		this.status = status;
	}

	public int getUno() {
		return uno;
	}

	public String getUserId() {
		return userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public Date getBirth() {
		return birth;
	}

	public String getGender() {
		return gender;
	}

	public String getPhone() {
		return phone;
	}

	public String getEmgPhone() {
		return emgPhone;
	}

	public String getAddress() {
		return address;
	}

	public String getLinkAge() {
		return linkAge;
	}

	public String getSnsCheck() {
		return snsCheck;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public int getProfits() {
		return profits;
	}

	public int getPoint() {
		return point;
	}

	public int getPenalty() {
		return penalty;
	}

	public String getStatus() {
		return status;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setEmgPhone(String emgPhone) {
		this.emgPhone = emgPhone;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setLinkAge(String linkAge) {
		this.linkAge = linkAge;
	}

	public void setSnsCheck(String snsCheck) {
		this.snsCheck = snsCheck;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public void setProfits(int profits) {
		this.profits = profits;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public void setPenalty(int penalty) {
		this.penalty = penalty;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Member [uno=" + uno + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", birth=" + birth + ", gender=" + gender + ", phone=" + phone + ", emgPhone=" + emgPhone
				+ ", address=" + address + ", linkAge=" + linkAge + ", snsCheck=" + snsCheck + ", enrollDate="
				+ enrollDate + ", modifyDate=" + modifyDate + ", profits=" + profits + ", point=" + point + ", penalty="
				+ penalty + ", status=" + status + "]";
	}
	
	
	
	
	
}
