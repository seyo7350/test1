package DBControl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnection {
	
	public DBconnection(){}
	
	static{
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e){
		}
	}
	
	public static Connection makeConnection(){
		Connection conn = null;
		
		try{
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
		}catch(SQLException e){
			System.out.println(e.getMessage());
		}
		
		return conn;
	}
}
