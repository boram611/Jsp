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
import com.web_five.dto.ParticipateDto;

public class EDao {

	DataSource dataSource;
	
	public EDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/team_five");
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	////외부에서 생성을 못하도록 Default생성자는 private으로 선언합니다. 

	private static EDao instance = new EDao();

	public static EDao getInstance() {
		return instance;

	}
	
	// 게시판의 전체 글 수를 가져오는 메서드
		public int getBoardCount() {
			String sql = "select count(*) from event";

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
	public ArrayList<EDto> eventList(int page, int pageSize){
		int startNum=((page-1)*pageSize);
		ArrayList<EDto> dtos = new ArrayList<EDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet =null;
		StringBuffer sql=new StringBuffer();
		sql.append("select @ROWNUM := @ROWNUM + 1 as rno, m.* from event m, (select @rownum :=0) tmp ORDER BY rno LIMIT ?, ?");
		SimpleDateFormat sdf = new SimpleDateFormat();
		try {
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(sql.toString());
			preparedStatement.setInt(1, startNum);
			preparedStatement.setInt(2, pageSize);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				EDto dto = new EDto();
				dto.seteSeqno(resultSet.getInt("eSeqno"));
				dto.seteTitle(resultSet.getString("eTitle"));
				dto.seteContent(resultSet.getString("eContent"));
				
				//***********************
				
				dto.setStartDate(sdf.format(resultSet.getTimestamp("startDate")));
				dto.setEndDate(sdf.format(resultSet.getTimestamp("endDate")));
				
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
	
	
	public ArrayList<EDto> myeventList(int page, int pageSize, String userId){
		int startNum=((page-1)*pageSize);
		ArrayList<EDto> dtos = new ArrayList<EDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet =null;
		StringBuffer sql=new StringBuffer();
		sql.append("select @ROWNUM := @ROWNUM + 1 as rno, m.*, p.* from event m left outer join participate p on p.event_eSeqno = m.eSeqno, (select @rownum :=0) tmp where user_userId = ? ORDER BY rno LIMIT ?, ?");
		SimpleDateFormat sdf = new SimpleDateFormat();
		try {
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(sql.toString());
			preparedStatement.setString(1, userId);
			preparedStatement.setInt(2, startNum);
			preparedStatement.setInt(3, pageSize);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				EDto dto = new EDto();
				dto.seteSeqno(resultSet.getInt("eSeqno"));
				dto.seteTitle(resultSet.getString("eTitle"));
				dto.seteContent(resultSet.getString("eContent"));
				//***********************
				dto.setStartDate(sdf.format(resultSet.getTimestamp("startDate")));
				dto.setEndDate(sdf.format(resultSet.getTimestamp("endDate")));
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
		public EDto eventSumView(String streSeqno) {
			EDto dto =null;
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet =null;
			
			try {
				connection = dataSource.getConnection();
				String query = "select * from event where eSeqno = ?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(1, Integer.parseInt(streSeqno));
				resultSet = preparedStatement.executeQuery();
				
				if(resultSet.next()) {
					int eSeqno = resultSet.getInt("eSeqno");
					String eTitle = resultSet.getString("eTitle");
					String eContent = resultSet.getString("eContent");
					String eFilename = resultSet.getString("eFilename");
					String startDate = resultSet.getString("startDate");
					String endDate = resultSet.getString("endDate");
					
					
					dto = new EDto(eSeqno, eTitle, eContent, eFilename, startDate, endDate);
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
	
	
	//********내가 선택한 정보 수정에대한 내용 보여주는 메소드 **********
	public EDto eventView(String streSeqno) {
		EDto dto =null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet =null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select * from event where eSeqno = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(streSeqno));
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				int eSeqno = resultSet.getInt("eSeqno");
				String eTitle = resultSet.getString("eTitle");
				String eContent = resultSet.getString("eContent");
				String eFilename = resultSet.getString("eFilename");
				String startDate = resultSet.getString("startDate");
				String endDate = resultSet.getString("endDate");
				
				
				dto = new EDto(eSeqno, eTitle, eContent, eFilename, startDate, endDate);
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
	public void eventWrite(String eTitle, String eContent,String eFilename ,String startDate, String endDate) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "insert into event (eTitle, eContent, eFilename, startDate, endDate) values (?, ?, ?, ?, ?)";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, eTitle);
			preparedStatement.setString(2, eContent);
			preparedStatement.setString(3, eFilename);
			preparedStatement.setString(4, startDate);
			preparedStatement.setString(5, endDate);
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
		public void eventModify(String eSeqno, String eTitle, String eContent, String startDate, String eFilename , String endDate){
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			
			try {
				connection = dataSource.getConnection();
				String query = "update event set eTitle = ?, eContent = ?, startDate = ?, endDate =?, eFilename=? where eSeqno =?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, eTitle);
				preparedStatement.setString(2, eContent);
				preparedStatement.setString(3, startDate);
				preparedStatement.setString(4, endDate);
				preparedStatement.setString(5, eFilename);
				preparedStatement.setInt(6, Integer.parseInt(eSeqno));
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
		public void eventDelete(String eSeqno) {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			System.out.println("eSeqno : " + eSeqno);
			
			try {
				connection = dataSource.getConnection();
				String query = "delete from event where eSeqno = ?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(1, Integer.parseInt(eSeqno));
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
		
		public ArrayList<ParticipateDto> AllParticipant(String eSeqno) {
			ArrayList<ParticipateDto> dtos = new ArrayList<ParticipateDto>();
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet =null;
			StringBuffer sql=new StringBuffer();
			sql.append("select * from participate where event_eSeqno = ?");
			SimpleDateFormat sdf = new SimpleDateFormat();
			try {
				connection = dataSource.getConnection();
				preparedStatement = connection.prepareStatement(sql.toString());
				preparedStatement.setString(1, eSeqno);
				resultSet = preparedStatement.executeQuery();
				
				while(resultSet.next()) {
					ParticipateDto dto = new ParticipateDto();
					dto.setUser_userId(resultSet.getString("user_userId"));
					
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
		
		public int getEventAllCount(String eSeqno) {
			String sql = "select count(*) from participate where event_eSeqno = ?";

			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet =null;
			int NoticeCount=0;
			try {
				connection = dataSource.getConnection();
				preparedStatement = connection.prepareStatement(sql); // '?'바인드를 사용해서 sql문을 효과 적으로
				preparedStatement.setString(1, eSeqno);
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
		
		public void insertWinner(String eSeqno, String[] winnerName) {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			
			for(int i = 0 ; i<10;i++) {
				try {
						connection = dataSource.getConnection();
						String query = "update participate set win = ? where user_userId = ? and event_eSeqno = ?";
						preparedStatement = connection.prepareStatement(query);
						preparedStatement.setString(1, "O");
						preparedStatement.setString(2, winnerName[i]);
						preparedStatement.setString(3, eSeqno);
						preparedStatement.executeUpdate();
						
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						if(preparedStatement != null) preparedStatement.close();
						if(connection != null) connection.close();
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			}
		}
		
		public ArrayList<ParticipateDto> WinnerList(String eSeqno) {
			ArrayList<ParticipateDto> dtos = new ArrayList<ParticipateDto>();
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet =null;
			StringBuffer sql=new StringBuffer();
			sql.append("select * from participate where event_eSeqno = ? and win = 'O'");
			SimpleDateFormat sdf = new SimpleDateFormat();
			try {
				connection = dataSource.getConnection();
				preparedStatement = connection.prepareStatement(sql.toString());
				preparedStatement.setString(1, eSeqno);
				resultSet = preparedStatement.executeQuery();
				
				while(resultSet.next()) {
					ParticipateDto dto = new ParticipateDto();
					dto.setUser_userId(resultSet.getString("user_userId"));
					
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
		
		public boolean participateInEvent(int eSeqno, String euserId) {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			
			try {
				connection = dataSource.getConnection();
				String query = "insert into participate (user_userId, event_eSeqno) values (?, ?)";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, "123");
				preparedStatement.setInt(2, eSeqno);
				preparedStatement.executeUpdate();
				return true;
			}catch (Exception e) {
				e.printStackTrace();
				return false;
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
		
		public int participant(String eSeqno, String userId) {
			String sql = "select count(*) from participate where event_eSeqno = ? and user_userId = ?";

			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet =null;
			int resultCount=0;
			try {
				connection = dataSource.getConnection();
				preparedStatement = connection.prepareStatement(sql); // '?'바인드를 사용해서 sql문을 효과 적으로
				preparedStatement.setString(1, eSeqno);
				preparedStatement.setString(2, userId);
				resultSet = preparedStatement.executeQuery();

				
				if (resultSet.next()) {
					resultCount=resultSet.getInt(1); // 전체 글 개수
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
			return resultCount;
		}
		
		public ArrayList<EDto> myEventList(int page, int pageSize, String userId){
			int startNum=((page-1)*pageSize);
			ArrayList<EDto> dtos = new ArrayList<EDto>();
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet =null;
			StringBuffer sql=new StringBuffer();
			sql.append("select @ROWNUM := @ROWNUM + 1 as rno, m.*, p.* from event m, participate p, (select @rownum :=0) tmp where user_userId = ? ORDER BY rno LIMIT ?, ?");
			SimpleDateFormat sdf = new SimpleDateFormat();
			try {
				connection = dataSource.getConnection();
				preparedStatement = connection.prepareStatement(sql.toString());
				preparedStatement.setString(1, userId);
				preparedStatement.setInt(2, startNum);
				preparedStatement.setInt(3, pageSize);
				resultSet = preparedStatement.executeQuery();
				while(resultSet.next()) {
					EDto dto = new EDto();
					dto.seteSeqno(resultSet.getInt("eSeqno"));
					dto.seteTitle(resultSet.getString("eTitle"));
					dto.seteContent(resultSet.getString("eContent"));
					//***********************
					dto.setStartDate(sdf.format(resultSet.getTimestamp("startDate")));
					dto.setEndDate(sdf.format(resultSet.getTimestamp("endDate")));
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
		public int getMyEventCount(String userid) {
			String sql = "select count(*) from participate where user_userId = ?";
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
}
