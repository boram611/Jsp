package com.web_five.dto;

import java.sql.Timestamp;

public class NDto {
	// field
	int nSeqno;
	String nTitle;
	String nContent;
	Timestamp nDate;
	String admin_adminId;
	
	// constructor
	public NDto() {
		// TODO Auto-generated constructor stub
	}

	
	
	
	public NDto(int nSeqno, String nTitle, String nContent, Timestamp nDate, String admin_adminId) {
		super();
		this.nSeqno = nSeqno;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nDate = nDate;
		this.admin_adminId = admin_adminId;
	}







	public int getnSeqno() {
		return nSeqno;
	}

	public void setnSeqno(int nSeqno) {
		this.nSeqno = nSeqno;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public Timestamp getnDate() {
		return nDate;
	}

	public void setnDate(Timestamp nDate) {
		this.nDate = nDate;
	}

	public String getAdmin_adminId() {
		return admin_adminId;
	}

	public void setAdmin_adminId(String admin_adminId) {
		this.admin_adminId = admin_adminId;
	}
	
	

}
