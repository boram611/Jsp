package com.web_five.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.web_five.dto.userDto;

public class joinUsDao {
	
	DataSource dataSource;
	
	public joinUsDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/team_five");
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public int check_DuplicatedId(String userId) {
		userDto dto = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		System.out.println(userId);
		int cnt = 3;
		System.out.println("아이디 중복체크 아이디 : " + userId);
		try {
			connection = dataSource.getConnection();
			String query = "select count(*) as cnt from user where userId = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, userId);
			
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				cnt = resultSet.getInt("cnt"); // 컬럼명을 적어도 상관없다.
				System.out.println("아이디 중복체크 cnt : " + cnt);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}
	
	public int check_DuplicatedEmail(String userEmail) {
		userDto dto = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		System.out.println(userEmail);
		int cnt = 3;
		System.out.println("이메일 중복체크 이메일 : " + userEmail);
		try {
			connection = dataSource.getConnection();
			String query = "select count(*) as cnt from user where userEmail = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, userEmail);
			
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				cnt = resultSet.getInt("cnt"); // 컬럼명을 적어도 상관없다.
				System.out.println("이메일 중복체크 결과 : " + cnt);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}
	
	public void insertUserInfo(String userId, String userPw, String userName, String userAddress, String userTel, String userEmail, String userBirth) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		userDto dto = new userDto();
	
		try {
			connection = dataSource.getConnection();
			String query = "insert into user (userId, userPw, userName, userAddress, userTel, userEmail, userBirth, insertDate) values (?, ?, ?, ?, ?, ?, ?, now())";
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setString(1, dto.getUserId());
			preparedStatement.setString(2, dto.getUserPw2());
			preparedStatement.setString(3, dto.getUserName());
			preparedStatement.setString(4, dto.getUserAddress());
			preparedStatement.setString(5, dto.getUserTel());
			preparedStatement.setString(6, dto.getUserEmail());
			preparedStatement.setString(7, dto.getUserBirth());
			preparedStatement.executeUpdate();
			
			
			
			System.out.println("가입성공");
		}catch(Exception e) {
			
			System.out.println("가입실패");
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
	
	public void insertCartInfo(String userId) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		userDto dto = new userDto();
	
		try {
			connection = dataSource.getConnection();
			String query = "insert into cartinfo (user_userId, cartDate, cartTotalPrice) values (?, now(), 0)";
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setString(1, userId);
			preparedStatement.executeUpdate();
			
			
			
			System.out.println("장바구니 가입 성공");
		}catch(Exception e) {
			
			System.out.println("장바구니 가입 실패");
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
