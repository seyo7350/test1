package product;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DBControl.DBclose;
import DBControl.DBconnection;

public class productDAO implements iproductDAO {

	private static productDAO pdao;
	
	private productDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			log("1/6 Success");
		} catch (ClassNotFoundException e) {
			log("1/6 Fail", e);
			System.out.println(e.getMessage());
		}
	}
	
	public static productDAO getInstance(){
		if(pdao == null){
			pdao = new productDAO();
		}
		return pdao;
	}
	
	public void log(String msg){
		System.out.println(getClass() + ":" + msg);
	}
	
	public void log(String msg, Exception e){
		System.out.println(e + ":" + getClass() + ":" + msg);
	}

	@Override
	public List<productDTO> getProductList(int product_style_code) {
		String sql = " select product_seq, product_name, product_price, product_point, product_option_count, "
				+ " product_info_about, product_info_detail_tip, product_info_size_tip, product_info_washing_tip, "
				+ " product_photo_gif, product_photo_main, product_photo_detail_main, product_photo_detail, "
				+ " product_style_code, product_regiDate, product_del from product_table "
				+ "	where product_style_code=? "
				+ " order by product_seq desc ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		productDTO pdto = null;
		List<productDTO> pList = new ArrayList<productDTO>();
		
		try {
			conn = DBconnection.makeConnection();
			
			psmt = conn.prepareStatement(sql);		
			psmt.setInt(1, product_style_code);
			rs = psmt.executeQuery();
			
			while(rs.next()){
				int i = 1;
				pdto = new productDTO(
						rs.getInt(i++),			// product_seq
						rs.getString(i++),		// product_name
						rs.getInt(i++),			// product_price
						rs.getInt(i++),			// product_point
						rs.getInt(i++),			// product_option_count
						rs.getString(i++),		// product_info_about
						rs.getString(i++),		// product_info_detail						
						rs.getString(i++),		// product_info_size_tip
						rs.getString(i++),		// product_info_washing_tip
						rs.getString(i++),		// product_photo_gif
						rs.getString(i++),		// product_photo_main
						rs.getString(i++),		// product_photo_detail_main
						rs.getString(i++),		// product_photo_detail
						rs.getInt(i++),			// product_style_code
						rs.getDate(i++),		// product_regiDate
						rs.getInt(i++)			// product_del
						);
				pList.add(pdto);
			}
		} catch(SQLException e) {
			
		} finally {
			DBclose.close(psmt, conn, rs);
		}
		
		return pList;
	}
	
	@Override
	public boolean insertProduct(productDTO pdto, List<productOptionDTO> product_list) {
		String sql1 = " insert into product_table "
				+ " (product_seq, product_name, product_price, product_point, product_option_count, "
				+ " product_info_about, product_info_detail_tip, product_info_size_tip, product_info_washing_tip, "
				+ " product_photo_gif, product_photo_main, product_photo_detail_main, product_photo_detail, "
				+ " product_style_code, product_regiDate, product_del) "
				+ " values "
				+ " (seq_product_table.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,sysdate, 0) ";
		
		String sql2 = " select nvl(max(product_seq), 0) from product_table ";
		
		String sql3 = " insert into productOption_table "
				+ " (productOption_seq, productOption_product_seq, productOption_color, "
				+ " productOption_colorCode, productOption_amount, productOption_del) "
				+ " values "
				+ " (seq_productOption_table.nextval, ?, ?, ?, ?, 0) ";
				
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int product_seq = -1;
		int count = 0;
				
		try {
			conn = DBconnection.makeConnection();
			conn.setAutoCommit(false);
			log("2/6 Success insertProduct");
			
			psmt = conn.prepareStatement(sql1);
			System.out.println("cccccc");
			
			int i = 1;
			psmt.setString(i++, pdto.getProduct_name());
			psmt.setInt(i++, pdto.getProduct_price());
			psmt.setInt(i++, pdto.getProduct_point());
			psmt.setInt(i++, pdto.getProduct_option_count());
			psmt.setString(i++, pdto.getProduct_info_about());
			psmt.setString(i++, pdto.getProduct_info_detail_tip());
			psmt.setString(i++, pdto.getProduct_info_size_tip());
			psmt.setString(i++, pdto.getProduct_info_washing_tip());
			psmt.setString(i++, pdto.getProduct_photo_gif());
			psmt.setString(i++, pdto.getProduct_photo_main());
			psmt.setString(i++, pdto.getProduct_photo_detail_main());
			psmt.setString(i++, pdto.getProduct_photo_detail());
			psmt.setInt(i++, pdto.getProduct_style_code());
			count = psmt.executeUpdate();	
			System.out.println("cccccc");
			psmt.clearParameters();			
			
			psmt = conn.prepareStatement(sql2);
			rs = psmt.executeQuery();
			System.out.println("cccccc");
			if(rs.next()){
				product_seq = rs.getInt(1);
			}
			System.out.println("product_seq="+product_seq);
			psmt.clearParameters();			
			psmt = conn.prepareStatement(sql3);			
			/*String[] getProduct_option_count = pdto.getProduct_option_count();*/
			for(int j = 0; j < pdto.getProduct_option_count(); j++){
				i = 1;
				psmt.setInt(i++, product_seq);
				psmt.setString(i++, product_list.get(j).getProductOption_color());
				psmt.setString(i++,	product_list.get(j).getProductOption_colorCode());
				psmt.setInt(i++, product_list.get(j).getProductOption_amount());
				psmt.addBatch();
			}
			log("3/6 Success insertProduct");
			psmt.executeBatch();
			log("4/6 Success insertProduct");
			
			conn.commit();			
		} catch(SQLException e) {			
			try {
				conn.rollback();
			} catch (SQLException e1) {
				log("Fail insertProduct",e);
			}
			log("insertProduct Fail", e);
		} finally {			
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				log("Fail insertProduct",e);
			}			
			DBclose.close(psmt, conn, rs);
			log("6/6 success insertProduct");
		}
		return count>0?true:false;
	}


	@Override
	public productDTO getProduct(int product_seq) {
		String sql = " select product_seq, product_name, product_price, product_point, product_option_count, "
				+ " product_info_about, product_info_detail_tip, product_info_size_tip, product_info_washing_tip, "
				+ " product_photo_gif, product_photo_main, product_photo_detail_main, product_photo_detail, "
				+ " product_style_code, product_regiDate, product_del "
				+ " from product_table "
				+ " where product_seq = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		productDTO pdto = null;
				
		try {
			conn = DBconnection.makeConnection();
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, product_seq);
			rs = psmt.executeQuery();
			
			if(rs.next()){
				int i = 1;
				pdto = new productDTO(
						rs.getInt(i++),			// product_seq
						rs.getString(i++),		// product_name
						rs.getInt(i++),			// product_price
						rs.getInt(i++),			// product_point
						rs.getInt(i++),			// product_option_count
						rs.getString(i++),		// product_info_about
						rs.getString(i++),		// product_info_detail						
						rs.getString(i++),		// product_info_size_tip
						rs.getString(i++),		// product_info_washing_tip
						rs.getString(i++),		// product_photo_gif
						rs.getString(i++),		// product_photo_main
						rs.getString(i++),		// product_photo_detail_main
						rs.getString(i++),		// product_photo_detail
						rs.getInt(i++),			// product_style_code
						rs.getDate(i++),		// product_regiDate
						rs.getInt(i++)			// product_del
						);
			}
			
		} catch(SQLException e) {
			log("getProduct Fail", e);
		} finally {
			DBclose.close(psmt, conn, rs);
			log("6/6 success getProduct");
		}
		
		return pdto;
	}

	@Override
	public List<productOptionDTO> getProductOptionList(int product_seq) {
		String sql = " select productOption_seq, productOption_product_seq, productOption_color, "
				+ " productOption_colorCode, productOption_amount, productOption_del "
				+ " from productOption_table "
				+ " where productOption_product_seq = ? ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		productOptionDTO podto = null;
		List<productOptionDTO> poList = new ArrayList<productOptionDTO>();
				
		try {
			conn = DBconnection.makeConnection();
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, product_seq);
			rs = psmt.executeQuery();
			
			while(rs.next()){
				int i = 1;
				podto = new productOptionDTO(
							rs.getInt(i++),		// productOption_seq
							rs.getInt(i++),		// productOption_product_seq
							rs.getString(i++),	// productOption_color
							rs.getString(i++),	// productOption_colorCode
							rs.getInt(i++),		// productOption_amount
							rs.getInt(i++)		// productOption_del
						);
				poList.add(podto);
			}
			
		} catch(SQLException e) {
			log("getProductOptionList Fail", e);
		} finally {
			DBclose.close(psmt, conn, rs);
			log("6/6 success getProductOptionList");
		}
		
		return poList;
	}

	@Override
	public int getseq() {
		
		String sql = " select nvl(max(product_seq), 0) from product_table ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int next_seq = -1;
		log("2/6 Sucess getseq");
		
		try {
			conn = DBconnection.makeConnection();	
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			log("3/6 Sucess getseq");
			
			while(rs.next()){
				next_seq = rs.getInt(1);
			}
			log("4/6 Sucess getseq");
			
		}catch(SQLException e){
			log("Fail getseq",e);
		}
		System.out.println(next_seq+1);
		return next_seq+1;
	}
	
	
	
}
