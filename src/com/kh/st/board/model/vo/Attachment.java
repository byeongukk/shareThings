package com.kh.st.board.model.vo;

import java.sql.Date;

public class Attachment implements java.io.Serializable{

	private int ano;
	private String originName;
	private String changeName;
	private String changePath;
	private Date uploadDate;
	private int fileLevel;
	private String aType;
	private int bno;
	private int chkNo;
	private int csNo;
	public Attachment(int ano, String originName, String changeName, String changePath, Date uploadDate, int fileLevel,
			String aType, int bno, int chkNo, int csNo) {
		super();
		this.ano = ano;
		this.originName = originName;
		this.changeName = changeName;
		this.changePath = changePath;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
		this.aType = aType;
		this.bno = bno;
		this.chkNo = chkNo;
		this.csNo = csNo;
	}
	/**
	 * @return the ano
	 */
	public int getAno() {
		return ano;
	}
	/**
	 * @return the originName
	 */
	public String getOriginName() {
		return originName;
	}
	/**
	 * @return the changeName
	 */
	public String getChangeName() {
		return changeName;
	}
	/**
	 * @return the changePath
	 */
	public String getChangePath() {
		return changePath;
	}
	/**
	 * @return the uploadDate
	 */
	public Date getUploadDate() {
		return uploadDate;
	}
	/**
	 * @return the fileLevel
	 */
	public int getFileLevel() {
		return fileLevel;
	}
	/**
	 * @return the aType
	 */
	public String getaType() {
		return aType;
	}
	/**
	 * @return the bno
	 */
	public int getBno() {
		return bno;
	}
	/**
	 * @return the chkNo
	 */
	public int getChkNo() {
		return chkNo;
	}
	/**
	 * @return the csNo
	 */
	public int getCsNo() {
		return csNo;
	}
	/**
	 * @param ano the ano to set
	 */
	public void setAno(int ano) {
		this.ano = ano;
	}
	/**
	 * @param originName the originName to set
	 */
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	/**
	 * @param changeName the changeName to set
	 */
	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}
	/**
	 * @param changePath the changePath to set
	 */
	public void setChangePath(String changePath) {
		this.changePath = changePath;
	}
	/**
	 * @param uploadDate the uploadDate to set
	 */
	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}
	/**
	 * @param fileLevel the fileLevel to set
	 */
	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}
	/**
	 * @param aType the aType to set
	 */
	public void setaType(String aType) {
		this.aType = aType;
	}
	/**
	 * @param bno the bno to set
	 */
	public void setBno(int bno) {
		this.bno = bno;
	}
	/**
	 * @param chkNo the chkNo to set
	 */
	public void setChkNo(int chkNo) {
		this.chkNo = chkNo;
	}
	/**
	 * @param csNo the csNo to set
	 */
	public void setCsNo(int csNo) {
		this.csNo = csNo;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Attachment [ano=" + ano + ", originName=" + originName + ", changeName=" + changeName + ", changePath="
				+ changePath + ", fileLevel=" + fileLevel + ", aType=" + aType + ", bno=" + bno + ", chkNo=" + chkNo
				+ ", csNo=" + csNo + "]";
	}
	
	
}
