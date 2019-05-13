package com.kh.st.rental.model.vo;

import java.sql.Date;

/**
 * @author uukk
 *
 */
public class Rental implements java.io.Serializable {

	private int rno;
	private Date reqDate;
	private Date rentalDate;
	private Date rentalEndDate;
	private int pno;
	private int uno;
	
	public Rental() {}

	public Rental(int rno, Date reqDate, Date rentalDate, Date rentalEndDate, int pno, int uno) {
		super();
		this.rno = rno;
		this.reqDate = reqDate;
		this.rentalDate = rentalDate;
		this.rentalEndDate = rentalEndDate;
		this.pno = pno;
		this.uno = uno;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public Date getReqDate() {
		return reqDate;
	}

	public void setReqDate(Date reqDate) {
		this.reqDate = reqDate;
	}

	public Date getRentalDate() {
		return rentalDate;
	}

	public void setRentalDate(Date rentalDate) {
		this.rentalDate = rentalDate;
	}

	public Date getRentalEndDate() {
		return rentalEndDate;
	}

	public void setRentalEndDate(Date rentalEndDate) {
		this.rentalEndDate = rentalEndDate;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	@Override
	public String toString() {
		return "Rental [rno=" + rno + ", reqDate=" + reqDate + ", rentalDate=" + rentalDate + ", rentalEndDate="
				+ rentalEndDate + ", pno=" + pno + ", uno=" + uno + "]";
	}
	
	
	
}
