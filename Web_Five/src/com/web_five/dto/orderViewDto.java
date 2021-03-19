package com.web_five.dto;

public class orderViewDto {
	String prdNo;
	public static String ordNo;
	public static String prdName;
	public static int prdPrice;
	public static int ordQty;
	public static String ordDate;
	
	public static String receiver;
	public static String deliveryAddr;
	public static String receiverTel;
	public static String ordDelivery;
	public static String deliveryDate;
	
	public static int total;
	public static String cardBank;
	public static String cardNumber1;
	public static String cardNumber2;
	public static String cardNumber3;
	public static String cardNumber4;
	
	public orderViewDto() {
		
	}

	
	

	public orderViewDto(String ordDate, String receiver, String deliveryAddr, String receiverTel, int total,
			String cardBank, String cardNumber1, String cardNumber2, String cardNumber3, String cardNumber4, String ordDelivery, String deliveryDate) {
		super();
		this.ordDate = ordDate;
		this.receiver = receiver;
		this.deliveryAddr = deliveryAddr;
		this.receiverTel = receiverTel;
		this.total = total;
		this.cardBank = cardBank;
		this.cardNumber1 = cardNumber1;
		this.cardNumber2 = cardNumber2;
		this.cardNumber3 = cardNumber3;
		this.cardNumber4 = cardNumber4;
		this.ordDelivery = ordDelivery;
		this.deliveryDate = deliveryDate;
	}




	public orderViewDto(int ordQty, String prdNo) {
		super();
		this.ordQty = ordQty;
		this.prdNo = prdNo;
	}
	
	public orderViewDto(String prdNo) {
		super();
		this.prdNo = prdNo;
	}
	
	public orderViewDto(String prdName, int prdPrice) {
		super();
		this.prdName = prdName;
		this.prdPrice = prdPrice;
	}

	
	
	
	
	
	
	
	
	
	public String getCardNumber1() {
		return cardNumber1;
	}




	public void setCardNumber1(String cardNumber1) {
		this.cardNumber1 = cardNumber1;
	}




	public String getCardNumber2() {
		return cardNumber2;
	}




	public void setCardNumber2(String cardNumber2) {
		this.cardNumber2 = cardNumber2;
	}




	public String getCardNumber3() {
		return cardNumber3;
	}




	public void setCardNumber3(String cardNumber3) {
		this.cardNumber3 = cardNumber3;
	}




	public String getCardNumber4() {
		return cardNumber4;
	}




	public void setCardNumber4(String cardNumber4) {
		this.cardNumber4 = cardNumber4;
	}




	public String getOrdNo() {
		return ordNo;
	}

	public void setOrdNo(String ordNo) {
		this.ordNo = ordNo;
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

	public int getOrdQty() {
		return ordQty;
	}

	public void setOrdQty(int ordQty) {
		this.ordQty = ordQty;
	}

	public String getOrdDate() {
		return ordDate;
	}

	public void setOrdDate(String ordDate) {
		this.ordDate = ordDate;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getDeliveryAddr() {
		return deliveryAddr;
	}

	public void setDeliveryAddr(String deliveryAddr) {
		this.deliveryAddr = deliveryAddr;
	}

	public String getReceiverTel() {
		return receiverTel;
	}

	public void setReceiverTel(String receiverTel) {
		this.receiverTel = receiverTel;
	}

	public String getOrdDelivery() {
		return ordDelivery;
	}

	public void setOrdDelivery(String ordDelivery) {
		this.ordDelivery = ordDelivery;
	}

	public String getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getCardBank() {
		return cardBank;
	}

	public void setCardBank(String cardBank) {
		this.cardBank = cardBank;
	}

	public String getPrdNo() {
		return prdNo;
	}

	public void setPrdNo(String prdNo) {
		this.prdNo = prdNo;
	}

	
	
	
}
