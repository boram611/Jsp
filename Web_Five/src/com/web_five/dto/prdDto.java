package com.web_five.dto;

import java.sql.Timestamp;

public class prdDto {
	
	int prdNo;
	String ctgType;
	String prdName;
	int prdPrice;
	int prdStock;
	String prdFilename;
	String prdContent;
	String prdDetatilFilename;
	String prdDate;
	
	public prdDto() {
		// TODO Auto-generated constructor stub
	}

	public prdDto(int prdNo, String ctgType, String prdName, int prdPrice, int prdStock, String prdFilename,
			String prdContent, String prdDetatilFilename ) {
		super();
		this.prdNo = prdNo;
		this.ctgType = ctgType;
		this.prdName = prdName;
		this.prdPrice = prdPrice;
		this.prdStock = prdStock;
		this.prdFilename = prdFilename;
		this.prdContent = prdContent;
		this.prdDetatilFilename = prdDetatilFilename;
		
	}
	

	public prdDto(int prdNo, String ctgType, String prdName, int prdPrice, int prdStock, String prdFilename) {
		super();
		this.prdNo = prdNo;
		this.ctgType = ctgType;
		this.prdName = prdName;
		this.prdPrice = prdPrice;
		this.prdStock = prdStock;
		this.prdFilename = prdFilename;
		
	}
	
	

	public prdDto(int prdNo,String prdName, int prdPrice, String prdFilename) {
		super();
		this.prdNo = prdNo;
		this.prdName = prdName;
		this.prdPrice = prdPrice;
		this.prdFilename = prdFilename;
	}

	
	
	public prdDto(int prdNo, String ctgType, String prdName,int prdPrice, String prdFilename, int prdStock) {
		super();
		this.prdNo = prdNo;
		this.ctgType = ctgType;
		this.prdName = prdName;
		this.prdPrice = prdPrice;
		this.prdFilename = prdFilename;
		this.prdStock = prdStock;
	}

	public int getPrdNo() {
		return prdNo;
	}

	public void setPrdNo(int prdNo) {
		this.prdNo = prdNo;
	}

	public String getCtgType() {
		return ctgType;
	}

	public void setCtgType(String ctgType) {
		this.ctgType = ctgType;
	}

	public String getPrdName() {
		return prdName;
	}

	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}

	public int getPrdPrice() {
		return prdPrice;
	}

	public void setPrdPrice(int prdPrice) {
		this.prdPrice = prdPrice;
	}

	public int getPrdStock() {
		return prdStock;
	}

	public void setPrdStock(int prdStock) {
		this.prdStock = prdStock;
	}

	public String getPrdFilename() {
		return prdFilename;
	}

	public void setPrdFilename(String prdFilename) {
		this.prdFilename = prdFilename;
	}

	public String getPrdContent() {
		return prdContent;
	}

	public void setPrdContent(String prdContent) {
		this.prdContent = prdContent;
	}

	public String getPrdDetatilFilename() {
		return prdDetatilFilename;
	}

	public void setPrdDetatilFilename(String prdDetatilFilename) {
		this.prdDetatilFilename = prdDetatilFilename;
	}

	public String getPrdDate() {
		return prdDate;
	}

	public void setPrdDate(String prdDate) {
		this.prdDate = prdDate;
	}
	
	
	
	
	
}
