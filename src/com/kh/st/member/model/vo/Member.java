package com.kh.st.member.model.vo;

import java.sql.Date;

public class Member implements java.io.Serializable{
	private int uno;
	private String userId;
	private String userPwd;
	private String userName;
	private String phone;
	private String email;
	private String address;
	private int point;
	private Date enrollDate;
	private String status;
	private String optionCheck;
	private String subPhone;
	private String socialLink;
	private String gender;
	private Date birthDate;
	private Date modifyDate;
	private int profits;
	private int penaltyPoint;
	private String mLevel;
	
	public Member() {}

	public Member(int uno, String userId, String userPwd, String userName, String phone, String email, String address,
			int point, Date enrollDate, String status, String optionCheck, String subPhone, String socialLink, String gender,
			Date birthDate, Date modifyDate, int profits, int penaltyPoint, String mLevel) {
		super();
		this.uno = uno;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.point = point;
		this.enrollDate = enrollDate;
		this.status = status;
		this.optionCheck = optionCheck;
		this.subPhone = subPhone;
		this.socialLink = socialLink;
		this.gender = gender;
		this.birthDate = birthDate;
		this.modifyDate = modifyDate;
		this.profits = profits;
		this.penaltyPoint = penaltyPoint;
		this.mLevel = mLevel;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getOptionCheck() {
		return optionCheck;
	}

	public void setOptionCheck(String optionCheck) {
		this.optionCheck = optionCheck;
	}

	public String getSubPhone() {
		return subPhone;
	}

	public void setSubPhone(String subPhone) {
		this.subPhone = subPhone;
	}

	public String getSocialLink() {
		return socialLink;
	}

	public void setSocialLink(String socialLink) {
		this.socialLink = socialLink;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public int getProfits() {
		return profits;
	}

	public void setProfits(int profits) {
		this.profits = profits;
	}

	public int getPenaltyPoint() {
		return penaltyPoint;
	}

	public void setPenaltyPoint(int penaltyPoint) {
		this.penaltyPoint = penaltyPoint;
	}

	public String getmLevel() {
		return mLevel;
	}

	public void setmLevel(String mLevel) {
		this.mLevel = mLevel;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Member [uno=" + uno + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", phone=" + phone + ", email=" + email + ", address=" + address + ", point=" + point
				+ ", enrollDate=" + enrollDate + ", status=" + status + ", optionCheck=" + optionCheck + ", subPhone=" + subPhone
				+ ", socialLink=" + socialLink + ", gender=" + gender + ", birthDate=" + birthDate + ", modifyDate="
				+ modifyDate + ", profits=" + profits + ", penaltyPoint=" + penaltyPoint + ", mLevel=" + mLevel + "]";
	}

	
	

}