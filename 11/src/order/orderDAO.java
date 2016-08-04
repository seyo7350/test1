package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

	@Override
	public List<orderDTO> getadminOrderList() {
		
		String sql = " select * from order_table "
				+ " order by order_confirm ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<orderDTO> orderlist = new ArrayList<orderDTO>();
		
		try{
			conn=DBconnection.makeConnection();
			log("2/6 Success getOrderList");
			
			psmt=conn.prepareStatement(sql);
			log("3/6 Success getOrderList");
			
			rs=psmt.executeQuery();
			log("4/6 Success getOrderList");
			
			while(rs.next()){
				int i = 1;
				orderDTO odto = new orderDTO(
						rs.getInt(i++),
						rs.getInt(i++),
						rs.getInt(i++),
						rs.getInt(i++),
						rs.getInt(i++),
						rs.getDate(i++),
						rs.getInt(i++),
						rs.getInt(i++)
						);
				orderlist.add(odto);
			}
			log("5/6 Success getOrderList");
			
		}catch(SQLException e){
			log("Fail getOrderList");
		}finally{
			DBclose.close(psmt, conn, rs);
		}
		
		return orderlist;
	}

	@Override
	public boolean updateorder_confirm(int order_seq) {
		
		String sql = " update order_table set order_confirm = 2 "
				+ "	where order_seq = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int count = 0;
		
		try{
			conn = DBconnection.makeConnection();
			log("2/6  successupdateorder_confirm");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, order_seq);
			log("3/6  successupdateorder_confirm");
			
			count = psmt.executeUpdate();
			log("4/6  successupdateorder_confirm");
			
		}catch(SQLException e){
			log("Fail updateorder_confirm",e);
		}finally {
			DBclose.close(psmt, conn, rs);
			log("5/6  successupdateorder_confirm");
		}
		return count>0?true:false;
	}
	
	

}
