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

import com.web_five.dto.QDto;

public class QDao {
	
	DataSource dataSource;
	
	public QDao() {
		// TODO Auto-generated constructor stub
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/team_five");
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean write(String qChapter, String qTitle, String qContent, String qFile, String user_userId) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "insert into qna (qTitle, qContent, qFile, user_userId, qChapter, qUserDate) values (?, ?, ?, ?, ?, now())";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, qTitle);
			preparedStatement.setString(2, qContent);
			preparedStatement.setString(3, qFile);
			preparedStatement.setString(4, user_userId);
			preparedStatement.setString(5, qChapter);
			preparedStatement.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
////외부에서 생성을 못하도록 Default생성자는 private으로 선언합니다. 

	private static QDao instance = new QDao();

	public static QDao getInstance() {
		return instance;

	}
	// 게시판의 전체 글 수를 가져오는 메서드
	public int getQnAUserCount(String userid) {
		String sql = "select count(*) from qna where user_userId = ?";

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet =null;
		int boardCount=0;
		try {
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(sql); // '?'바인드를 사용해서 sql문을 효과 적으로
			preparedStatement.setString(1, "123");
			resultSet = preparedStatement.executeQuery();

			
			if (resultSet.next()) {
				boardCount=resultSet.getInt(1); // 전체 글 개수
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
		return boardCount;
	}
	
	public ArrayList<QDto> selectUserQnA(int page, int pageSize, String quserId) {
		String msg = "";
		int startNum=((page-1)*pageSize);
		
		ArrayList<QDto> dtos = new ArrayList<QDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet =null;
		
		StringBuffer sql=new StringBuffer();
		SimpleDateFormat sdf = new SimpleDateFormat();
		sql.append("select @ROWNUM := @ROWNUM + 1 as rno, m.*, c.qComment from qna m LEFT outer JOIN team_five.comment c ON m.qSeqno = c.qna_qSeqno, (select @rownum :=0) tmp where user_userId = ? ORDER BY rno LIMIT ?, ?"); 
		try {
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(sql.toString());
			preparedStatement.setString(1, quserId);
			preparedStatement.setInt(2, startNum);
			preparedStatement.setInt(3, pageSize);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				if(resultSet.getString("qComment") == null) {
					msg = "답변 대기";
				}else {
					msg = "답변 완료";
				}
				
				QDto bVo = new QDto();
				bVo.setqSeqno(resultSet.getInt("qSeqno"));
				bVo.setqTitle(resultSet.getString("qTitle"));
				bVo.setqFile(resultSet.getString("qFile"));
				bVo.setqUserDate(sdf.format(resultSet.getTimestamp("qUserDate")));
				bVo.setqChapter(resultSet.getString("qChapter"));
				bVo.setUser_userId(resultSet.getString("user_userId"));
				bVo.setqContent(resultSet.getString("qContent"));
				bVo.setqComment(msg);

				dtos.add(bVo);
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
		return dtos;
	}
	
	public QDto contentView(String strqSeqno) {
		QDto dto =null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet =null;
		SimpleDateFormat sdf = new SimpleDateFormat();
		try {
			connection = dataSource.getConnection();
			String query = "select * from qna LEFT outer JOIN team_five.comment ON qna.qSeqno = comment.qna_qSeqno where qSeqno = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(strqSeqno));
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				int qSeqno = resultSet.getInt("qSeqno");
				String qTitle = resultSet.getString("qTitle");
				String qContent = resultSet.getString("qContent");
				String qFile = resultSet.getString("qFile");
				String qUserDate = sdf.format(resultSet.getTimestamp("qUserDate"));
				String user_userId = resultSet.getString("user_userId");
				String qChapter = resultSet.getString("qChapter");
				String qComment = resultSet.getString("qComment");
				
				dto = new QDto(qSeqno, qTitle, qContent, qFile, qUserDate, user_userId, qChapter, qComment);
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
	
	// 관리자 다오
	
	public ArrayList<QDto> selectAllQnA(int page, int pageSize) {
		
		String msg = "";
		int startNum=((page-1)*pageSize);
		
		ArrayList<QDto> Mdtos = new ArrayList<QDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet =null;
		
		StringBuffer sql=new StringBuffer();
		SimpleDateFormat sdf = new SimpleDateFormat();
		sql.append("select @ROWNUM := @ROWNUM + 1 as rno, m.*, c.qComment from qna m LEFT outer JOIN team_five.comment c ON m.qSeqno = c.qna_qSeqno, (select @rownum :=0) tmp ORDER BY rno LIMIT ?, ?"); 
		try {
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(sql.toString());
			preparedStatement.setInt(1, startNum);
			preparedStatement.setInt(2, pageSize);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				if(resultSet.getString("qComment") == null) {
					msg = "답변 대기";
				}else {
					msg = "답변 완료";
				}
				
				QDto MQnA = new QDto();
				MQnA.setqSeqno(resultSet.getInt("qSeqno"));
				MQnA.setqTitle(resultSet.getString("qTitle"));
				MQnA.setqFile(resultSet.getString("qFile"));
				MQnA.setqUserDate(sdf.format(resultSet.getTimestamp("qUserDate")));
				MQnA.setqChapter(resultSet.getString("qChapter"));
				MQnA.setUser_userId(resultSet.getString("user_userId"));
				MQnA.setqContent(resultSet.getString("qContent"));
				MQnA.setqComment(msg);
				
				
				Mdtos.add(MQnA);
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
		return Mdtos;
	}

	public int getQnACount() {
		String sql = "select count(*) from qna";

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet =null;
		int QnACount=0;
		try {
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(sql); // '?'바인드를 사용해서 sql문을 효과 적으로
			resultSet = preparedStatement.executeQuery();

			
			if (resultSet.next()) {
				QnACount=resultSet.getInt(1); // 전체 글 개수
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
		return QnACount;
	}
	
	public boolean commentwrite(String qComent, int qnaSeqno) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "insert into comment (admin_adminId, qComment, qna_qSeqno) values (?, ?, ?)";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, "admin");
			preparedStatement.setString(2, qComent);
			preparedStatement.setInt(3, qnaSeqno);
			preparedStatement.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
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
