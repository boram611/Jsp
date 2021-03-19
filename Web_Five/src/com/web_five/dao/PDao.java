package com.web_five.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.web_five.dto.EDto;
import com.web_five.dto.PDto;
import com.web_five.dto.PDto;

public class PDao {

	DataSource dataSource;
	
	public PDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/team_five");
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	////외부에서 생성을 못하도록 Default생성자는 private으로 선언합니다. 

	private static PDao instance = new PDao();

	public static PDao getInstance() {
		return instance;

	}
	
	// 게시판의 전체 글 수를 가져오는 메서드
		public int getBoardCount() {
			String sql = "select count(*) from product";

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
	public ArrayList<PDto> productList(int page, int pageSize){
		int startNum=((page-1)*pageSize);
		ArrayList<PDto> dtos = new ArrayList<PDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet =null;
		StringBuffer sql=new StringBuffer();
		sql.append("select @ROWNUM := @ROWNUM + 1 as rno, m.* from product m, (select @rownum :=0) tmp ORDER BY rno LIMIT ?, ?");
		SimpleDateFormat sdf = new SimpleDateFormat();
		try {
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(sql.toString());
			preparedStatement.setInt(1, startNum);
			preparedStatement.setInt(2, pageSize);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				PDto dto = new PDto();
				dto.setPrdNo(resultSet.getInt("prdNo"));
				dto.setCtgType(resultSet.getString("ctgType"));
				dto.setPrdName(resultSet.getString("prdName"));
				dto.setPrdPrice(resultSet.getString("prdPrice"));
				dto.setPrdStock(resultSet.getString("prdStock"));
				dto.setPrdContent(resultSet.getString("prdContent"));
				dto.setPrdFilename(resultSet.getString("prdFilename"));
				dto.setPrdDFilename(resultSet.getString("prdDFilename"));
				dto.setPrdAFilename(resultSet.getString("prdAFilename"));
				
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
	
	
	
	
	// store1 리스트 띄우기 
		public ArrayList<PDto> storeList1(int page, int pageSize){
			int startNum=((page-1)*pageSize);
			ArrayList<PDto> dtos = new ArrayList<PDto>();
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet =null;
			StringBuffer sql=new StringBuffer();
			sql.append("select @ROWNUM := @ROWNUM + 1 as rno, m.* from product m, (select @rownum :=0) tmp where ctgType='생활/주방' ORDER BY rno LIMIT ?, ?");
			SimpleDateFormat sdf = new SimpleDateFormat();
			try {
				connection = dataSource.getConnection();
				preparedStatement = connection.prepareStatement(sql.toString());
				preparedStatement.setInt(1, startNum);
				preparedStatement.setInt(2, pageSize);
				resultSet = preparedStatement.executeQuery();
				
				while(resultSet.next()) {
					PDto dto = new PDto();
					dto.setPrdNo(resultSet.getInt("prdNo"));
					dto.setCtgType(resultSet.getString("ctgType"));
					dto.setPrdName(resultSet.getString("prdName"));
					dto.setPrdPrice(resultSet.getString("prdPrice"));
					dto.setPrdStock(resultSet.getString("prdStock"));
					dto.setPrdContent(resultSet.getString("prdContent"));
					dto.setPrdFilename(resultSet.getString("prdFilename"));
					dto.setPrdDFilename(resultSet.getString("prdDFilename"));
					dto.setPrdAFilename(resultSet.getString("prdAFilename"));
					
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
		
		// store2 리스트 띄우기 
				public ArrayList<PDto> storeList2(int page, int pageSize){
					int startNum=((page-1)*pageSize);
					ArrayList<PDto> dtos = new ArrayList<PDto>();
					Connection connection = null;
					PreparedStatement preparedStatement = null;
					ResultSet resultSet =null;
					StringBuffer sql=new StringBuffer();
					sql.append("select @ROWNUM := @ROWNUM + 1 as rno, m.* from product m, (select @rownum :=0) tmp where ctgType='화장품' ORDER BY rno LIMIT ?, ?");
					SimpleDateFormat sdf = new SimpleDateFormat();
					try {
						connection = dataSource.getConnection();
						preparedStatement = connection.prepareStatement(sql.toString());
						preparedStatement.setInt(1, startNum);
						preparedStatement.setInt(2, pageSize);
						resultSet = preparedStatement.executeQuery();
						
						while(resultSet.next()) {
							PDto dto = new PDto();
							dto.setPrdNo(resultSet.getInt("prdNo"));
							dto.setCtgType(resultSet.getString("ctgType"));
							dto.setPrdName(resultSet.getString("prdName"));
							dto.setPrdPrice(resultSet.getString("prdPrice"));
							dto.setPrdStock(resultSet.getString("prdStock"));
							dto.setPrdContent(resultSet.getString("prdContent"));
							dto.setPrdFilename(resultSet.getString("prdFilename"));
							dto.setPrdDFilename(resultSet.getString("prdDFilename"));
							dto.setPrdAFilename(resultSet.getString("prdAFilename"));
							
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
				
				// store3 리스트 띄우기 
				public ArrayList<PDto> storeList3(int page, int pageSize){
					int startNum=((page-1)*pageSize);
					ArrayList<PDto> dtos = new ArrayList<PDto>();
					Connection connection = null;
					PreparedStatement preparedStatement = null;
					ResultSet resultSet =null;
					StringBuffer sql=new StringBuffer();
					sql.append("select @ROWNUM := @ROWNUM + 1 as rno, m.* from product m, (select @rownum :=0) tmp where ctgType='유아/완구' ORDER BY rno LIMIT ?, ?");
					SimpleDateFormat sdf = new SimpleDateFormat();
					try {
						connection = dataSource.getConnection();
						preparedStatement = connection.prepareStatement(sql.toString());
						preparedStatement.setInt(1, startNum);
						preparedStatement.setInt(2, pageSize);
						resultSet = preparedStatement.executeQuery();
						
						while(resultSet.next()) {
							PDto dto = new PDto();
							dto.setPrdNo(resultSet.getInt("prdNo"));
							dto.setCtgType(resultSet.getString("ctgType"));
							dto.setPrdName(resultSet.getString("prdName"));
							dto.setPrdPrice(resultSet.getString("prdPrice"));
							dto.setPrdStock(resultSet.getString("prdStock"));
							dto.setPrdContent(resultSet.getString("prdContent"));
							dto.setPrdFilename(resultSet.getString("prdFilename"));
							dto.setPrdDFilename(resultSet.getString("prdDFilename"));
							dto.setPrdAFilename(resultSet.getString("prdAFilename"));
							
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
				
				// store4 리스트 띄우기 
				public ArrayList<PDto> storeList4(int page, int pageSize){
					int startNum=((page-1)*pageSize);
					ArrayList<PDto> dtos = new ArrayList<PDto>();
					Connection connection = null;
					PreparedStatement preparedStatement = null;
					ResultSet resultSet =null;
					StringBuffer sql=new StringBuffer();
					sql.append("select @ROWNUM := @ROWNUM + 1 as rno, m.* from product m, (select @rownum :=0) tmp where ctgType='태블릿/휴대폰' ORDER BY rno LIMIT ?, ?");
					SimpleDateFormat sdf = new SimpleDateFormat();
					try {
						connection = dataSource.getConnection();
						preparedStatement = connection.prepareStatement(sql.toString());
						preparedStatement.setInt(1, startNum);
						preparedStatement.setInt(2, pageSize);
						resultSet = preparedStatement.executeQuery();
						
						while(resultSet.next()) {
							PDto dto = new PDto();
							dto.setPrdNo(resultSet.getInt("prdNo"));
							dto.setCtgType(resultSet.getString("ctgType"));
							dto.setPrdName(resultSet.getString("prdName"));
							dto.setPrdPrice(resultSet.getString("prdPrice"));
							dto.setPrdStock(resultSet.getString("prdStock"));
							dto.setPrdContent(resultSet.getString("prdContent"));
							dto.setPrdFilename(resultSet.getString("prdFilename"));
							dto.setPrdDFilename(resultSet.getString("prdDFilename"));
							dto.setPrdAFilename(resultSet.getString("prdAFilename"));
							
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

	//********새글을 쓰고 저장하는 메소드 **********
	public void productWrite(String ctgType, String prdName, String prdPrice, String prdStock ,String prdContent, String prdFilename, String prdDFilename, String prdAFilename) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "insert into product (ctgType, prdName, prdPrice, prdStock, prdContent, prdFilename, prdDFilename, prdAFilename) values (?, ?, ?, ?, ?, ?, ?, ?)";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, ctgType);
			preparedStatement.setString(2, prdName);
			preparedStatement.setString(3, prdPrice);
			preparedStatement.setString(4, prdStock);
			preparedStatement.setString(5, prdContent);
			preparedStatement.setString(6, prdFilename);
			preparedStatement.setString(7, prdDFilename);
			preparedStatement.setString(8, prdAFilename);
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
	
	
	//********내가 선택한 제목에대한 내용 보여주는 메소드 **********
	public PDto productView(String strprdNo) {
		PDto dto =null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet =null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select * from product where prdNo = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(strprdNo));
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				String ctgType = resultSet.getString("ctgType");
				int prdNo = resultSet.getInt("prdNo");
				String prdName = resultSet.getString("prdName");
				String prdPrice = resultSet.getString("prdPrice");
				String prdStock = resultSet.getString("prdStock");
				String prdContent = resultSet.getString("prdContent");
				String prdFilename = resultSet.getString("prdFilename");
				String prdDFilename = resultSet.getString("prdDFilename");
				dto = new PDto(ctgType, prdNo, prdName, prdPrice, prdStock, prdContent, prdFilename, prdDFilename);
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
		return dto;
	}
	
	
	//********새글을 쓰고 저장하는 메소드 **********
	public void productModify(String ctgType, String prdNo, String prdName, String prdPrice, String prdStock ,String prdContent, String prdFilename, String prdDFilename, String prdAFilename) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "update product set ctgType=?, prdName=?, prdPrice=?, prdStock=?, prdContent=?, prdFilename=?, prdDFilename=? , prdAFilename=? where prdNo=?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, ctgType);
			preparedStatement.setString(2, prdName);
			preparedStatement.setString(3, prdPrice);
			preparedStatement.setString(4, prdStock);
			preparedStatement.setString(5, prdContent);
			preparedStatement.setString(6, prdFilename);
			preparedStatement.setString(7, prdDFilename);
			preparedStatement.setString(8, prdAFilename);
			preparedStatement.setInt(9, Integer.parseInt(prdNo));
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
	
		
		
		//********삭제하는 메소드**********
		public void productDelete(String prdNo) {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			
			try {
				connection = dataSource.getConnection();
				String query = "delete from product where prdNo =?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(1, Integer.parseInt(prdNo));
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
		}	//delete() method 끝 
		
		
		
		//*****************************************************************
		
		//********내가 선택한 제목에대한 내용 보여주는 메소드 **********
		public PDto storeMain(String str1prdNo) {
			PDto dto =null;
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet =null;
			
			try {
				connection = dataSource.getConnection();
				String query = "select * from product where prdNo = ?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(1, Integer.parseInt(str1prdNo));
				resultSet = preparedStatement.executeQuery();
				
				if(resultSet.next()) {
					String ctgType = resultSet.getString("ctgType");
					int prdNo = resultSet.getInt("prdNo");
					String prdName = resultSet.getString("prdName");
					String prdPrice = resultSet.getString("prdPrice");
					String prdContent = resultSet.getString("prdContent");
					String prdFilename = resultSet.getString("prdFilename");
					String prdDFilename = resultSet.getString("prdDFilename");
					dto = new PDto(ctgType, prdNo, prdName, prdPrice, prdContent, prdFilename, prdDFilename);
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
			return dto;
		}
		
		
}
