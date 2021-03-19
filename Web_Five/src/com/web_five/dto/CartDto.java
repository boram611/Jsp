package com.web_five.dto;

public class CartDto {
	
	String cartNo;
	String user_userId;
	String cartDate;
	int cartTotalPrice;
	int cartQty;
	String goods_prdNo;
	String userId;
	String dcartNo;
	String cartinfo_cartNo;
	String ctgType;
	String prdNo;
	String prdName;
	int prdPrice;
	String prdStock;
	String prdContent;
	String prdAFilename;
	String prdFilename;
	String prdDFilename;
	
	public CartDto() {
		
	}

	public CartDto(String cartNo, String user_userId, String cartDate, int cartTotalPrice, int cartQty,
			String goods_prdNo, String userId, String dcartNo, String cartinfo_cartNo, String ctgType, String prdNo,
			String prdName, int prdPrice, String prdStock, String prdContent, String prdAFilename, String prdFilename,
			String prdDFilename) {
		super();
		this.cartNo = cartNo;
		this.user_userId = user_userId;
		this.cartDate = cartDate;
		this.cartTotalPrice = cartTotalPrice;
		this.cartQty = cartQty;
		this.goods_prdNo = goods_prdNo;
		this.userId = userId;
		this.dcartNo = dcartNo;
		this.cartinfo_cartNo = cartinfo_cartNo;
		this.ctgType = ctgType;
		this.prdNo = prdNo;
		this.prdName = prdName;
		this.prdPrice = prdPrice;
		this.prdStock = prdStock;
		this.prdContent = prdContent;
		this.prdAFilename = prdAFilename;
		this.prdFilename = prdFilename;
		this.prdDFilename = prdDFilename;
	}

	public String getCartNo() {
		return cartNo;
	}

	public void setCartNo(String cartNo) {
		this.cartNo = cartNo;
	}

	public String getUser_userId() {
		return user_userId;
	}

	public void setUser_userId(String user_userId) {
		this.user_userId = user_userId;
	}

	public String getCartDate() {
		return cartDate;
	}

	public void setCartDate(String cartDate) {
		this.cartDate = cartDate;
	}

	public int getCartTotalPrice() {
		return cartTotalPrice;
	}

	public void setCartTotalPrice(int cartTotalPrice) {
		this.cartTotalPrice = cartTotalPrice;
	}

	public int getCartQty() {
		return cartQty;
	}

	public void setCartQty(int cartQty) {
		this.cartQty = cartQty;
	}

	public String getGoods_prdNo() {
		return goods_prdNo;
	}

	public void setGoods_prdNo(String goods_prdNo) {
		this.goods_prdNo = goods_prdNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getDcartNo() {
		return dcartNo;
	}

	public void setDcartNo(String dcartNo) {
		this.dcartNo = dcartNo;
	}

	public String getCartinfo_cartNo() {
		return cartinfo_cartNo;
	}

	public void setCartinfo_cartNo(String cartinfo_cartNo) {
		this.cartinfo_cartNo = cartinfo_cartNo;
	}

	public String getCtgType() {
		return ctgType;
	}

	public void setCtgType(String ctgType) {
		this.ctgType = ctgType;
	}

	public String getPrdNo() {
		return prdNo;
	}

	public void setPrdNo(String prdNo) {
		this.prdNo = prdNo;
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

	public String getPrdAFilename() {
		return prdAFilename;
	}

	public void setPrdAFilename(String prdAFilename) {
		this.prdAFilename = prdAFilename;
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
