package com.web_five.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.web_five.dto.OrderdetailDto;






public class OrderdetailDao {
	
	DataSource dataSource;
	
	public OrderdetailDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/team_five");
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	////외부에서 생성을 못하도록 Default생성자는 private으로 선언합니다. 

	private static OrderdetailDao instance = new OrderdetailDao();

	public static OrderdetailDao getInstance() {
		return instance;

	}
	
	public ArrayList<OrderdetailDto> manageDeliveryViewDetail(String ordNo, String user_userId) {
		ArrayList<OrderdetailDto> dtos = new ArrayList<OrderdetailDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet =null;
		StringBuffer sql=new StringBuffer();
		sql.append("select * from orderdetail where orderinfo_ordNo = ? and user_userId = ?");
		SimpleDateFormat sdf = new SimpleDateFormat();
		try {
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(sql.toString());
			preparedStatement.setString(1, ordNo);
			preparedStatement.setString(2, user_userId);
			
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				OrderdetailDto dto = new OrderdetailDto();
				dto.setOrderinfo_ordNo(resultSet.getString("orderinfo_ordNo"));
				dto.setUser_userId(resultSet.getString("user_userId"));
				dto.setGoods_prdNo(resultSet.getString("goods_prdNo"));
				dto.setOrdQty(resultSet.getString("ordQty"));
				dto.setOrdRefund(resultSet.getString("ordRefund"));
				dto.setOrdReview(resultSet.getString("ordReview"));
				dto.setOrdStar(resultSet.getString("ordStar"));
				dtos.add(dto);
				System.out.println(resultSet.getString("goods_prdNo"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dtos;
	}
	
	public void insertDetail(int CartQty, String Goods_prdNo, String User_userId, int ordNo) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		System.out.println("들어가나요??????????????????????????");
		System.out.println("CartQty : " + CartQty);
		System.out.println("Goods_prdNo : " + Goods_prdNo);
		System.out.println("User_userId : " + User_userId);
		System.out.println("ordNo : " + ordNo);
					
		try {
			connection = dataSource.getConnection();
			String query = "insert into orderdetail (user_userId, goods_prdNo, ordQty, orderinfo_ordNo) values (?, ?, ?, ?)";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, User_userId);
			preparedStatement.setString(2, Goods_prdNo);
			preparedStatement.setInt(3, CartQty);
			preparedStatement.setInt(4, ordNo);
			preparedStatement.executeUpdate();
			
						
						
		} catch (Exception e) {
			System.out.println("recUpdate : " + e);
			e.printStackTrace();
		}finally {	//에러가 걸리든 걸리지 않든 오는 곳 
			try {
				/*정보가 들어있으면 모두 지우라는 뜻 */
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
							
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
