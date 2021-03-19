package com.web_five.dto;

public class orderListDto {
	String user_userId; 
	String ordNo; 
	String ordDate; 
	String prdName; 
	int ordQty; 
	String ordDelivery;
	int prdPrice;
	int total;
	String prdNo;
	
	
	//생성자
	public orderListDto() {
		
	}
	
	public orderListDto(String ordNo, String prdName, int prdPrice, int ordQty, String ordDate,
			String ordDelivery, String prdNo, int total) {
		super();
		this.ordNo = ordNo;
		this.prdName = prdName;
		this.prdPrice = prdPrice;
		this.ordQty = ordQty;
		this.ordDate = ordDate;
		this.ordDelivery = ordDelivery;
		this.prdNo = prdNo;
		this.total = total;
	}
	
	
	
	
	
	
	
	
	
	
	
	public String getPrdNo() {
		return prdNo;
	}

	public void setPrdNo(String prdNo) {
		this.prdNo = prdNo;
	}

	public orderListDto(int total) {
		super();
		this.total = total;
	}


	public String getUser_userId() {
		return user_userId;
	}


	public void setUser_userId(String user_userId) {
		this.user_userId = user_userId;
	}


	public String getOrdNo() {
		return ordNo;
	}


	public void setOrdNo(String ordNo) {
		this.ordNo = ordNo;
	}


	public String getOrdDate() {
		return ordDate;
	}


	public void setOrdDate(String ordDate) {
		this.ordDate = ordDate;
	}


	public String getPrdName() {
		return prdName;
	}


	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}


	public int getOrdQty() {
		return ordQty;
	}


	public void setOrdQty(int ordQty) {
		this.ordQty = ordQty;
	}


	public String getOrdDelivery() {
		return ordDelivery;
	}


	public void setOrdDelivery(String ordDelivery) {
		this.ordDelivery = ordDelivery;
	}

	public int getPrdPrice() {
		return prdPrice;
	}

	public void setPrdPrice(int prdPrice) {
		this.prdPrice = prdPrice;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	
	
	
	
	
}
