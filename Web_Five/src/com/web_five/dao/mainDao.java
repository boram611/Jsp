package com.web_five.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.web_five.dto.NDto;
import com.web_five.dto.prdDto;

public class mainDao {
	
	DataSource dataSource;
	
	public mainDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/team_five");	
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<prdDto> real(){
		ArrayList<prdDto> prdDto = new ArrayList<prdDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		
		try {
			connection = dataSource.getConnection();
			String query = "select prdNo, prdFilename, prdName , prdPrice from orderdetail o, product p where p.prdNo = o.goods_prdNo order by ordQty desc limit 5;";
			preparedStatement = connection.prepareStatement(query);
			resultSet =preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				int prdNo =resultSet.getInt("prdNo");
				String prdName = resultSet.getString("prdName");
				int prdPrice = resultSet.getInt("prdPrice");
				String prdFilename = resultSet.getString("prdFilename");
				
				
				prdDto dtos = new prdDto(prdNo, prdName, prdPrice, prdFilename);
				prdDto.add(dtos);
				
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
	
	
	public ArrayList<prdDto> nw(){
		ArrayList<prdDto> prdDto = new ArrayList<prdDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		
		try {
			connection = dataSource.getConnection();
			String query = "select prdNo, prdFilename, prdName , prdPrice from  product p where p.prdNo order by prdNo desc limit 5;";
			preparedStatement = connection.prepareStatement(query);
			resultSet =preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				int prdNo =resultSet.getInt("prdNo");
				String prdName = resultSet.getString("prdName");
				int prdPrice = resultSet.getInt("prdPrice");
				String prdFilename = resultSet.getString("prdFilename");
				
				
				prdDto dto = new prdDto( prdNo,prdName, prdPrice, prdFilename);
				prdDto.add(dto);
				
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
	
	public ArrayList<NDto> noticeView(){
		ArrayList<NDto> NDto = new ArrayList<NDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet =null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select nSeqno,nTitle,nContent,nDate,admin_adminId from notice  order by nSeqno desc";
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				int nSeqno = resultSet.getInt("nSeqno");
				String nTitle = resultSet.getString("nTitle");
				String nContent = resultSet.getString("nContent");
				Timestamp nDate = resultSet.getTimestamp("nDate");
				String admin_adminId = resultSet.getString("admin_adminId");
				
				
				NDto dtos =new NDto(nSeqno, nTitle, nContent, nDate, admin_adminId);
				NDto.add(dtos);
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
		return NDto;
	}
	
	
	
}//-----------------------
