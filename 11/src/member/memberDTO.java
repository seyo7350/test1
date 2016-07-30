package member;
/*
--테이블 생성
create table member_table(
      member_seq number(8) primary key,
      member_name varchar2(50) not null,
      member_id varchar2(50) not null,
      member_password varchar2(50) not null,
      member_postcode varchar2(50) not null,
      member_address varchar2(50) not null,
      member_addressDetail varchar2(50) not null,
      member_email varchar2(50) unique,
      member_regidate date not null,
      member_point number(30) not null,
      auth number(1) not null,
      del number(1) not null
  );

 create sequence seq_member start with 1 increment by 1;
      
-- 확인용
 select * from member_table;
 
-- 삭제
 drop table member_table
 cascade constraint;

 drop sequence seq_member;
*/

import java.io.Serializable;
import java.util.Date;

public class memberDTO {
	
	private int member_seq; 
	private String member_name;
	private String member_id;
	private String member_password;
	private String member_postcode;
	private String member_address;
	private String member_addressDetail;
	private String member_email;
	private String member_phone;
	private String member_birthday;
	private Date member_regidate;
	private int member_point;
	private int member_auth;    //1은 일반고객, 0이 관리자
	private int member_del;     //0은 일반고객, 1은 탈퇴고객

	
	//기본 생성자
	public memberDTO(){}
	
	//전체
	public memberDTO(int member_seq, String member_name, String member_id, String member_password,
			String member_postcode, String member_address, String member_addressDetail, String member_email,
			String member_phone, String member_birthday, Date member_regidate, int member_point, int member_auth,
			int member_del) {
		this.member_seq = member_seq;
		this.member_name = member_name;
		this.member_id = member_id;
		this.member_password = member_password;
		this.member_postcode = member_postcode;
		this.member_address = member_address;
		this.member_addressDetail = member_addressDetail;
		this.member_email = member_email;
		this.member_phone = member_phone;
		this.member_birthday = member_birthday;
		this.member_regidate = member_regidate;
		this.member_point = member_point;
		this.member_auth = member_auth;
		this.member_del = member_del;
	}

	//가입자용
	public memberDTO(String member_name, String member_id, String member_password, String member_postcode,
			String member_address, String member_addressDetail, String member_email, String member_phone,
			String member_birthday) {
		this.member_name = member_name;
		this.member_id = member_id;
		this.member_password = member_password;
		this.member_postcode = member_postcode;
		this.member_address = member_address;
		this.member_addressDetail = member_addressDetail;
		this.member_email = member_email;
		this.member_phone = member_phone;
		this.member_birthday = member_birthday;
	}
	
    //toSting
	@Override
	public String toString() {
		return "memberDTO [member_seq=" + member_seq + ", member_name=" + member_name + ", member_id=" + member_id
				+ ", member_password=" + member_password + ", member_postcode=" + member_postcode + ", member_address="
				+ member_address + ", member_addressDetail=" + member_addressDetail + ", member_email=" + member_email
				+ ", member_phone=" + member_phone + ", member_birthday=" + member_birthday + ", member_regidate="
				+ member_regidate + ", member_point=" + member_point + ", member_auth=" + member_auth + ", member_del="
				+ member_del + "]";
	}

	//세터 게터
	public int getMember_seq() {
		return member_seq;
	}

	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_password() {
		return member_password;
	}

	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}

	public String getMember_postcode() {
		return member_postcode;
	}

	public void setMember_postcode(String member_postcode) {
		this.member_postcode = member_postcode;
	}

	public String getMember_address() {
		return member_address;
	}

	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}

	public String getMember_addressDetail() {
		return member_addressDetail;
	}

	public void setMember_addressDetail(String member_addressDetail) {
		this.member_addressDetail = member_addressDetail;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_birthday() {
		return member_birthday;
	}

	public void setMember_birthday(String member_birthday) {
		this.member_birthday = member_birthday;
	}

	public Date getMember_regidate() {
		return member_regidate;
	}

	public void setMember_regidate(Date member_regidate) {
		this.member_regidate = member_regidate;
	}

	public int getMember_point() {
		return member_point;
	}

	public void setMember_point(int member_point) {
		this.member_point = member_point;
	}

	public int getMember_auth() {
		return member_auth;
	}

	public void setMember_auth(int member_auth) {
		this.member_auth = member_auth;
	}

	public int getMember_del() {
		return member_del;
	}

	public void setMember_del(int member_del) {
		this.member_del = member_del;
	}
	
	



	
	
	
}
