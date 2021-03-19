package com.web_five.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.web_five.dto.userDto;

public class findDao {
	DataSource dataSource;
	
		public findDao() {
			try {
				Context context = new InitialContext();
				dataSource = (DataSource) context.lookup("java:comp/env/jdbc/team_five");
			
			}catch(Exception e){
				e.printStackTrace();
			}
	}
		
		public String findId(String inputEmail1, String inputBirth) {
			String id = "";
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			System.out.println("id찾기 이메일 : " + inputEmail1);
			System.out.println("id찾기 생년월일 : " + inputEmail1);
			try {
				connection = dataSource.getConnection();
				String query = "select userId from user where userEmail = ? and userBirth = ?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, inputEmail1);
				preparedStatement.setString(2, inputBirth);
				
				resultSet = preparedStatement.executeQuery();
				
				while(resultSet.next()) {
					id = resultSet.getString("userId"); // 컬럼명을 적어도 상관없다.
					
					System.out.println("찾는 id는 : " + id);
					if(id == null) {
						id = "";
					}
					
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
			return id;
		}
		
		public String findPw(String inputEmail1, String inputBirth, String inputId) {
			String pw = "";
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			System.out.println("id찾기 이메일 : " + inputEmail1);
			System.out.println("id찾기 생년월일 : " + inputEmail1);
			try {
				connection = dataSource.getConnection();
				String query = "select userPw from user where userEmail = ? and userBirth = ? and userId = ?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, inputEmail1);
				preparedStatement.setString(2, inputBirth);
				preparedStatement.setString(3, inputId);
				
				resultSet = preparedStatement.executeQuery();
				
				while(resultSet.next()) {
					pw = resultSet.getString("userPw"); // 컬럼명을 적어도 상관없다.
					
					System.out.println("찾는 pw는 : " + pw);
					if(pw == null) {
						pw = "";
					}
					
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
			return pw;
		}
}
