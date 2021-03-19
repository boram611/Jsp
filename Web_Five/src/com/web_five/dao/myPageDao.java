package com.web_five.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.web_five.dto.userDto;

import sun.security.util.ArrayUtil;

public class myPageDao {
	DataSource dataSource;
	
		public myPageDao() {
			try {
				Context context = new InitialContext();
				dataSource = (DataSource) context.lookup("java:comp/env/jdbc/team_five");
			
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		public userDto showUserInfo(String loginId) {
			userDto dtos = new userDto();
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			System.out.println("userDao longinId : " + loginId);
			try {
				connection = dataSource.getConnection();
				String query = "select userId, userPw, userName, userAddress, userTel, userEmail, userBirth from user where userId = ?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, loginId);
				
				resultSet = preparedStatement.executeQuery();
				
				while(resultSet.next()) {
					String userId = resultSet.getString("userId");
					String userPw = resultSet.getString("userPw");
					String userName = resultSet.getString("userName");
					String userAddress = resultSet.getString("userAddress");
					String userTel = resultSet.getString("userTel");
					String userEmail = resultSet.getString("userEmail");
					String userBirth = resultSet.getString("userBirth");
					
					String telNumber[] = userTel.split("-");
					String tel1 = telNumber[0];
					String tel2 = telNumber[1];
					String tel3 = telNumber[2];
					
					String address[] = userAddress.split(", ");
					String addr1 = address[0];
					String addr2 = address[1];
					String addr3 = address[2];
					
					String email[] = userEmail.split("@");
					String email1 = email[0];
					String email2 = email[1];
					
					userDto dto = new userDto(userId, userPw, userPw, userName, addr1, addr2, addr3, tel1, tel2, tel3, email1, email2, userBirth);
				}
				System.out.println("유저정보 조회 성공");
				
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("유저정보 조회 실패");
			}finally {
				try {
					if(resultSet != null) resultSet.close();
					if(preparedStatement != null) preparedStatement.close();
					if(connection != null) connection.close();
					
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			return dtos;
		}
		public void updateProfile(String userId, String userPw, String userName, String userBrith, String userAddress, String userTel, String userEmail) {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			
			try {
				connection = dataSource.getConnection();
				String query = "update user set userPw = ?, userName = ?, userAddress = ?, userTel = ?, userEmail = ?, userBirth = ? where userId = ?";
				preparedStatement = connection.prepareStatement(query);
				
				preparedStatement.setString(1, userPw);
				preparedStatement.setString(2, userName);
				preparedStatement.setString(3, userAddress);
				preparedStatement.setString(4, userTel);
				preparedStatement.setString(5, userEmail);
				preparedStatement.setString(6, userBrith);
				preparedStatement.setString(7, userId);
				preparedStatement.executeUpdate();
				
				
				
				System.out.println("유저정보 업데이트 성공");
			}catch(Exception e) {
				System.out.println("유저정보 업데이트 실패");
				e.printStackTrace();
			}finally {
				try {
					if(preparedStatement != null) preparedStatement.close();
					if(connection != null) connection.close();
					
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		public void deleteUserInfo(String userId) {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			
			try {
				connection = dataSource.getConnection();
				String query = "update user set deleteDate = now() where userId = ?";
				preparedStatement = connection.prepareStatement(query);
				
				preparedStatement.setString(1, userId);
				preparedStatement.executeUpdate();
				
				
				
				System.out.println("유저정보 삭제 성공");
			}catch(Exception e) {
				System.out.println("유저정보 삭제 실패");
				e.printStackTrace();
			}finally {
				try {
					if(preparedStatement != null) preparedStatement.close();
					if(connection != null) connection.close();
					
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
}
