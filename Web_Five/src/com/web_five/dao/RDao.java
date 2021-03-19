package com.web_five.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.web_five.dto.RDto;

public class RDao {

	//Field
		DataSource dataSource;
		
		// Constructor
		public RDao() {
			try {
				Context context = new InitialContext();
				dataSource = (DataSource) context.lookup("java:comp/env/jdbc/team_five");
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		//****************************************
		//Method
		//********상품에 따른 리뷰 보여주는 메소드 **********
		public ArrayList<RDto> reviewList(String str_goods_prdNo){
			ArrayList<RDto> dtos = new ArrayList<RDto>();
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			System.out.println("reviewList 상품번호 : " + str_goods_prdNo);
			try {
				connection = dataSource.getConnection();
				String query = "SELECT * FROM orderdetail WHERE not ordStar is null and goods_prdNo = ?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(1, Integer.parseInt(str_goods_prdNo));
				resultSet = preparedStatement.executeQuery();
				
				/*불러올 데이터가 있으면 while문 실행*/
				while(resultSet.next()) {
					int goods_prdNo = resultSet.getInt("goods_prdNo");
					int ordQty = resultSet.getInt("ordQty");
					String ordReview = resultSet.getString("ordReview");
					String ordStar = resultSet.getString("ordStar");
					String user_userId = resultSet.getString("user_userId");
					int orderinfo_ordNo = resultSet.getInt("orderinfo_ordNo");
					
					RDto dto = new RDto(goods_prdNo, ordQty, ordReview, ordStar, user_userId, orderinfo_ordNo);
					dtos.add(dto);
				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally {	//에러가 걸리든 걸리지 않든 오는 곳 
				try {
					/*정보가 들어있으면 모두 지우라는 뜻 */
					if(resultSet != null) resultSet.close();
					if(preparedStatement != null) preparedStatement.close();
					if(connection != null) connection.close();
					
				}catch (Exception e) {
					e.printStackTrace();
				}
			}return dtos;
		}	//UserList() method 끝 
		
		
		//******* 내가쓴 리뷰만 리스트로 보여주기 **********
				public ArrayList<RDto> UserDList(String userId){
					ArrayList<RDto> dtos = new ArrayList<RDto>();
					Connection connection = null;
					PreparedStatement preparedStatement = null;
					ResultSet resultSet = null;
					try {
						connection = dataSource.getConnection();
						String query = "SELECT * FROM orderdetail WHERE not ordStar is null and user_userId = '" + userId + "'" ;
						preparedStatement = connection.prepareStatement(query);
						resultSet = preparedStatement.executeQuery();
						
						/*불러올 데이터가 있으면 while문 실행*/
						while(resultSet.next()) {
							int goods_prdNo = resultSet.getInt("goods_prdNo");
							int ordQty = resultSet.getInt("ordQty");
							String ordReview = resultSet.getString("ordReview");
							String ordStar = resultSet.getString("ordStar");
							String user_userId = resultSet.getString("user_userId");
							int orderinfo_ordNo = resultSet.getInt("orderinfo_ordNo");
							
							RDto dto = new RDto(goods_prdNo, ordQty, ordReview, ordStar, user_userId, orderinfo_ordNo);
							dtos.add(dto);
						}
						
					}catch (Exception e) {
						e.printStackTrace();
					}finally {	//에러가 걸리든 걸리지 않든 오는 곳 
						try {
							/*정보가 들어있으면 모두 지우라는 뜻 */
							if(resultSet != null) resultSet.close();
							if(preparedStatement != null) preparedStatement.close();
							if(connection != null) connection.close();
							
						}catch (Exception e) {
							e.printStackTrace();
						}
					}return dtos;
				}	//UserDList() method 끝 
				
				
				//********사용자가 리뷰를 쓰고 저장하는 메소드 **********
				public void noticeWrite(String ordReview, String ordStart, String user_userId) {
					Connection connection = null;
					PreparedStatement preparedStatement = null;
					
					try {
						connection = dataSource.getConnection();
						String query = "insert into orderdetail (ordReview, ordStart, user_userId) values (?, ?, ?)";
						preparedStatement = connection.prepareStatement(query);
						preparedStatement.setString(1, ordReview);
						preparedStatement.setString(2, ordStart);
						preparedStatement.setString(3, user_userId);
						preparedStatement.executeUpdate();
						
					}catch (Exception e) {
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
				}	//noticeWrite() method 끝 
						
				public ArrayList<String> avgOrdStar(String goods_prdNo) {
					ArrayList<String>arrayList = new ArrayList<String>();
					
					String sql = "select ordStar from orderdetail where not ordStar is null and goods_prdNo = '" + goods_prdNo + "'";
					String ordStar = "";
					Connection connection = null;
					PreparedStatement preparedStatement = null;
					ResultSet resultSet =null;
					try {
						connection = dataSource.getConnection();
						preparedStatement = connection.prepareStatement(sql);
						resultSet = preparedStatement.executeQuery();

						
						while (resultSet.next()) {
							ordStar=resultSet.getString(1);
							
							arrayList.add(ordStar);
						} 
						

					} catch (SQLException e) {
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
					return arrayList;
				}	
}
