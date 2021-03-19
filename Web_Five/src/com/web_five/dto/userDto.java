package com.web_five.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class userDto {
	
	// Field
	public static String userId;
	public static String userPw1;
	public static String userPw2;
	public static String userName;
	public static String userTel;
	public static String userAddress;
	public static String userEmail;
	public static String userBirth;
	public static int idCnt;
	
	public static String beforeUserTel1;
	public static String beforeUserTel2;
	public static String beforeUserTel3;
	public static String beforeUserEmail1;
	public static String beforeUserEmail2;
	public static String beforeUserAddress1;
	public static String beforeUserAddress2;
	public static String beforeUserAddress3;
	
	public static String CheckMsg;
	
	
	// Constructor

	
	
	public userDto(String userId) {
		super();
		this.userId = userId;
	}
	
	public userDto(String userId, String userName, String beforeUserAddress1, String beforeUserAddress2, String beforeUserAddress3, String beforeUserTel1, String beforeUserTel2, String beforeUserTel3) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.beforeUserAddress1 = beforeUserAddress1;
		this.beforeUserAddress2 = beforeUserAddress2;
		this.beforeUserAddress3 = beforeUserAddress3;
		this.beforeUserTel1 = beforeUserTel1;
		this.beforeUserTel2 = beforeUserTel2;
		this.beforeUserTel3 = beforeUserTel3;
	}
	
	public userDto() {
		
	}
	public userDto(String userId, String userPw, String userName, String userAddress, String userTel, String userEmail, String userBirth) {
		super();
		this.userId = userId;
		this.userPw2 = userPw;
		this.userName = userName;
		this.userBirth = userBirth;
		this.userAddress = userAddress;
		this.userTel = userTel;
		this.userEmail = userEmail;
	}

	public userDto(String userId, String userPw1, String userPw2, String userName,  String beforeUserAddress1, String beforeUserAddress2, String beforeUserAddress3, String beforeUserTel1, String beforeUserTel2, String beforeUserTel3, String beforeUserEmail1, String beforeUserEmail2, String userBirth) {
		super();
		this.userId = userId;
		this.userPw1 = userPw1;
		this.userPw2 = userPw2;
		this.userName = userName;
		this.beforeUserTel1= beforeUserTel1;
		this.beforeUserTel2= beforeUserTel2;
		this.beforeUserTel3= beforeUserTel3;
		this.beforeUserEmail1= beforeUserEmail1;
		this.beforeUserEmail2= beforeUserEmail2;
		this.beforeUserAddress1 = beforeUserAddress1;
		this.beforeUserAddress2 = beforeUserAddress2;
		this.beforeUserAddress3 = beforeUserAddress3;
		this.userBirth = userBirth;
	}


	public userDto(String userId, String userPw1, String userPw2, String userName, String userTel, String userAddress, String userEmail,
			String userBirth, String beforeUserTel1, String beforeUserTel2, String beforeUserTel3,
			String beforeUserEmail1, String beforeUserEmail2, String beforeUserAddress1, String beforeUserAddress2,
			String beforeUserAddress3, String CheckMsg) {
		super();
		this.userId = userId;
		this.userPw1 = userPw1;
		this.userPw2 = userPw2;
		this.userName = userName;
		this.userTel = userTel;
		this.userAddress = userAddress;
		this.userEmail = userEmail;
		this.userBirth = userBirth;
		this.beforeUserTel1 = beforeUserTel1;
		this.beforeUserTel2 = beforeUserTel2;
		this.beforeUserTel3 = beforeUserTel3;
		this.beforeUserEmail1 = beforeUserEmail1;
		this.beforeUserEmail2 = beforeUserEmail2;
		this.beforeUserAddress1 = beforeUserAddress1;
		this.beforeUserAddress2 = beforeUserAddress2;
		this.beforeUserAddress3 = beforeUserAddress3;
		this.CheckMsg = CheckMsg;
	}




	public userDto(int idCnt) {
		super();
		this.idCnt = idCnt;
	}
	
	
	

	
	
	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getBeforeUserTel1() {
		return beforeUserTel1;
	}


	public void setBeforeUserTel1(String beforeUserTel1) {
		this.beforeUserTel1 = beforeUserTel1;
	}


	public String getBeforeUserTel2() {
		return beforeUserTel2;
	}


	public void setBeforeUserTel2(String beforeUserTel2) {
		this.beforeUserTel2 = beforeUserTel2;
	}


	public String getBeforeUserTel3() {
		return beforeUserTel3;
	}


	public void setBeforeUserTel3(String beforeUserTel3) {
		this.beforeUserTel3 = beforeUserTel3;
	}


	public String getBeforeUserEmail1() {
		return beforeUserEmail1;
	}


	public void setBeforeUserEmail1(String beforeUserEmail1) {
		this.beforeUserEmail1 = beforeUserEmail1;
	}


	public String getBeforeUserEmail2() {
		return beforeUserEmail2;
	}


	public void setBeforeUserEmail2(String beforeUserEmail2) {
		this.beforeUserEmail2 = beforeUserEmail2;
	}


	public String getBeforeUserAddress1() {
		return beforeUserAddress1;
	}


	public void setBeforeUserAddress1(String beforeUserAddress1) {
		this.beforeUserAddress1 = beforeUserAddress1;
	}


	public String getBeforeUserAddress2() {
		return beforeUserAddress2;
	}


	public void setBeforeUserAddress2(String beforeUserAddress2) {
		this.beforeUserAddress2 = beforeUserAddress2;
	}


	public String getBeforeUserAddress3() {
		return beforeUserAddress3;
	}


	public void setBeforeUserAddress3(String beforeUserAddress3) {
		this.beforeUserAddress3 = beforeUserAddress3;
	}


	public String getUserId() {
		System.out.println("Dto userId : " + userId);
		return userId;
	}

	public void setUserId(String userId) {
		System.out.println("Dto set userId : " + userId);
		this.userId = userId;
	}

	
	
	public String getUserPw1() {
		return userPw1;
	}




	public void setUserPw1(String userPw1) {
		this.userPw1 = userPw1;
	}

	


	public String getUserPw2() {
		return userPw2;
	}




	public void setUserPw2(String userPw2) {
		this.userPw2 = userPw2;
	}




	public String getCheckMsg() {
		return CheckMsg;
	}




	public void setCheckMsg(String checkMsg) {
		CheckMsg = checkMsg;
	}




	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}


	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}


	public int getIdCnt() {
		return idCnt;
	}


	public void setIdCnt(int idCnt) {
		this.idCnt = idCnt;
	}
	
	
	
	
}
