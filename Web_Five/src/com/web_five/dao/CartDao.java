package com.web_five.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.web_five.dto.CartDto;


public class CartDao {

	DataSource dataSource;
	
	public CartDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/team_five");
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	////외부에서 생성을 못하도록 Default생성자는 private으로 선언합니다. 

	private static CartDao instance = new CartDao();

	public static CartDao getInstance() {
		return instance;

	}
	
	
	public ArrayList<CartDto> CartList(String userId) {
		ArrayList<CartDto> dtos = new ArrayList<CartDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet =null;
		StringBuffer sql=new StringBuffer();
		sql.append("select i.*, d.*, p.* from cartinfo i left outer join cartdetail d on i.cartNo = d.cartinfo_cartNo, product p ");
		sql.append("where p.prdNo = d.goods_prdNo and d.user_userId = ?");
		SimpleDateFormat sdf = new SimpleDateFormat();
		try {
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(sql.toString());
			preparedStatement.setString(1, userId);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				CartDto dto = new CartDto();
				dto.setCartNo(resultSet.getString("cartNo"));
				dto.setUser_userId(resultSet.getString("user_userId"));
				dto.setCartDate(resultSet.getString("cartDate"));
				dto.setCartTotalPrice(resultSet.getInt("cartTotalPrice"));
				dto.setCartQty(resultSet.getInt("cartQty"));
				dto.setGoods_prdNo(resultSet.getString("goods_prdNo"));
				dto.setUserId(resultSet.getString("user_userId"));
				dto.setDcartNo(resultSet.getString("DcartNo"));
				dto.setCartinfo_cartNo(resultSet.getString("cartinfo_cartNo"));
				dto.setCtgType(resultSet.getString("ctgType"));
				dto.setPrdNo(resultSet.getString("prdNo"));
				dto.setPrdName(resultSet.getString("prdName"));
				dto.setPrdPrice(resultSet.getInt("prdPrice"));
				dto.setPrdStock(resultSet.getString("prdStock"));
				dto.setPrdContent(resultSet.getString("prdContent"));
				dto.setPrdAFilename(resultSet.getString("prdAFilename"));
				dto.setPrdFilename(resultSet.getString("prdFilename"));
				dto.setPrdDFilename(resultSet.getString("prdDFilename"));
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
	
	public void updateCart(String cartinfo_cartNo, int cartQty, String DcartNo, String user_userId, String goods_prdNo, int cartTotalPrice) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "UPDATE cartdetail as d INNER JOIN cartinfo as i on d.cartinfo_cartNo = ";
			String query2 = "i.cartNo set d.cartQty = ?, i.cartTotalPrice = ? where d.goods_prdNo = ?";
			String query3 = " and d.user_userId = ? and d.cartinfo_cartNo = ? and d.DcartNo = ?";
			preparedStatement = connection.prepareStatement(query+query2+query3);
			preparedStatement.setInt(1, cartQty);
			preparedStatement.setInt(2, cartTotalPrice);
			preparedStatement.setString(3, goods_prdNo);
			preparedStatement.setString(4, user_userId);
			preparedStatement.setString(5, cartinfo_cartNo);
			preparedStatement.setString(6, DcartNo);
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
	
	public void cartDelete(String[] dcartNo, String userId) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		for(int i = 0 ; i<dcartNo.length ; i++) {
		try {
			connection = dataSource.getConnection();
			String query = "delete from cartdetail where DcartNo = ? and user_userId = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, dcartNo[i]);
			preparedStatement.setString(2, userId);
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
	}
	
	// 장바구니 번호 가져오기
	public int[] getCartNo(String userId) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		int[] result = new int[2];
		try {
			connection = dataSource.getConnection();
			String query = "select cartNo, cartTotalPrice from cartinfo where user_userId = ?";
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setString(1, userId);
			
			resultSet = preparedStatement.executeQuery();
			
			if (resultSet.next()) {
				result[0] = resultSet.getInt(1);
				result[1] = resultSet.getInt(2);
				
			}
			
		}
		catch (Exception e) {
			System.out.println("recCheck : " + e);
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
		return result;
	}
	
	// cart 최초 추가
		public void cartInsert(String userId, int prdNo, int cartQty, int cartinfo_cartNo){
						
			Connection connection = null;
			PreparedStatement preparedStatement = null;
						
			try {
				connection = dataSource.getConnection();
				String query = "insert into cartdetail (user_userId, goods_prdNo, cartQty, cartinfo_cartNo) values (?, ?, ?, ?)";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, userId);
				preparedStatement.setInt(2, prdNo);
				preparedStatement.setInt(3, cartQty);
				preparedStatement.setInt(4, cartinfo_cartNo);
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
		public void totalPriceInsert(int cartTotalPrice, String user_userId){
			
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			
			try {
				connection = dataSource.getConnection();
				String query = "UPDATE cartinfo set cartTotalPrice = ? where user_userId = ?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(1, cartTotalPrice);
				preparedStatement.setString(2, user_userId);
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
		
		public int cartCheck(String userId, int prdNo){
			int result = 0;
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			
			try {
				connection = dataSource.getConnection();
				String query = "select count(*) from cartdetail where user_userId = ? and goods_prdNo = ?";
				preparedStatement = connection.prepareStatement(query);
				
				preparedStatement.setString(1, userId);
				preparedStatement.setInt(2, prdNo);
				
				resultSet = preparedStatement.executeQuery();
				
				if (resultSet.next()) {
					result = resultSet.getInt(1);
					
				}
				
			}
			catch (Exception e) {
				System.out.println("recCheck : " + e);
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
			return result;
		}
		
		public void cartUpdate(String userId, int prdNo, int cartQty, int cartTotalPrice, int cartNo) {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
						
			try {
				connection = dataSource.getConnection();
				String query1 = "UPDATE cartdetail as d INNER JOIN cartinfo as i on d.cartinfo_cartNo = i.cartNo ";
				String query2 = "set d.cartQty = d.cartQty + ?, i.cartTotalPrice = ? where d.goods_prdNo = ? and";
				String query3 = " d.user_userId = '123' and i.cartNo = ?";
				preparedStatement = connection.prepareStatement(query1+query2+query3);
				preparedStatement.setInt(1, cartQty);
				preparedStatement.setInt(2, cartTotalPrice);
				preparedStatement.setInt(3, prdNo);
				preparedStatement.setInt(4, cartNo);
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
		
		// 장바구니에서 구매할 물건들만 가져와서 정보 출력
		public ArrayList<CartDto> purchaselist(String user_userId, String dcartNo) {
			ArrayList<CartDto> dtos = new ArrayList<CartDto>();
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet =null;
			StringBuffer sql=new StringBuffer();
			sql.append("select i.*, d.*, p.* from cartinfo i left outer join cartdetail d on i.cartNo = d.cartinfo_cartNo, product p ");
			sql.append("where p.prdNo = d.goods_prdNo and i.user_userId = ? and d.dcartNo = ?");
				
				try {
					connection = dataSource.getConnection();
					preparedStatement = connection.prepareStatement(sql.toString());
					preparedStatement.setString(1, user_userId);
					preparedStatement.setString(2, dcartNo);
					resultSet = preparedStatement.executeQuery();
					
					if(resultSet.next()) {
						CartDto dto = new CartDto();
						dto.setCartNo(resultSet.getString("cartNo"));
						dto.setUser_userId(resultSet.getString("user_userId"));
						dto.setCartDate(resultSet.getString("cartDate"));
						dto.setCartTotalPrice(resultSet.getInt("cartTotalPrice"));
						dto.setCartQty(resultSet.getInt("cartQty"));
						dto.setGoods_prdNo(resultSet.getString("goods_prdNo"));
						dto.setUserId(resultSet.getString("user_userId"));
						dto.setDcartNo(resultSet.getString("DcartNo"));
						dto.setCartinfo_cartNo(resultSet.getString("cartinfo_cartNo"));
						dto.setCtgType(resultSet.getString("ctgType"));
						dto.setPrdNo(resultSet.getString("prdNo"));
						dto.setPrdName(resultSet.getString("prdName"));
						dto.setPrdPrice(resultSet.getInt("prdPrice"));
						dto.setPrdStock(resultSet.getString("prdStock"));
						dto.setPrdContent(resultSet.getString("prdContent"));
						dto.setPrdAFilename(resultSet.getString("prdAFilename"));
						dto.setPrdFilename(resultSet.getString("prdFilename"));
						dto.setPrdDFilename(resultSet.getString("prdDFilename"));
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
		
		public void updateTotal(int remnants, String user_userId) {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
						
			try {
				connection = dataSource.getConnection();
				String query1 = "UPDATE cartinfo set cartTotalPrice = ? where user_userId = ?";
				preparedStatement = connection.prepareStatement(query1);
				preparedStatement.setInt(1, remnants);
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
		
		public int zero(String user_userId, String DcartNo){
			int result = 0;
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			
			try {
				connection = dataSource.getConnection();
				String query = "select cartQty from cartdetail where user_userId = ? and dcartNo = ?";
				preparedStatement = connection.prepareStatement(query);
				
				preparedStatement.setString(1, user_userId);
				preparedStatement.setString(2, DcartNo);
				
				resultSet = preparedStatement.executeQuery();
				
				if (resultSet.next()) {
					result = resultSet.getInt(1);
					
				}
				
			}
			catch (Exception e) {
				System.out.println("recCheck : " + e);
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
			return result;
		}
	
}
