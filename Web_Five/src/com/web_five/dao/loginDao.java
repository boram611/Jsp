package com.web_five.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class loginDao {
	
	DataSource dataSource;
	int result = 0;
	
	public loginDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/team_five");	
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userId,String userPw) {
		Connection connection = null;
		ResultSet resultSet = null;
		PreparedStatement preparedStatement = null;
		
//		String Log_userId = null;
//		String Log_userPw = null;
		try {
			connection = dataSource.getConnection();
			String query = "select * from user where userId = '"+ userId+"' and userPw = '" + userPw + "' and deleteDate is null";
			preparedStatement = connection.prepareStatement(query);
			resultSet =preparedStatement.executeQuery();
			
				if(resultSet.next() == true) {
	
					result = 0;
				}else {
					result = 1;
				}
			
		
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(resultSet !=null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
				
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println(result);
		return result;
	}
	
	public int adminlogin(String userId,String userPw) {
		Connection connection = null;
		ResultSet resultSet = null;
		PreparedStatement preparedStatement = null;
		
//		String Log_userId = null;
//		String Log_userPw = null;
		try {
			connection = dataSource.getConnection();
			String query = "select * from admin where adminId = '"+ userId+"' and adminPw = '" + userPw + "'";
			preparedStatement = connection.prepareStatement(query);
			resultSet =preparedStatement.executeQuery();
			
				if(resultSet.next() == true) {
	
					result = 2;
				}else {
					result = 3;
				}
			
		
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(resultSet !=null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
				
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println(result);
		return result;
	}
	
}//----------------------
