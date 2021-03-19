package com.web_five.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.web_five.dto.orderDto;
import com.web_five.dto.orderViewDto;

public class orderViewDao {
DataSource dataSource;
	
	public orderViewDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/team_five");
		
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public orderViewDto myOrderDetail_orderInfo(String ordNo) {
		String date1 = "";
		String Ddate1 = "";
		orderViewDto dtos = new orderViewDto();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		System.out.println("myOrderDetail_orderInfo ordNo : " + ordNo);
		try {
			connection = dataSource.getConnection();
			String query = "select ordDate, ordReceiver, ordRcvAddress, ordRcvPhone, ordPay, ordBank, ordCardNo, ordDelivery, ordDeliveryDate from orderinfo where ordNo = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, ordNo);
			
			resultSet = preparedStatement.executeQuery();
			System.out.println("구간1----------------");
			while(resultSet.next()) {
				System.out.println("구간1----------------");
				String ordDate = resultSet.getString(1);
				String ordReceiver = resultSet.getString(2);
				String ordRcvAddress = resultSet.getString(3);
				String ordRcvPhone = resultSet.getString(4);
				int ordPay = resultSet.getInt(5);
				String ordBank = resultSet.getString(6);
				String ordCardNo = resultSet.getString(7);
				String ordDelivery = resultSet.getString(8);
				String ordDeliveryDate = resultSet.getString(9);
				System.out.println("배송날짜 : " +  ordDeliveryDate);
				
				
				if(ordDate.contains(" ")) {
					String date[] = ordDate.split(" ");
					date1 = date[0];
				}else {
					date1 = ordDate;
				}
				
				if(ordDeliveryDate == null) {
					Ddate1 = "";
				}else if(ordDeliveryDate.contains("-")) {
					String Ddate[] = ordDeliveryDate.split(" ");
					Ddate1 = Ddate[0];
				}
				
				System.out.println(Ddate1);
			
				
				String cardNo[] = ordCardNo.split("-");
				String cardNo1 = cardNo[0];
				String cardNo2 = cardNo[1];
				String cardNo3 = cardNo[2];
				String cardNo4 = cardNo[3];
				System.out.println(cardNo1);
				System.out.println(cardNo2);
				System.out.println(cardNo3);
				System.out.println(cardNo4);
				
				orderViewDto dto = new orderViewDto(date1, ordReceiver, ordRcvAddress, ordRcvPhone, ordPay, ordBank, cardNo1, cardNo2, cardNo3, cardNo4, ordDelivery, Ddate1);
			}
			System.out.println("ordinfo 조회 성공");
			System.out.println("구간1----------------");
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("ordinfo 조회 실패");
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
	
	public orderViewDto myOrderDetail_Product(String prdNo) {
		orderViewDto dtos = new orderViewDto();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		System.out.println("myOrderDetail_Product prdNo : " + prdNo);
		try {
			connection = dataSource.getConnection();
			String query = "select prdName, prdPrice from product where prdNo = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, prdNo);
			
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				String prdName = resultSet.getString("prdName");
				int prdPrice = resultSet.getInt("prdPrice");
				
	
				orderViewDto dto = new orderViewDto(prdName, prdPrice);
			}
			System.out.println("prdName, prdPrice 조회 성공");
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("prdName, prdPrice 조회 실패");
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
	
	public String myOrderDetail_prdNo(String prdName) {
		String prdNo = "";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		System.out.println("myOrderDetail_Product prdName : " + prdName);
		try {
			connection = dataSource.getConnection();
			String query = "select prdNo from product where prdName = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, prdName);
			
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				prdNo = resultSet.getString("prdNo");
				
	
			}
			System.out.println("prdNo 조회 성공");
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("prdNo 조회 실패");
		}finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return prdNo;
	}
	
	public orderViewDto myOrderDetail_orderDetail(String prdNo, String ordNo) {
		orderViewDto dtos = new orderViewDto();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		System.out.println("myOrderDetail_Product prdNo : " + prdNo);
		
		try {
			connection = dataSource.getConnection();
			String query = "select ordQty from orderdetail where goods_prdNo = ? and orderinfo_ordNo = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, prdNo);
			preparedStatement.setString(2, ordNo);
			
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				int ordQty = resultSet.getInt("ordQty");
				
	
				orderViewDto dto = new orderViewDto(ordQty, prdNo);
			}
			System.out.println("ordQty 조회 성공");
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("ordQty 조회 실패");
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
	
	
	
}
