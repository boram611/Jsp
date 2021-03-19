package com.web_five.dto;

public class orderDto {
	
	// Field
	
	public static String user_userId;
	public static String ordReceiver;
	public static String ordRcvAddress;
	public static String ordRcvPhone;
	public static String ordPay;
	public static String ordBank;
	public static String ordCardNo;
	public static String ordCard1;
	public static String ordCard2;
	public static String ordCard3;
	public static String ordCard4;
	
	public static String ordCardPass;
	
	public static String userTel1;
	public static String userTel2;
	public static String userTel3;
	public static String userAddress1;
	public static String userAddress2;
	public static String userAddress3;
	
	// Constructor
	
	public orderDto() {
	}
	
	// 주문자 정보와 동일 클릭했을 경우
	public orderDto(String ordReceiver, String UserAddress1, String UserAddress2, String UserAddress3, String UserTel1, String UserTel2, String UserTel3) {
		super();
		this.ordReceiver = ordReceiver;
		this.userAddress1 = UserAddress1;
		this.userAddress2 = UserAddress2;
		this.userAddress3 = UserAddress3;
		this.userTel1 = UserTel1;
		this.userTel2 = UserTel2;
		this.userTel3 = UserTel3;
		
	}
	public orderDto(String user_userId, String ordReceiver, String ordRcvAddress, String ordRcvPhone, String ordPay, String ordBank, String ordCardNo, String ordCardPass, String ordCard1, String ordCard2, String ordCard3, String ordCard4) {
		super();
		this.user_userId = user_userId;
		this.ordReceiver = ordReceiver;
		this.ordRcvAddress = ordRcvAddress;
		this.ordRcvPhone = ordRcvPhone;
		this.ordPay = ordPay;
		this.ordBank = ordBank;
		this.ordCardNo = ordCardNo;
		this.ordCardPass = ordCardPass;
		this.ordCard1 = ordCard1;
		this.ordCard2 = ordCard2;
		this.ordCard3 = ordCard3;
		this.ordCard4 = ordCard4;
		
	}

	
	
	public String getOrdCard1() {
		return ordCard1;
	}

	public void setOrdCard1(String ordCard1) {
		this.ordCard1 = ordCard1;
	}

	public String getOrdCard2() {
		return ordCard2;
	}

	public void setOrdCard2(String ordCard2) {
		this.ordCard2 = ordCard2;
	}

	public String getOrdCard3() {
		return ordCard3;
	}

	public void setOrdCard3(String ordCard3) {
		this.ordCard3 = ordCard3;
	}

	public String getOrdCard4() {
		return ordCard4;
	}

	public void setOrdCard4(String ordCard4) {
		this.ordCard4 = ordCard4;
	}

	public String getUser_userId() {
		return user_userId;
	}

	public void setUser_userId(String user_userId) {
		this.user_userId = user_userId;
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

	public String getUserTel1() {
		return userTel1;
	}

	public void setUserTel1(String userTel1) {
		this.userTel1 = userTel1;
	}

	public String getUserTel2() {
		return userTel2;
	}

	public void setUserTel2(String userTel2) {
		this.userTel2 = userTel2;
	}

	public String getUserTel3() {
		return userTel3;
	}

	public void setUserTel3(String userTel3) {
		this.userTel3 = userTel3;
	}

	public String getUserAddress1() {
		return userAddress1;
	}

	public void setUserAddress1(String userAddress1) {
		this.userAddress1 = userAddress1;
	}

	public String getUserAddress2() {
		return userAddress2;
	}

	public void setUserAddress2(String userAddress2) {
		this.userAddress2 = userAddress2;
	}

	public String getUserAddress3() {
		return userAddress3;
	}

	public void setUserAddress3(String userAddress3) {
		this.userAddress3 = userAddress3;
	}
	
	
	


	
}
