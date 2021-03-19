package com.web_five.dto;

import java.sql.Timestamp;

public class UDto {
	//Field
		String userId;
		String userPw;
		String userName;
		String userAddress;
		String userZipno;
		String userRoadAddr;
		String userAddrDetail;
		String userTel;
		String userEmail;
		String userBirth;
		Timestamp insertDate;
		Timestamp deleteDate;
		
		// Constructor
		public UDto() {
			// TODO Auto-generated constructor stub
		}
		
		
		public UDto(String userId, String userName, String userTel, String userEmail, Timestamp insertDate,
				Timestamp deleteDate) {
			super();
			this.userId = userId;
			this.userName = userName;
			this.userTel = userTel;
			this.userEmail = userEmail;
			this.insertDate = insertDate;
			this.deleteDate = deleteDate;
		}


		public UDto(String userId, String userPw, String userName, String userAddress,
				 String userTel, String userEmail, String userBirth, Timestamp insertDate) {
			super();
			this.userId = userId;
			this.userPw = userPw;
			this.userName = userName;
			this.userAddress = userAddress;
			this.userTel = userTel;
			this.userEmail = userEmail;
			this.userBirth = userBirth;
			this.insertDate = insertDate;
		}
		
		

		

		public UDto(String userId, String userPw, String userName, String userZipno, String userRoadAddr,
				String userAddrDetail, String userTel, String userEmail, String userBirth, Timestamp insertDate) {
			super();
			this.userId = userId;
			this.userPw = userPw;
			this.userName = userName;
			this.userZipno = userZipno;
			this.userRoadAddr = userRoadAddr;
			this.userAddrDetail = userAddrDetail;
			this.userTel = userTel;
			this.userEmail = userEmail;
			this.userBirth = userBirth;
			this.insertDate = insertDate;
		}


		public String getUserZipno() {
			return userZipno;
		}


		public void setUserZipno(String userZipno) {
			this.userZipno = userZipno;
		}


		public String getUserRoadAddr() {
			return userRoadAddr;
		}


		public void setUserRoadAddr(String userRoadAddr) {
			this.userRoadAddr = userRoadAddr;
		}


		public String getUserAddrDetail() {
			return userAddrDetail;
		}


		public void setUserAddrDetail(String userAddrDetail) {
			this.userAddrDetail = userAddrDetail;
		}


		public String getUserId() {
			return userId;
		}

		public void setUserId(String userId) {
			this.userId = userId;
		}

		public String getUserPw() {
			return userPw;
		}

		public void setUserPw(String userPw) {
			this.userPw = userPw;
		}

		public String getUserName() {
			return userName;
		}

		public void setUserName(String userName) {
			this.userName = userName;
		}

		

		public String getUserAddress() {
			return userAddress;
		}


		public void setUserAddress(String userAddress) {
			this.userAddress = userAddress;
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

		public Timestamp getInsertDate() {
			return insertDate;
		}

		public void setInsertDate(Timestamp insertDate) {
			this.insertDate = insertDate;
		}

		public Timestamp getDeleteDate() {
			return deleteDate;
		}

		public void setDeleteDate(Timestamp deleteDate) {
			this.deleteDate = deleteDate;
		}
				
		

}
