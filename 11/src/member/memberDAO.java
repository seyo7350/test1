package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DBControl.DBclose;
import DBControl.DBconnection;

public class memberDAO implements iMemberDAO {
	
	private boolean isS = true;
	private static memberDAO memDAO;

	//memberDAO 생성관련 메소드
	public static memberDAO getInstance(){
		if(memDAO == null){
			memDAO = new memberDAO();
		}
		return memDAO;
	}	
	
    //회원가입
	@Override
	public boolean addMember(memberDTO mdto) {
		
		String sql = " insert into member_table "
				     + " (member_seq, member_name, member_id, member_password, member_postcode, member_address, member_addressDetail, "
				     + " member_email, member_phone, member_birthday, member_regidate, member_point, member_auth, member_del ) "
				     + " values(seq_member.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, 2000, 1, 0) ";
		
		Connection conn = null;
		PreparedStatement psmt= null;
		ResultSet rs = null;
		
		int count = 0;
		
		try{
			conn=DBconnection.makeConnection();
			log("2/6 성공 - 회원 가입");
			
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, mdto.getMember_name());
			psmt.setString(2, mdto.getMember_id());
			psmt.setString(3, mdto.getMember_password());
			psmt.setString(4, mdto.getMember_postcode());
			psmt.setString(5, mdto.getMember_address());
			psmt.setString(6, mdto.getMember_addressDetail());
			psmt.setString(7,  mdto.getMember_email());
			psmt.setString(8,  mdto.getMember_phone());
			psmt.setString(9,  mdto.getMember_birthday());
			log("3/6 성공 - 회원 가입");
			
			count=psmt.executeUpdate();
			log("4/6 성공 - 회원 가입");
			
		}catch(SQLException e){
			log("회원 가입 - 실패"+ e);
		}finally{
			DBclose.close(psmt, conn, rs);
			log("5/6 성공 - 회원 가입");
		}
		return count>0?true:false;
	}
	
	
	//중복확인



	
	
		//로그 메소드1
		public void log(String msg) {
			// TODO Auto-generated method stub
			if(isS){
				System.out.println(getClass()+":" + msg);
			}
		}
		
		//로그 메소드2
		public void log(String msg, Exception e) {
			// TODO Auto-generated method stub
			if(isS){
				System.out.println(e + " : "+getClass()+" : " + msg);
			}
		}

}
