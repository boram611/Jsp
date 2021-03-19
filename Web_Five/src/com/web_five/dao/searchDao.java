package com.web_five.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.web_five.dto.prdDto;

public class searchDao {
	
	DataSource dataSource;
	
	public searchDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/team_five");	
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<prdDto> searchaction(String search){
		ArrayList<prdDto> prdDto = new ArrayList<prdDto>();
		Connection connection = null;
		ResultSet resultSet = null;
		PreparedStatement preparedStatement = null;
	
		
		try {
		
			connection = dataSource.getConnection();
			String query = "select prdNo,prdName,ctgType,prdPrice,prdFilename,prdStock from product where prdName like '%"+ search + "%' or ctgType like '%"+ search+ "%'";
			preparedStatement = connection.prepareStatement(query);
			resultSet =preparedStatement.executeQuery();
		
			
			while(resultSet.next()) {

				int prdNo =resultSet.getInt("prdNo");
				String prdName = resultSet.getString("prdName");
				String ctgType = resultSet.getString("ctgType");
				int prdPrice = resultSet.getInt("prdPrice");
				String prdFilename = resultSet.getString("prdFilename");
				int prdStock = resultSet.getInt("prdStock");
				
				System.out.println("dto : " + prdName);
				System.out.println("dto : " + ctgType);
				prdDto ddto = new prdDto(prdNo,prdName,ctgType,prdPrice,prdFilename,prdStock);
				prdDto.add(ddto);
				
	}
			
		}catch(Exception e) {
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
		return prdDto;
	}
	

}//-----------------------
