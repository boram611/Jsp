package com.web_five.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class changeStatusDao {
	DataSource dataSource;
	
	public changeStatusDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/team_five");
		
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void updateDelivery(int ordNo, String purchaseOk) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "update orderinfo set ordDelivery = ?  where ordNo = ?";
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setString(1, purchaseOk);
			preparedStatement.setInt(2, ordNo);
			preparedStatement.executeUpdate();
			
			
			
			System.out.println("구매 확정 업데이트 성공");
		}catch(Exception e) {
			System.out.println("구매 확정 업데이트 실패");
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
	
	
	
	public void updateNewReview(int ordNo, int prdNo, String userId, String star, String content) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "update orderdetail set ordReview = ?, ordStar = ? where user_userId = ? and orderinfo_ordNo = ? and goods_prdNo = ?";
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setString(1, content);
			preparedStatement.setString(2, star);
			preparedStatement.setString(3, userId);
			preparedStatement.setInt(4, ordNo);
			preparedStatement.setInt(5, prdNo);
			preparedStatement.executeUpdate();
			
			
			
			System.out.println("리뷰 쓰기 업데이트 성공");
		}catch(Exception e) {
			System.out.println("리뷰 쓰기 업데이트 실패");
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
