package notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import qna.DAOSetting;
import qna.QnADTO;

public class NoticeDAO {

	DAOSetting daosetting = DAOSetting.getInstance();
	
	public NoticeDAO() {
		// TODO Auto-generated constructor stub
	}
	
	// 공지사항 목록 보기
	public List<NoticeDTO> noticeList() {
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<NoticeDTO> nList = new ArrayList<NoticeDTO>();
		
		try{
			conn = DAOSetting.getConnection();
			System.out.println("2/6 Success noticeList");

			String sql = " select notice_num, notice_author, notice_pwd, notice_title, notice_content, to_char(notice_writeday, 'YYYY/MM/DD') notice_writeday, notice_readCnt, notice_important "
					+ " from notice_table "
					+ " order by notice_num desc ";
			
			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 Success noticeList");
			
			rs = psmt.executeQuery();
			System.out.println("4/6 Success noticeList");
			
			while(rs.next()){
				int i = 1;
				NoticeDTO nDTO = new NoticeDTO(rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getInt(i++), rs.getInt(i++));
				
				nList.add(nDTO);
			}
			
		}catch(SQLException e){
			System.out.println("FAIL noticeList" + " " + e);
		}finally{
			DAOSetting.close(conn, psmt, rs);
			System.out.println("5/6 Success noticeList");
		}
		return nList;
	}
	
	// 공지사항 쓰기
	public void writeNotice(String notice_author, String notice_pwd, String notice_title, String notice_content) {
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try{
			conn = DAOSetting.getConnection();
			System.out.println("2/6 Success writeNotice");
			
			String sql = " insert into notice_table "
					+ " (notice_num, notice_author, notice_pwd, notice_title, notice_content, notice_writeday, notice_readCnt, notice_important) "
					+ " values(notice_table_seq.nextval, ?, ?, ?, ?, sysdate, 0, 0) ";
			
			psmt = conn.prepareStatement(sql);
			
			int i = 1;
			
			psmt.setString(i++, notice_author);
			psmt.setString(i++, notice_pwd);
			psmt.setString(i++, notice_title);
			psmt.setString(i++, notice_content);

			System.out.println("3/6 Success writeNotice");
			
			count = psmt.executeUpdate();
			System.out.println("4/6 Success writeNotice");
			
		}catch(SQLException e){
			System.out.println("FAIL writeNotice" + " " + e.getMessage());
		}finally{
			DAOSetting.close(conn, psmt, null);
			System.out.println("5/6 Success writeNotice");
		}
		
	}
	
	// 조회수 1 증가
	public void readCount(String _notice_num) {
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try{
			conn = DAOSetting.getConnection();
			System.out.println("2/6 Success readCount");
			
			String sql = " update notice_table "
					+ " set notice_readCnt=notice_readCnt+1"
					+ " where notice_num="+_notice_num;
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 Success readCount");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 Success readCount");
			
		}catch(SQLException e){
			System.out.println("FAIL readCount" + e);
		}finally{
			DAOSetting.close(conn, psmt, null);
			System.out.println("4/6 Success readCount");
		}
		
	}
	
	// 공지사항 자세히 보기
	public NoticeDTO noticeDetail(String _notice_num) {
		
		readCount(_notice_num);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		NoticeDTO nDTO = null;
		
		try{
			conn = DAOSetting.getConnection();
			System.out.println("2/6 Success noticeDetail");
			
			String sql = " select * from notice_table where notice_num=? ";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, Integer.parseInt(_notice_num));
			System.out.println("3/6 Success noticeDetail");
			
			rs = psmt.executeQuery();
			
			while(rs.next()){
				
				int i = 1;
				nDTO = new NoticeDTO(rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getInt(i++), rs.getInt(i++));
				
			}
			System.out.println("4/6 Success qnaDetail");
			
		}catch(SQLException e){
			System.out.println("FAIL noticeDetail" + " " + e);
		}finally{
			DAOSetting.close(conn, psmt, rs);
			System.out.println("5/6 Success noticeDetail");
		}
		return nDTO;
	}
	
	// 페이징 처리
	
	// 페이지 구현
}
