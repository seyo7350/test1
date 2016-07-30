package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import DBControl.DBclose;
import DBControl.DBconnection;
import java.util.Date;

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
	
	
	//로그인
	@Override
	public memberDTO login(memberDTO mdto) {
		String sql = " select member_seq, member_name, member_id, member_postcode, "
				     + " member_address, member_addressDetail, member_email, member_phone, "
				     + " member_birthday, member_regidate, member_point, member_auth, member_del "
				     + " from member_table where member_id=? and member_password =? ";
		
		Connection conn = null;
		PreparedStatement psmt= null;
		ResultSet rs = null;
		memberDTO mem = null;
		
		try{
			conn=DBconnection.makeConnection();
			log("2/6 성공 - 로그인");
			
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, mdto.getMember_id());
			psmt.setString(2, mdto.getMember_password());
			log("3/6 성공 - 로그인");
			
			rs=psmt.executeQuery();
			log("4/6 성공 - 로그인");
			
			while(rs.next()){
				int seq = rs.getInt(1);
				String name = rs.getString(2);
				String id = rs.getString(3);
				String postcode = rs.getString(4);
				String address = rs.getString(5);
				String addressDetail = rs.getString(6);
				String email = rs.getString(7);
				String phone = rs.getString(8);
				String birthday = rs.getString(9);
				Date regidate = rs.getDate(10);
				int point = rs.getInt(11);
				int auth= rs.getInt(12);
				int del = rs.getInt(13);
				
				mem = new memberDTO(seq, name, id, null, postcode, address, addressDetail, email, phone, birthday, regidate, point, auth, del);
			}
			log("5/6 성공 - 로그인");
			
		}catch(SQLException e){
			log("회원 로그인 - 실패"+ e);
		}finally{
			DBclose.close(psmt, conn, rs);
			log("5/6 성공 - 회원 로그인");
		}
		return mem;
	}

	//아이디 중복
	@Override
	public int confirmId(String id) {
		
	   String sql = " select member_id from member_table where member_id =? ";
	
	   Connection conn = null;
	   PreparedStatement psmt= null;
	   ResultSet rs = null;
	   
	   int x =-1;
	   
		try{
			conn=DBconnection.makeConnection();
			log("2/6 성공 - id 체크");
			
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs=psmt.executeQuery();
			log("3/6 성공 - id 체크");
			
			if(rs.next()){
				x=1;
			}
			log("5/6 성공 - id 체크");
			
		}catch(SQLException e){
			log("id 체크 - 실패"+ e);
		}finally{
			DBclose.close(psmt, conn, rs);
			log("5/6 성공 - id 체크");
		}
		return x;
	}
	
	//이메일 중복
	@Override
	public int confirmEmail(String email) {
		   String sql = " select member_email from member_table where member_email =? ";
			
		   Connection conn = null;
		   PreparedStatement psmt= null;
		   ResultSet rs = null;
		   
		   int x =-1;
		   
			try{
				conn=DBconnection.makeConnection();
				log("2/6 성공 - email 체크");
				
				psmt=conn.prepareStatement(sql);
				psmt.setString(1, email);
				rs=psmt.executeQuery();
				log("3/6 성공 - email 체크");
				
				if(rs.next()){
					x=1;
				}
				log("5/6 성공 - email 체크");
				
			}catch(SQLException e){
				log("email 체크 - 실패"+ e);
			}finally{
				DBclose.close(psmt, conn, rs);
				log("5/6 성공 - email 체크");
			}
			return x;
	}
	
	
	
	
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
