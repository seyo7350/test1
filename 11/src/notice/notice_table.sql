drop table NOTICE_TABLE;

create table NOTICE_TABLE(
	notice_num number(10) primary key,
	notice_author varchar2(20) not null,
	notice_pwd varchar2(20) not null,
	notice_title varchar2(200) not null,
	notice_content varchar2(500) not null,
	notice_writeday date default sysdate,
	notice_readCnt number(4),
	notice_important number(1)

);

select * from NOTICE_TABLE;




drop sequence notice_table_seq;

create sequence notice_table_seq;