package com.web_five.dto;

import java.sql.Timestamp;

public class RDto {
	//Field
	int goods_prdNo;	// 상품 번호
	int ordQty;			// 주문 수량
	String ordReview;	// 리뷰 쓰기
	String ordStar;	// 별점 쓰기
	String user_userId;	// 불러올 유저 아이디
	int orderinfo_ordNo;	// 주문 번호
	
		
		// Constructor
		public RDto() {
			// TODO Auto-generated constructor stub
		}

		

		public RDto(int goods_prdNo, int ordQty, String ordReview, String ordStar, String user_userId,
				int orderinfo_ordNo) {
			super();
			this.goods_prdNo = goods_prdNo;
			this.ordQty = ordQty;
			this.ordReview = ordReview;
			this.ordStar = ordStar;
			this.user_userId = user_userId;
			this.orderinfo_ordNo = orderinfo_ordNo;
		}



		public int getGoods_prdNo() {
			return goods_prdNo;
		}


		public void setGoods_prdNo(int goods_prdNo) {
			this.goods_prdNo = goods_prdNo;
		}


		public int getOrdQty() {
			return ordQty;
		}


		public void setOrdQty(int ordQty) {
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


		public String getUser_userId() {
			return user_userId;
		}


		public void setUser_userId(String user_userId) {
			this.user_userId = user_userId;
		}


		public int getOrderinfo_ordNo() {
			return orderinfo_ordNo;
		}


		public void setOrderinfo_ordNo(int orderinfo_ordNo) {
			this.orderinfo_ordNo = orderinfo_ordNo;
		}
		
		
	

}
