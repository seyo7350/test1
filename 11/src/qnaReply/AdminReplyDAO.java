package qnaReply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import qna.DAOSetting;

public class AdminReplyDAO {

	DAOSetting daosetting = DAOSetting.getInstance();	////////////////////
	
	// 관리자 댓글 쓰기
	public void writeAdminReply(int qnaanswer_qna_num, String qnaAnswer_author, String qnaAnswer_pwd, String qnaAnswer_content) {
		
		/*System.out.println(qnaanswer_qna_num);
		System.out.println(qnaAnswer_author);
		System.out.println(qnaAnswer_pwd);
		System.out.println(qnaAnswer_content);*/
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try{
			conn = DAOSetting.getConnection();
			System.out.println("2/6 Success writeAdminReply");
			
			String sql = " insert into qnaAnswer_table  "
					+ " (qnaAnswer_num, qnaanswer_qna_num, qnaAnswer_author, qnaAnswer_pwd, qnaAnswer_content, qnaAnswer_writeday) "
					+ " values(qnaAnswer_table_seq.nextval, ?, ?, ?, ?, sysdate) ";
			
			psmt = conn.prepareStatement(sql);
			
			int i = 1;
			
			psmt.setInt(i++, qnaanswer_qna_num);
			psmt.setString(i++, qnaAnswer_author);
			psmt.setString(i++, qnaAnswer_pwd);
			psmt.setString(i++, qnaAnswer_content);
			
			System.out.println("3/6 Success writeAdminReply");
			
			psmt.executeUpdate();
			System.out.println("4/6 Success writeAdminReply");
			
		}catch(SQLException e){
			System.out.println("FAIL writeAdminReply" + " " + e);
		}finally{
			DAOSetting.close(conn, psmt, null);
			System.out.println("5/6 Success writeAdminReply");
		}
	}
	
	/*// 관리자 댓글 보여주기
	public List<AdminReplyDTO> getAdminReplyList() {
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<AdminReplyDTO> adminReplyList = new ArrayList<AdminReplyDTO>();
		
		try{
			conn = DAOSetting.getConnection();
			System.out.println("2/6 Success getAdminReplyList");

			String sql = " select * from qnaAnswer_table order by qnaAnswer_num ";
			
			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 Success getAdminReplyList");
			
			rs = psmt.executeQuery();
			System.out.println("4/6 Success getAdminReplyList");
			
			while(rs.next()){
				int i = 1;
				
				AdminReplyDTO aDTO = new AdminReplyDTO(rs.getInt(i++), rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++));
				
				adminReplyList.add(aDTO);
			}
			
		}catch(SQLException e){
			System.out.println("FAIL getAdminReplyList" + " " + e);
		}finally{
			DAOSetting.close(conn, psmt, rs);
			System.out.println("5/6 Success getAdminReplyList");
		}
		return adminReplyList;
		
	}*/
	
	// 관리자가 쓴 댓글 보여주기
	public List<AdminReplyDTO> getQnAAnswer(int qnaanswer_qna_num) {
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<AdminReplyDTO> adminAnswerList = new ArrayList<AdminReplyDTO>();
		
		try{
			conn = DAOSetting.getConnection();
			System.out.println("2/6 Success getQnAAnswer");
			
			String sql = " select * from qnaanswer_table where qnaanswer_qna_num=? ";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, qnaanswer_qna_num);
			System.out.println("3/6 Success getQnAAnswer");
			
			rs = psmt.executeQuery();
			System.out.println("4/6 Success getQnAAnswer");
			
			while(rs.next()){
				int i = 1;
				AdminReplyDTO aDTO = new AdminReplyDTO(rs.getInt(i++), rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++));
				
				adminAnswerList.add(aDTO);
			}
			
		}catch(SQLException e){
			System.out.println("FAIL getQnAAnswer" + " " + e);
		}finally{
			DAOSetting.close(conn, psmt, rs);
			System.out.println("5/6 Success getQnAAnswer");
		}
		return adminAnswerList;
	}
	
	// 관리자가 쓴 댓글 보여주기
		public AdminReplyDTO getQnAAnswer2(int qnaanswer_qna_num) {
			
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			AdminReplyDTO aDTO = null;
					
			try{
				conn = DAOSetting.getConnection();
				System.out.println("2/6 Success getQnAAnswer2");
				
				String sql = " select * from qnaanswer_table where qnaanswer_qna_num=? ";
				
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, qnaanswer_qna_num);
				System.out.println("3/6 Success getQnAAnswer2");
				
				rs = psmt.executeQuery();
				System.out.println("4/6 Success getQnAAnswer2");
				
				while(rs.next()){
					int i = 1;
					aDTO = new AdminReplyDTO(rs.getInt(i++), rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++));
					
				}
				
			}catch(SQLException e){
				System.out.println("FAIL getQnAAnswer2" + " " + e);
			}finally{
				DAOSetting.close(conn, psmt, rs);
				System.out.println("5/6 Success getQnAAnswer2");
			}
			return aDTO;
		}
}















