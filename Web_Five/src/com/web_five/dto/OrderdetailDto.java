package com.web_five.dto;

public class OrderdetailDto {
	String orderinfo_ordNo;
	String goods_prdNo;
	String user_userId;
	String ordQty;
	String ordReview;
	String ordStar;
	String ordRefund;
	
	public OrderdetailDto() {
		
	}
	
	public OrderdetailDto(String orderinfo_ordNo, String goods_prdNo, String user_userId, String ordQty,
			String ordReview, String ordStar, String ordRefund) {
		super();
		this.orderinfo_ordNo = orderinfo_ordNo;
		this.goods_prdNo = goods_prdNo;
		this.user_userId = user_userId;
		this.ordQty = ordQty;
		this.ordReview = ordReview;
		this.ordStar = ordStar;
		this.ordRefund = ordRefund;
	}

	public String getOrderinfo_ordNo() {
		return orderinfo_ordNo;
	}

	public void setOrderinfo_ordNo(String orderinfo_ordNo) {
		this.orderinfo_ordNo = orderinfo_ordNo;
	}

	public String getGoods_prdNo() {
		return goods_prdNo;
	}

	public void setGoods_prdNo(String goods_prdNo) {
		this.goods_prdNo = goods_prdNo;
	}

	public String getUser_userId() {
		return user_userId;
	}

	public void setUser_userId(String user_userId) {
		this.user_userId = user_userId;
	}

	public String getOrdQty() {
		return ordQty;
	}

	public void setOrdQty(String ordQty) {
		this.ordQty = ordQty;
	}

	public String getOrdReview() {
		return ordReview;
	}

	public void setOrdReview(String ordReview) {
		this.ordReview = ordReview;
	}

	public String getOrdStar() {
		return ordStar;
	}

	public void setOrdStar(String ordStar) {
		this.ordStar = ordStar;
	}

	public String getOrdRefund() {
		return ordRefund;
	}

	public void setOrdRefund(String ordRefund) {
		this.ordRefund = ordRefund;
	}
	
	

}
