package notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import qna.DAOSetting;
import qnaReply.AdminReplyDTO;

public class NoticeReplyDAO {

	DAOSetting daosetting = DAOSetting.getInstance();
	
	// 공지사항 댓글 쓰기
	public void writeNoticeReply(int noticeAnswer_notice_num, String noticeAnswer_author, String noticeAnswer_pwd, String noticeAnswer_content) {
		
		Connection conn = null;
		PreparedStatement psmt = null;
				
		try{
			conn = DAOSetting.getConnection();
			System.out.println("2/6 Success writeNoticeReply");
			
			String sql = " insert into noticeAnswer_table  "
					+ " (noticeanswer_num, noticeanswer_notice_num, noticeanswer_author, noticeanswer_pwd, noticeanswer_content, noticeanswer_writeday) "
					+ " values(noticeanswer_table_seq.nextval, ?, ?, ?, ?, sysdate) ";
			
			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 Success writeNoticeReply");
			
			
			int i = 1;
			psmt.setInt(i++, noticeAnswer_notice_num);
			psmt.setString(i++, noticeAnswer_author);
			psmt.setString(i++, noticeAnswer_pwd);
			psmt.setString(i++, noticeAnswer_content);
			
			psmt.executeUpdate();
			System.out.println("4/6 Success writeNoticeReply");
			
		}catch(SQLException e){
			System.out.println("FAIL writeNoticeReply" + " " + e);
		}finally{
			DAOSetting.close(conn, psmt, null);
			System.out.println("5/6 Success writeNoticeReply");
		}
	}
	
	// 공지사항 댓글 전체 가져오기
	public List<NoticeReplyDTO> getNoticeAnswer(int noticeAnswer_notice_num) {
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<NoticeReplyDTO> noticeAnswerList = new ArrayList<NoticeReplyDTO>();
		
		try{
			conn = DAOSetting.getConnection();
			System.out.println("2/6 Success getNoticeAnswer");
			
			String sql = " select * from noticeAnswer_table where noticeAnswer_notice_num=? order by noticeanswer_num asc ";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, noticeAnswer_notice_num);
			System.out.println("3/6 Success getNoticeAnswer");
			
			rs = psmt.executeQuery();
			System.out.println("4/6 Success getNoticeAnswer");
			
			while(rs.next()){
				int i = 1;
				NoticeReplyDTO noDTO = new NoticeReplyDTO(rs.getInt(i++), rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++));
				
				noticeAnswerList.add(noDTO);
			}
			
		}catch(SQLException e){
			System.out.println("FAIL getNoticeAnswer" + " " + e);
		}finally{
			DAOSetting.close(conn, psmt, rs);
			System.out.println("5/6 Success getNoticeAnswer");
		}
		return noticeAnswerList;
	}
}
