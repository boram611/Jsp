package com.web_five.dto;

public class OrderinfoDto {
	int ordNo;
	String user_userId;
	String ordDate;
	String ordReceiver;
	String ordRcvAddress;
	String ordRcvPhone;
	String ordPay;
	String ordBank;
	String ordCardNo;
	String ordCardPass;
	String ordDelivery;
	String ordDeliveryDate;
	
	public OrderinfoDto() {
		// TODO Auto-generated constructor stub
	}

	

	public OrderinfoDto(int ordNo, String user_userId, String ordDate, String ordReceiver, String ordRcvAddress,
			String ordRcvPhone, String ordPay, String ordBank, String ordCardNo, String ordCardPass, String ordDelivery,
			String ordDeliveryDate) {
		super();
		this.ordNo = ordNo;
		this.user_userId = user_userId;
		this.ordDate = ordDate;
		this.ordReceiver = ordReceiver;
		this.ordRcvAddress = ordRcvAddress;
		this.ordRcvPhone = ordRcvPhone;
		this.ordPay = ordPay;
		this.ordBank = ordBank;
		this.ordCardNo = ordCardNo;
		this.ordCardPass = ordCardPass;
		this.ordDelivery = ordDelivery;
		this.ordDeliveryDate = ordDeliveryDate;
	}



	public int getOrdNo() {
		return ordNo;
	}

	public void setOrdNo(int ordNo) {
		this.ordNo = ordNo;
	}
	
	
	
	public String getUser_userId() {
		return user_userId;
	}

	public void setUser_userId(String user_userId) {
		this.user_userId = user_userId;
	}

	public String getOrdDate() {
		return ordDate;
	}

	public void setOrdDate(String ordDate) {
		this.ordDate = ordDate;
	}

	public String getOrdReceiver() {
		return ordReceiver;
	}

	public void setOrdReceiver(String ordReceiver) {
		this.ordReceiver = ordReceiver;
	}

	public String getOrdRcvAddress() {
		return ordRcvAddress;
	}

	public void setOrdRcvAddress(String ordRcvAddress) {
		this.ordRcvAddress = ordRcvAddress;
	}

	public String getOrdRcvPhone() {
		return ordRcvPhone;
	}

	public void setOrdRcvPhone(String ordRcvPhone) {
		this.ordRcvPhone = ordRcvPhone;
	}

	public String getOrdPay() {
		return ordPay;
	}

	public void setOrdPay(String ordPay) {
		this.ordPay = ordPay;
	}

	public String getOrdBank() {
		return ordBank;
	}

	public void setOrdBank(String ordBank) {
		this.ordBank = ordBank;
	}

	public String getOrdCardNo() {
		return ordCardNo;
	}

	public void setOrdCardNo(String ordCardNo) {
		this.ordCardNo = ordCardNo;
	}

	public String getOrdCardPass() {
		return ordCardPass;
	}

	public void setOrdCardPass(String ordCardPass) {
		this.ordCardPass = ordCardPass;
	}

	public String getOrdDelivery() {
		return ordDelivery;
	}

	public void setOrdDelivery(String ordDelivery) {
		this.ordDelivery = ordDelivery;
	}

	public String getOrdDeliveryDate() {
		return ordDeliveryDate;
	}

	public void setOrdDeliveryDate(String ordDeliveryDate) {
		this.ordDeliveryDate = ordDeliveryDate;
	}
	
	

}
