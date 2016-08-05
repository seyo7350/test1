package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DBControl.DBclose;
import DBControl.DBconnection;
import notice.NoticeDTO;
import product.productDAO;
import product.productDTO;
import qna.DAOSetting;

public class ReviewDAO implements iReviewDAO {
	
	private static ReviewDAO reviewdao;
	
	private ReviewDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("1/6 Success");
		} catch (ClassNotFoundException e) {
			System.out.println("FAIL " + " " + e );
			System.out.println(e.getMessage());
		}
	}
	
	public static ReviewDAO getInstance(){
		if(reviewdao == null){
			reviewdao = new ReviewDAO();
		}
		return reviewdao;
	}
	
	public void log(String msg){
		System.out.println(getClass() + ":" + msg);
	}
	
	public void log(String msg, Exception e){
		System.out.println(e + ":" + getClass() + ":" + msg);
	}
	
	// 리뷰 리스트
	@Override
	public List<ReviewDTO> getReviewList() {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<ReviewDTO> rList = new ArrayList<ReviewDTO>();
		
		try{
			conn = DBconnection.makeConnection();
			System.out.println("2/6 Success getReviewList");

			String sql = " select review_num, review_member_num, review_product_num, review_productOption_num, review_author, review_title, review_content, to_char(review_writeday, 'YYYY/MM/DD') review_writeday, review_del, review_imageUrl "
					+ " from review_table "
					+ " order by review_num desc ";
			
			psmt = conn.prepareStatement(sql);
			System.out.println("3/6 Success getReviewList");
			
			rs = psmt.executeQuery();
			System.out.println("4/6 Success getReviewList");
			
			while(rs.next()){
				int i = 1;
				ReviewDTO rDTO = new ReviewDTO(rs.getInt(i++), rs.getInt(i++), rs.getInt(i++), rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getInt(i++), rs.getString(i++));
				
				rList.add(rDTO);
			}
			
		}catch(SQLException e){
			System.out.println("FAIL noticeList" + " " + e);
		}finally{
			DBclose.close(psmt, conn, rs);
			System.out.println("5/6 Success getReviewList");
		}
		return rList;
	}
	
	// 리뷰 쓰기
	@Override
	public void writeReview(int review_member_num, int review_product_num, int review_productOption_num, String review_author, String review_title, String review_content, String review_imageUrl) {
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try{
			conn = DBconnection.makeConnection();
			System.out.println("2/6 Success writeReview");
			
			String sql = " insert into review_table "
					+ " (review_num, review_member_num, review_product_num, review_productOption_num, review_author, review_title, review_content, review_writeday, review_del, review_imageUrl) "
					+ " values(review_table_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate, 0, ?) ";
			
			psmt = conn.prepareStatement(sql);
			
			int i = 1;
			
			psmt.setInt(i++, review_member_num);
			psmt.setInt(i++, review_product_num);
			psmt.setInt(i++, review_productOption_num);
			psmt.setString(i++, review_author);
			psmt.setString(i++, review_title);
			psmt.setString(i++, review_content);
			psmt.setString(i++, review_imageUrl);

			System.out.println("3/6 Success writeReview");
			
			count = psmt.executeUpdate();
			System.out.println("4/6 Success writeReview");
			
		}catch(SQLException e){
			System.out.println("FAIL writeReview" + " " + e.getMessage());
		}finally{
			DAOSetting.close(conn, psmt, null);
			System.out.println("5/6 Success writeReview");
		}
		
	}
	
	// 상품에 대한 리스트
	   @Override
	   public List<ReviewDTO> getProductReviewList(int review_product_num) {
	      
	      
	      String sql = " select review_num, review_member_num, review_product_num, review_productOption_num, review_author, review_title, review_content, to_char(review_writeday, 'YYYY/MM/DD') review_writeday, review_del, review_imageUrl "
	               + " from review_table where review_product_num=? ";
	      

	      
	      Connection conn = null;
	      PreparedStatement psmt = null;
	      ResultSet rs = null;
	      
	      List<ReviewDTO> gprList = new ArrayList<ReviewDTO>();
	      
	      try{
	         conn = DBconnection.makeConnection();
	         System.out.println("2/6 Success getReviewList");

	         psmt = conn.prepareStatement(sql);
	         psmt.setInt(1,review_product_num);
	         System.out.println("3/6 Success getReviewList");
	         
	         rs = psmt.executeQuery();
	         System.out.println("4/6 Success getReviewList");
	         
	         while(rs.next()){
	            int i = 1;
	            ReviewDTO rDTO = new ReviewDTO(
	                     rs.getInt(i++), 
	                     rs.getInt(i++), 
	                     rs.getInt(i++), 
	                     rs.getInt(i++), 
	                     rs.getString(i++), 
	                     rs.getString(i++), 
	                     rs.getString(i++), 
	                     rs.getString(i++), 
	                     rs.getInt(i++), 
	                     rs.getString(i++)
	            );
	            
	            gprList.add(rDTO);
	         }
	         
	      }catch(SQLException e){
	         System.out.println("FAIL noticeList" + " " + e);
	      }finally{
	         DBclose.close(psmt, conn, rs);
	         System.out.println("5/6 Success getReviewList");
	      }
	      return gprList;
	   }
	   
	   public ReviewDTO ReviewDetail(int review_seq) {
			String sql = "select review_num, review_member_num, review_product_num, review_productOption_num, review_author, review_title, review_content, to_char(review_writeday, 'YYYY/MM/DD') review_writeday, review_del, review_imageUrl "
					+ " from review_table "
					+ " where review_num = ?";
			
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			ReviewDTO rdto = null;
					
			try {
				conn = DBconnection.makeConnection();
				log("2/6 success getReview");
				
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, review_seq);
				rs = psmt.executeQuery();
				log("3/6 success getReview");
				
				if(rs.next()){
					int i = 1;
					rdto = new ReviewDTO(
							rs.getInt(i++),
							rs.getInt(i++),
							rs.getInt(i++),
							rs.getInt(i++),
							rs.getString(i++),
							rs.getString(i++),
							rs.getString(i++),
							rs.getString(i++),
							rs.getInt(i++),
							rs.getString(i++)
							);
				}
				log("4/6 success getReview");
				
			} catch(SQLException e) {
				log("getReview Fail", e);
			} finally {
				DBclose.close(psmt, conn, rs);
				log("6/6 success getReview");
			}
			return rdto;
		}
}
	
	




	


