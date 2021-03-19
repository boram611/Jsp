package com.web_five.dto;

import java.sql.Timestamp;

public class PDto {
	//Field
	String ctgType;
	int prdNo;
	String prdName;
	String prdPrice;
	String prdStock;
	String prdContent;
	String prdFilename;
	String prdDFilename;
	String prdAFilename;
		
		
		// Constructor
		public PDto() {
			// TODO Auto-generated constructor stub
		}


		public PDto(String ctgType, String prdName, String prdPrice, String prdStock, String prdContent,
				String prdFilename, String prdDFilename) {
			super();
			this.ctgType = ctgType;
			this.prdName = prdName;
			this.prdPrice = prdPrice;
			this.prdStock = prdStock;
			this.prdContent = prdContent;
			this.prdFilename = prdFilename;
			this.prdDFilename = prdDFilename;
		}



		public PDto(String ctgType, int prdNo, String prdName, String prdPrice, String prdContent, String prdFilename, String prdDFilename) {
			super();
			this.ctgType = ctgType;
			this.prdNo = prdNo;
			this.prdName = prdName;
			this.prdPrice = prdPrice;
			this.prdContent = prdContent;
			this.prdFilename = prdFilename;
			this.prdDFilename = prdDFilename;
		}


		public PDto(String ctgType, int prdNo, String prdName, String prdPrice, String prdStock, String prdContent,
				String prdFilename, String prdDFilename, String prdAFilename) {
			super();
			this.ctgType = ctgType;
			this.prdNo = prdNo;
			this.prdName = prdName;
			this.prdPrice = prdPrice;
			this.prdStock = prdStock;
			this.prdContent = prdContent;
			this.prdFilename = prdFilename;
			this.prdDFilename = prdDFilename;
			this.prdAFilename = prdAFilename;
		}
		public PDto(String ctgType, int prdNo, String prdName, String prdPrice, String prdStock, String prdContent,
				String prdFilename, String prdDFilename) {
			super();
			this.ctgType = ctgType;
			this.prdNo = prdNo;
			this.prdName = prdName;
			this.prdPrice = prdPrice;
			this.prdStock = prdStock;
			this.prdContent = prdContent;
			this.prdFilename = prdFilename;
			this.prdDFilename = prdDFilename;
		}


		public String getPrdAFilename() {
			return prdAFilename;
		}


		public void setPrdAFilename(String prdAFilename) {
			this.prdAFilename = prdAFilename;
		}


		public String getCtgType() {
			return ctgType;
		}


		public void setCtgType(String ctgType) {
			this.ctgType = ctgType;
		}


		public int getPrdNo() {
			return prdNo;
		}


		public void setPrdNo(int prdNo) {
			this.prdNo = prdNo;
		}


		public String getPrdName() {
			return prdName;
		}


		public void setPrdName(String prdName) {
			this.prdName = prdName;
		}


		public String getPrdPrice() {
			return prdPrice;
		}


		public void setPrdPrice(String prdPrice) {
			this.prdPrice = prdPrice;
		}


		public String getPrdStock() {
			return prdStock;
		}


		public void setPrdStock(String prdStock) {
			this.prdStock = prdStock;
		}


		public String getPrdContent() {
			return prdContent;
		}


		public void setPrdContent(String prdContent) {
			this.prdContent = prdContent;
		}


		public String getPrdFilename() {
			return prdFilename;
		}


		public void setPrdFilename(String prdFilename) {
			this.prdFilename = prdFilename;
		}


		public String getPrdDFilename() {
			return prdDFilename;
		}


		public void setPrdDFilename(String prdDFilename) {
			this.prdDFilename = prdDFilename;
		}
		
		
		
}
