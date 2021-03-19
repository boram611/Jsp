package com.web_five.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.web_five.dto.NDto;
import com.web_five.dto.UDto;
import com.web_five.dto.userDto;

public class UDao {

	//Field
		DataSource dataSource;
		
		// Constructor
		public UDao() {
			try {
				Context context = new InitialContext();
				dataSource = (DataSource) context.lookup("java:comp/env/jdbc/team_five");
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		private static UDao instance = new UDao();

		public static UDao getInstance() {
			return instance;

		}
		
		
		// 게시판의 전체 글 수를 가져오는 메서드
			public int getBoardCount() {
				String sql = "select count(*) from user";

				Connection connection = null;
				PreparedStatement preparedStatement = null;
				ResultSet resultSet =null;
				int NoticeCount=0;
				try {
					connection = dataSource.getConnection();
					preparedStatement = connection.prepareStatement(sql); // '?'바인드를 사용해서 sql문을 효과 적으로
					resultSet = preparedStatement.executeQuery();

					
					if (resultSet.next()) {
						NoticeCount=resultSet.getInt(1); // 전체 글 개수
					} // if

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
				return NoticeCount;
			}
		
		// 리스트 띄우기 
		public ArrayList<UDto> UserList(int page, int pageSize){
			int startNum=((page-1)*pageSize);
			ArrayList<UDto> dtos = new ArrayList<UDto>();
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet =null;
			StringBuffer sql=new StringBuffer();
			sql.append("select @ROWNUM := @ROWNUM + 1 as rno, m.* from user m, (select @rownum :=0) tmp where deleteDate IS NULL ORDER BY rno LIMIT ?, ?");
			try {
				connection = dataSource.getConnection();
				preparedStatement = connection.prepareStatement(sql.toString());
				preparedStatement.setInt(1, startNum);
				preparedStatement.setInt(2, pageSize);
				resultSet = preparedStatement.executeQuery();
				
				while(resultSet.next()) {
					UDto dto = new UDto();
					dto.setUserId(resultSet.getString("userId"));
					dto.setUserPw(resultSet.getString("userPw"));
					dto.setUserName(resultSet.getString("userName"));
					dto.setUserAddress(resultSet.getString("userAddress"));
					dto.setUserTel(resultSet.getString("userTel"));
					dto.setUserEmail(resultSet.getString("userEmail"));
					dto.setUserBirth(resultSet.getString("userBirth"));
					dto.setInsertDate(resultSet.getTimestamp("insertDate"));
					
					
					dtos.add(dto);
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
		
		
		
		
		//*******탈퇴 회원 리스트 보여주는 메소드 **********
				public ArrayList<UDto> UserDList(){
					ArrayList<UDto> dtos = new ArrayList<UDto>();
					Connection connection = null;
					PreparedStatement preparedStatement = null;
					ResultSet resultSet = null;
					try {
						connection = dataSource.getConnection();
						String query = "SELECT * FROM user WHERE deleteDate IS NOT NULL";
						preparedStatement = connection.prepareStatement(query);
						resultSet = preparedStatement.executeQuery();
						
						/*불러올 데이터가 있으면 while문 실행*/
						while(resultSet.next()) {
							String userId = resultSet.getString("userId");
							String userName = resultSet.getString("userName");
							String userTel = resultSet.getString("userTel");
							String userEmail = resultSet.getString("userEmail");
							Timestamp insertDate = resultSet.getTimestamp("insertDate");
							Timestamp deleteDate = resultSet.getTimestamp("deleteDate");
							
							UDto dto = new UDto(userId, userName, userTel, userEmail, insertDate, deleteDate);
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
				
				
				//********원래글을 수정하고 저장하는 메소드 **********
				public void deleteUser(String userId){
					Connection connection = null;
					PreparedStatement preparedStatement = null;
					
					try {
						connection = dataSource.getConnection();
						String query = "update user set deleteDate = now() where userId =?";
						preparedStatement = connection.prepareStatement(query);
						preparedStatement.setString(1, userId);
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
				}	//noticeModify() method 끝 
				
				public String showUserName(String loginId) {
					String userName = "";
					Connection connection = null;
					PreparedStatement preparedStatement = null;
					ResultSet resultSet = null;
					System.out.println("showUserName longinId : " + loginId);
					try {
						connection = dataSource.getConnection();
						String query = "select userName from user where userId = ?";
						preparedStatement = connection.prepareStatement(query);
						preparedStatement.setString(1, loginId);
						
						resultSet = preparedStatement.executeQuery();
						
						while(resultSet.next()) {
							userName = resultSet.getString("userName");
							
							
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
					return userName;
				}
					
				
}
