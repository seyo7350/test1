package sist.co.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DAOSetting {

	private static DAOSetting daosetting;
	
	public static DAOSetting getInstance() {
		
		if(daosetting == null){
			 daosetting = new DAOSetting();
		}
		return daosetting;
	}
	
	private DAOSetting() {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("1/6 Success Search Class");
		} catch (ClassNotFoundException e) {
			System.out.println("FAIL Serch Class" + "" + e.getMessage());
		}
	}
	
	public static Connection getConnection() throws SQLException {
		
		Connection conn = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String pwd = "hr";
		
		conn = DriverManager.getConnection(url, user, pwd);
		return conn;
	}
	
	public static void close(Connection conn, Statement stmt, ResultSet rs) {
		
		if(rs != null){
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(stmt != null){
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(conn != null){
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}
	}
}
