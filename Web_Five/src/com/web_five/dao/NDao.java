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

public class NDao {

	DataSource dataSource;
	
	public NDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/team_five");
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	////외부에서 생성을 못하도록 Default생성자는 private으로 선언합니다. 

	private static NDao instance = new NDao();

	public static NDao getInstance() {
		return instance;

	}
	
	// 게시판의 전체 글 수를 가져오는 메서드
		public int getBoardCount() {
			String sql = "select count(*) from notice";

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
	public ArrayList<NDto> noticeList(int page, int pageSize){
		int startNum=((page-1)*pageSize);
		ArrayList<NDto> dtos = new ArrayList<NDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet =null;
		StringBuffer sql=new StringBuffer();
		sql.append("select @ROWNUM := @ROWNUM + 1 as rno, m.* from notice m, (select @rownum :=0) tmp ORDER BY rno LIMIT ?, ?");
		try {
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(sql.toString());
			preparedStatement.setInt(1, startNum);
			preparedStatement.setInt(2, pageSize);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				NDto dto = new NDto();
				dto.setnSeqno(resultSet.getInt("nSeqno"));
				dto.setnTitle(resultSet.getString("nTitle"));
				dto.setnContent(resultSet.getString("nContent"));
				dto.setnDate(resultSet.getTimestamp("nDate"));
				dto.setAdmin_adminId(resultSet.getString("admin_adminId"));
				
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
	
	
	// 검색 리스트 띄우기 
			public ArrayList<NDto> noticeSearch(int page, int pageSize, String select, String content){
				int startNum=((page-1)*pageSize);
				ArrayList<NDto> dtos = new ArrayList<NDto>();
				Connection connection = null;
				PreparedStatement preparedStatement = null;
				ResultSet resultSet =null;
				StringBuffer sql=new StringBuffer();
				sql.append("select @ROWNUM := @ROWNUM + 1 as rno, m.* from notice m, (select @rownum :=0) tmp where " + select + " like '%" + content + "%'" + " ORDER BY rno LIMIT ?, ?");
				try {
					connection = dataSource.getConnection();
					preparedStatement = connection.prepareStatement(sql.toString());
					preparedStatement.setInt(1, startNum);
					preparedStatement.setInt(2, pageSize);
					resultSet = preparedStatement.executeQuery();
					
					while(resultSet.next()) {
						NDto dto = new NDto();
						dto.setnSeqno(resultSet.getInt("nSeqno"));
						dto.setnTitle(resultSet.getString("nTitle"));
						dto.setnContent(resultSet.getString("nContent"));
						dto.setnDate(resultSet.getTimestamp("nDate"));
						dto.setAdmin_adminId(resultSet.getString("admin_adminId"));
						
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
	
	//********내가 선택한 제목에대한 내용 보여주는 메소드 **********
	public NDto noticeView(String strnSeqno) {
		NDto dto =null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet =null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select * from notice where nSeqno = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(strnSeqno));
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				int nSeqno = resultSet.getInt("nSeqno");
				String nTitle = resultSet.getString("nTitle");
				String nContent = resultSet.getString("nContent");
				Timestamp nDate = resultSet.getTimestamp("nDate");
				String admin_adminId = resultSet.getString("admin_adminId");
				
				
				dto = new NDto(nSeqno, nTitle, nContent, nDate, admin_adminId);
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
	public void noticeWrite(String nTitle, String nContent, String admin_adminId) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "insert into notice (nTitle, nContent, admin_adminId, nDate) values (?, ?, ?, now())";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, nTitle);
			preparedStatement.setString(2, nContent);
			preparedStatement.setString(3, admin_adminId);
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
	
	//********원래글을 수정하고 저장하는 메소드 **********
		public void noticeModify(String nSeqno, String nTitle, String nContent, String admin_adminId){
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			
			try {
				connection = dataSource.getConnection();
				String query = "update notice set nTitle = ?, nContent = ?, admin_adminId = ? where nSeqno =?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, nTitle);
				preparedStatement.setString(2, nContent);
				preparedStatement.setString(3, admin_adminId);
				preparedStatement.setInt(4, Integer.parseInt(nSeqno));
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
		
		
		//********삭제하는 메소드**********
		public void noticeDelete(String nSeqno) {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			
			try {
				connection = dataSource.getConnection();
				String query = "delete from notice where nSeqno =?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(1, Integer.parseInt(nSeqno));
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
		
}
