package Employee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Employee.EmployeeDTO;

import DBControl.DBclose;
import DBControl.DBconnection;

public class EmployeeDAO implements EmployeeiDAO{
	
	private boolean isS = true;
	private static EmployeeDAO  empDao;
	
	@Override
	public EmployeeDTO login(EmployeeDTO edto) {
		
		String sql = "select * "
				+ "from employee where e_idennum=?  and e_pass=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		EmployeeDTO empl = null;
		
		try {
			conn = DBconnection.makeConnection();
			log("2/6성공 - 로그인");
			
			psmt= conn.prepareStatement(sql);
			psmt.setString(1, edto.getE_idennum());
			psmt.setString(2, edto.getE_pass());
			log("3/6성공 - 로그임");
			
			rs = psmt.executeQuery();
			log("4/6성공 - 로그인");
			
			while(rs.next()){
				
			}
		} catch (Exception e) {
			log("로그인 실패" + e);
		}finally{
			DBclose.close(psmt, conn, rs);
			log("6/6성공 - 로그인");
		}
		return empl;
	}

	public static EmployeeDAO getInstance(){
		if(empDao == null){
			empDao = new EmployeeDAO();
		}
		return empDao;
	}
	
	public void log(String msg) {
		if(isS){
			System.out.println(getClass() + ": " + msg);
		}
	}
	
	public void log(String msg, Exception e) {
		if(isS){
			System.out.println(e+ ": " + getClass() + ": " + msg);
		}
	}

}
