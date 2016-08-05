package qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class QnADAO {
	
	DAOSetting daosetting = DAOSetting.getInstance();	

	public QnADAO() {
		// TODO Auto-generated constructor stub
	}
	
	//글 목록보기
	public List<QnADTO> qnaList() {
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<QnADTO> qList = new ArrayList<QnADTO>();
		
		try{
			
			
			conn = DAOSetting.getConnection();
			System.out.println("2/6 Success qnaList");
			
			String sql = " select qna_num, qna_author, qna_pwd, qna_subhead, qna_title, qna_content, to_char(qna_writeday, 'YYYY/MM/DD') qna_writeday, qna_readCnt, qna_important, qna_product_seq "
					+ " from qna_table "
					+ " order by qna_num desc ";
			
			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 Success qnaList");
			
			rs = psmt.executeQuery();
			System.out.println("4/6 Success qnaList");
			
			while(rs.next()) {
				int i = 1;
				QnADTO qDTO = new QnADTO(rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getInt(i++), rs.getInt(i++),rs.getInt(i++));
				
				qList.add(qDTO);
				
			}
			
		}catch(SQLException e){
			System.out.println("FAIL qnaList" + e.getMessage());
		}finally{
			DAOSetting.close(conn, psmt, rs);
			System.out.println("5/6 Success qnaList");
		}
		
		return qList;
	}
	
	//글 쓰기
	public void writeQnA(String qna_author, String qna_pwd, String qna_subhead, String qna_title, String qna_content, int qna_product_seq) {
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try{
			conn = DAOSetting.getConnection();
			System.out.println("2/6 Success writeQnA");
			
			String sql = " insert into qna_table "
					+ " (qna_num, qna_author, qna_pwd, qna_subhead, qna_title, qna_content, qna_writeday, qna_readCnt, qna_important, qna_product_seq) "
					+ " values(qna_table_seq.nextval, ?, ?, ?, ?, ?, sysdate, 0, 0, ?) ";
			
			psmt = conn.prepareStatement(sql);
			int i = 1;
			
			psmt.setString(i++, qna_author);
			psmt.setString(i++, qna_pwd);
			psmt.setString(i++, qna_subhead);
			psmt.setString(i++, qna_title);
			psmt.setString(i++, qna_content);

			System.out.println("3/6 Success writeQnA");
			
			count = psmt.executeUpdate();
			System.out.println("4/6 Success writeQnA");
			
		}catch(SQLException e){
			System.out.println("FAIL writeQnA" + e.getMessage());
		}finally{
			DAOSetting.close(conn, psmt, null);
			System.out.println("5/6 Success writeQnA");
		}
		
	}
	
	//조회수 1 증가
	public void readCount(String _qna_num) {
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try{
			conn = DAOSetting.getConnection();
			System.out.println("2/6 Success readCount");
			
			String sql = " update qna_table "
					+ " set qna_readCnt=qna_readCnt+1"
					+ " where qna_num="+_qna_num;
			
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
	
	//글 자세히 보기
	public QnADTO qnaDetail(String _qna_num) {
		
		readCount(_qna_num);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		QnADTO qDTO = null;
		
		try{
			conn = DAOSetting.getConnection();
			System.out.println("2/6 Success qnaDetail");
			
			
			String sql = " select qna_num, qna_author, qna_pwd, qna_subhead, qna_title, qna_content, to_char(qna_writeday, 'YYYY-MM-DD') qna_writeday, qna_readCnt, qna_important "
					+ " from qna_table "
					+ " where qna_num=? ";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, Integer.parseInt(_qna_num));
			System.out.println("3/6 Success qnaDetail");
			
			rs = psmt.executeQuery();
			
			while(rs.next()){
				
				int i = 1;
				qDTO = new QnADTO(rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getInt(i++), rs.getInt(i++),rs.getInt(i++));
				
			}
			System.out.println("4/6 Success qnaDetail");
			
		}catch(SQLException e){
			System.out.println("FAIL qnaDetail" + e);
		}finally{
			DAOSetting.close(conn, psmt, rs);
			System.out.println("5/6 Success qnaDetail");
		}
		return qDTO;
	}
	
	// 페이징처리
	
	public int totalCount() {
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int count = 0;
		
		try{
			conn = DAOSetting.getConnection();
			System.out.println("2/6 Success totalCount");
			
			String sql = " select count(*) from qna_table ";
			
			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 Success totalCount");
			
			rs = psmt.executeQuery();
			System.out.println("4/6 Success totalCount");
			
			if(rs.next()){	// if?
				count = rs.getInt(1);
			}
			
		}catch(SQLException e){
			System.out.println("FAIl totalCount" + e);
			
		}finally{
			DAOSetting.close(conn, psmt, rs);
			System.out.println("5/6 Success totalCount");
		}
		return count;
	}
	
	// 페이지 구현
	public PageDTO page(int curPage) {
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		PageDTO pDTO = new PageDTO();
		int totalCount = totalCount();
		
		List<QnADTO> qList = new ArrayList<QnADTO>();
		
		try{
			conn = DAOSetting.getConnection();
			System.out.println("2/6 Success page");
			
			String sql = " select qna_num, qna_author, qna_pwd, qna_subhead, qna_title, qna_content, to_char(qna_writeday, 'YYYY/MM/DD') qna_writeday, qna_readCnt, qna_important,qna_product_seq "
					+ " from qna_table "
					+ " order by qna_num desc ";
			
			psmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			System.out.println("3/6 Success page");
			
			rs = psmt.executeQuery();
			System.out.println("4/6 Success page");
			
			int perPage = pDTO.getPerPage();	//10
			
			int skip = (curPage - 1) * perPage;
			if( skip > 0) {
				rs.absolute(skip);
			}
			
			for (int j = 0; j < perPage && rs.next(); j++) {
				
				int i = 1;
				QnADTO qDTO = new QnADTO(rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getInt(i++), rs.getInt(i++),rs.getInt(i++));
				
				qList.add(qDTO);
			}
			
			pDTO.setpList(qList);
			pDTO.setTotalCount(totalCount);
			pDTO.setCurPage(curPage);
			
		}catch(SQLException e){
			System.out.println("FAIL page" + e);
		}finally{
			DAOSetting.close(conn, psmt, rs);
			System.out.println("5/6 Success page");
		}
		return pDTO;
	}
	
	public List<QnADTO> getproductqnaList(int product_seq) {
		
		String sql = " select qna_num, qna_author, qna_pwd, qna_subhead, qna_title, qna_content, to_char(qna_writeday, 'YYYY/MM/DD') qna_writeday, "
				+ " qna_readCnt, qna_important, qna_product_seq from qna_table where qna_product_seq = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<QnADTO> getpqList = new ArrayList<QnADTO>();
		
		try{
			
			conn = DAOSetting.getConnection();
			System.out.println("2/6 Success getproductqnaList");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, product_seq);
			System.out.println("3/6 Success getproductqnaList");
			
			rs = psmt.executeQuery();
			System.out.println("4/6 Success getproductqnaList");
			
			while(rs.next()) {
				int i = 1;
				QnADTO qDTO = new QnADTO(
						rs.getInt(i++), 
						rs.getString(i++), 
						rs.getString(i++), 
						rs.getString(i++), 
						rs.getString(i++), 
						rs.getString(i++), 
						rs.getString(i++), 
						rs.getInt(i++), 
						rs.getInt(i++),
						rs.getInt(i++)
						);
				getpqList.add(qDTO);
			}
			
		}catch(SQLException e){
			System.out.println("FAIL qnaList" + e.getMessage());
		}finally{
			DAOSetting.close(conn, psmt, rs);
			System.out.println("5/6 Success qnaList");
		}
		
		return getpqList;
	}
	
}















