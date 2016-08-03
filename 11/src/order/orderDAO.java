package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import DBControl.DBclose;
import DBControl.DBconnection;
import product.productDAO;

public class orderDAO implements iorderDAO {
	
	private static orderDAO odao;
	
	private orderDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			log("1/6 Success");
		} catch (ClassNotFoundException e) {
			log("1/6 Fail", e);
			System.out.println(e.getMessage());
		}
	}
	
	public static orderDAO getInstance(){
		if(odao == null){
			odao = new orderDAO();
		}
		return odao;
	}
	
	public void log(String msg){
		System.out.println(getClass() + ":" + msg);
	}
	
	public void log(String msg, Exception e){
		System.out.println(e + ":" + getClass() + ":" + msg);
	}

	@Override
	public boolean insertOrder(orderDTO odto) {
		String sql = " insert into order_table "
				+ " (order_seq, order_member_seq, order_product_seq, order_productOption_seq, order_amount, "
				+ " order_regiDate, order_confirm, order_del) "
				+ " values "
				+ " (seq_order_table.nextval, ?, ?, ?, ?, sysdate, 0, 0) ";
		
		Connection conn = null;
		PreparedStatement psmt= null;
		ResultSet rs = null;
		
		int count = 0;
		
		try{
			conn = DBconnection.makeConnection();
			
			psmt=conn.prepareStatement(sql);
			int i = 1;
			psmt.setInt(i++, odto.getOrder_member_seq());
			psmt.setInt(i++, odto.getOrder_product_seq());
			psmt.setInt(i++, odto.getOrder_productOption_seq());
			psmt.setInt(i++, odto.getOrder_amount());
			
			count = psmt.executeUpdate();
			
		}catch(SQLException e){
		}finally{
			DBclose.close(psmt, conn, rs);
		}
		return count>0?true:false;
	}

}
