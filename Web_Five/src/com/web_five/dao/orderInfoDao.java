package com.web_five.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.web_five.dto.CartDto;
import com.web_five.dto.OrderinfoDto;
import com.web_five.dto.orderDto;
import com.web_five.dto.orderListDto;
import com.web_five.dto.userDto;

public class orderInfoDao {
	DataSource dataSource;
	
	public orderInfoDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/team_five");
		
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public userDto showOrderInfo(String loginId) {
		userDto dtos = new userDto();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		System.out.println("orderDao longinId : " + loginId);
		try {
			connection = dataSource.getConnection();
			String query = "select userName, userAddress, userTel from user where userId = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, loginId);
			
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				String userName = resultSet.getString("userName");
				String userAddress = resultSet.getString("userAddress");
				String userTel = resultSet.getString("userTel");
				
				String address[] = userAddress.split(", ");
				String addr1 = address[0];
				String addr2 = address[1];
				String addr3 = address[2];
				System.out.println(addr1);
				System.out.println(addr2);
				System.out.println(addr3);
				
				String telNumber[] = userTel.split("-");
				String tel1 = telNumber[0];
				String tel2 = telNumber[1];
				String tel3 = telNumber[2];
				
				System.out.println("주문자 이름 : " + userName);
				System.out.println("주문자 주소 : " + userAddress);
				System.out.println("주문자 연락처 : " + userTel);
				
				userDto dto = new userDto(loginId, userName, addr1, addr2, addr3, tel1, tel2, tel3);
			}
			System.out.println("오더정보 조회 성공");
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("오더정보 조회 실패");
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
	public orderDto myInfo(String loginId) {
		orderDto dtos = new orderDto();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		System.out.println("myInfo longinId : " + loginId);
		try {
			connection = dataSource.getConnection();
			String query = "select userName, userAddress, userTel from user where userId = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, loginId);
			
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				String userName = resultSet.getString("userName");
				String userAddress = resultSet.getString("userAddress");
				String userTel = resultSet.getString("userTel");
				
				String address[] = userAddress.split(", ");
				String addr1 = address[0];
				String addr2 = address[1];
				String addr3 = address[2];
				System.out.println(addr1);
				System.out.println(addr2);
				System.out.println(addr3);
				
				String telNumber[] = userTel.split("-");
				String tel1 = telNumber[0];
				String tel2 = telNumber[1];
				String tel3 = telNumber[2];
				
				System.out.println("주문자 이름 : " + userName);
				System.out.println("주문자 주소 : " + userAddress);
				System.out.println("주문자 연락처 : " + userTel);
				
				orderDto dto = new orderDto(userName, addr1, addr2, addr3, tel1, tel2, tel3);
			}
			System.out.println("주문자 정보 동일 조회 성공");
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("주문자 정보 동일 조회 실패");
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
	
	public void insertOrderInfo(String user_userId, String ordReceiver, String ordRcvAddress, String ordRcvPhone, String ordPay, String ordBank, String ordCardNo, String ordCardPass) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		orderDto dto = new orderDto();
	
		try {
			connection = dataSource.getConnection();
			String query = "insert into orderinfo (user_userId, ordDate, ordReceiver, ordRcvAddress, ordRcvPhone, ordPay, ordBank, ordCardNo, ordCardPass) values (?, now(), ?, ?, ?, ?, ?, ?, ?)";
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setString(1, dto.getUser_userId());
			preparedStatement.setString(2, dto.getOrdReceiver());
			preparedStatement.setString(3, dto.getOrdRcvAddress());
			preparedStatement.setString(4, dto.getOrdRcvPhone());
			preparedStatement.setString(5, dto.getOrdPay());
			preparedStatement.setString(6, dto.getOrdBank());
			preparedStatement.setString(7, dto.getOrdCardNo());
			preparedStatement.setString(8, dto.getOrdCardPass());
			preparedStatement.executeUpdate();
			
			
			
			System.out.println("orderinfo insert 성공");
		}catch(Exception e) {
			
			System.out.println("orderinfo insert 실패");
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
	
	
	private static orderInfoDao instance = new orderInfoDao();

	public static orderInfoDao getInstance() {
		return instance;

	}
	
	// 게시판의 전체 글 수를 가져오는 메서드
			public int getOrderinfoCount() {
				String sql = "select count(*) from orderinfo";

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
		public ArrayList<OrderinfoDto> OrderinfoList(int page, int pageSize){
			int startNum=((page-1)*pageSize);
			ArrayList<OrderinfoDto> dtos = new ArrayList<OrderinfoDto>();
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet =null;
			StringBuffer sql=new StringBuffer();
			sql.append("select @ROWNUM := @ROWNUM + 1 as rno, m.* from orderinfo m, (select @rownum :=0) tmp ORDER BY rno LIMIT ?, ?");
			SimpleDateFormat sdf = new SimpleDateFormat();
			try {
				connection = dataSource.getConnection();
				preparedStatement = connection.prepareStatement(sql.toString());
				preparedStatement.setInt(1, startNum);
				preparedStatement.setInt(2, pageSize);
				resultSet = preparedStatement.executeQuery();
				
				while(resultSet.next()) {
					OrderinfoDto dto = new OrderinfoDto();
					dto.setOrdNo(resultSet.getInt("ordNo"));
					dto.setUser_userId(resultSet.getString("user_userId"));
					dto.setOrdDate(sdf.format(resultSet.getTimestamp("ordDate")));
					dto.setOrdReceiver(resultSet.getString("ordReceiver"));
					dto.setOrdRcvAddress(resultSet.getString("ordRcvAddress"));
					dto.setOrdRcvPhone(resultSet.getString("ordRcvPhone"));
					dto.setOrdPay(resultSet.getString("ordPay"));
					dto.setOrdBank(resultSet.getString("ordBank"));
					dto.setOrdCardNo(resultSet.getString("ordCardNo"));
					dto.setOrdCardPass(resultSet.getString("ordCardPass"));
					dto.setOrdDelivery(resultSet.getString("ordDelivery"));
					dto.setOrdDeliveryDate(resultSet.getString("ordDeliveryDate"));
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
		
		public void updateDelivery(String ordNo, String user_userId, String status){
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			
			try {
				connection = dataSource.getConnection();
				String query = "update orderinfo set ordDelivery = ? where user_userId = ? and ordNo = ?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(3, Integer.parseInt(ordNo));
				preparedStatement.setString(1, status);
				preparedStatement.setString(2, user_userId);
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
		}
		
		public ArrayList<orderListDto> myOrderList(String userId) {
			System.out.println("dao 1--------------");
			ArrayList<orderListDto> dtos = new ArrayList<orderListDto>();
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet =null;
			System.out.println("dao 2--------------");
			try {
				System.out.println("dao 3--------------");
				connection = dataSource.getConnection();
				String query = "select i.ordNo, p.prdName, p.prdPrice, d.ordQty, i.ordDate, i.ordDelivery, p.prdNo from orderinfo i left outer join orderdetail d on i.user_userId = d.user_userId, product p where p.prdNo = d.goods_prdNo and i.ordNo=d.orderinfo_ordNo and i.user_userId='" + userId + "' order by i.ordDate desc";
				preparedStatement = connection.prepareStatement(query);
				resultSet = preparedStatement.executeQuery();
				
				System.out.println("dao 4--------------");
				while(resultSet.next()) {
					String ordNo = resultSet.getString(1);
					String prdName = resultSet.getString(2);
					int prdPrice = resultSet.getInt(3);
					int ordQty = resultSet.getInt(4);
					String ordDate = resultSet.getString(5);
					String ordDelivery = resultSet.getString(6);
					String prdNo = resultSet.getString(7);
					
					int total = prdPrice * ordQty;
					System.out.println("dao 5--------------");
					
					System.out.println("ordNo 1 : " + ordNo);
					System.out.println("prdName 2 : " + prdName);
					System.out.println("prdPrice 3 : " + prdPrice);
					System.out.println("ordQty 4 : " + ordQty);
					System.out.println("ordDate 5 : " + ordDate);
					System.out.println("ordDelivery 6 : " + ordDelivery);
					System.out.println("prdNo 7 : " + prdNo);
					
					System.out.println("total 8 : " + total);
					
					String date[] = ordDate.split(" ");
					String date1 = date[0];
					System.out.println("date1 6 : " + date1);
			
					System.out.println("dao 6--------------");
					orderListDto dto = new orderListDto(ordNo, prdName, prdPrice, ordQty , date1, ordDelivery, prdNo, total);
					
					dtos.add(dto);
				}
				System.out.println("dao 7--------------");
			
				
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
		
		public int recentOrderNo(String user_userId) {
			int ordNo = 0;
			System.out.println("recentOrderNo user_userId : " + user_userId);
			String sql = "select max(ordNo) from orderinfo where user_userId = ?";

			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet =null;
			try {
				connection = dataSource.getConnection();
				preparedStatement = connection.prepareStatement(sql); // '?'바인드를 사용해서 sql문을 효과 적으로
				preparedStatement.setString(1, user_userId);
				resultSet = preparedStatement.executeQuery();

				
				if (resultSet.next()) {
					ordNo=resultSet.getInt(1); // 전체 글 개수
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
			return ordNo;
		}
		
		public int getTotalPrice(String userId) {
			String sql = "select cartTotalPrice from cartinfo where user_userId = '" + userId + "'";
			int totalPrice = 0;
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet =null;
			try {
				connection = dataSource.getConnection();
				preparedStatement = connection.prepareStatement(sql); // '?'바인드를 사용해서 sql문을 효과 적으로
				resultSet = preparedStatement.executeQuery();

				
				if (resultSet.next()) {
					totalPrice=resultSet.getInt(1); // 전체 글 개수
					System.out.println("장바구니 총 금액 : " + totalPrice);
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
			return totalPrice;
		}
		
		public ArrayList<OrderinfoDto> salesList() {
			ArrayList<OrderinfoDto> dtos = new ArrayList<OrderinfoDto>();
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet =null;
			try {
				connection = dataSource.getConnection();
				String query = "select DATE(i.ordDate) AS `date`, sum(ordPay) from orderinfo i GROUP BY `date` order by `date`";
				preparedStatement = connection.prepareStatement(query);
				resultSet = preparedStatement.executeQuery();
				
				while(resultSet.next()) {
					OrderinfoDto dto = new OrderinfoDto();
					dto.setOrdDate(resultSet.getString("date"));
					dto.setOrdPay(Integer.toString(resultSet.getInt("sum(ordPay)")));
					
					
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
	
}
