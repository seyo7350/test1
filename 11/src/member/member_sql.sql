--테이블 생성
create table member_table(
      member_seq number(8) primary key,
      member_name varchar2(50) not null,
      member_id varchar2(50) not null,
      member_password varchar2(50) not null,
      member_postcode varchar2(50) not null,
      member_address varchar2(200) not null,
      member_addressDetail varchar2(200) not null,
      member_email varchar2(50) unique,
      member_phone varchar2(50) not null,
      member_birthday varchar2(50) not null,
      member_regidate date not null,
      member_point number(30) not null,
      member_auth number(1) not null,
      member_del number(1) not null
  );
 
   create sequence seq_member start with 1 increment by 1;
   
   
-- 확인용
 select * from member_table;
 
-- 삭제
 drop table member_table
 cascade constraint;

 drop sequence seq_member;
