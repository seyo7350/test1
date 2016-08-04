drop table noticeanswer_table
CASCADE CONSTRAINT;

create table noticeanswer_table(
	noticeanswer_num number(10) primary key,
	noticeanswer_notice_num number(4) not null,
	noticeanswer_author varchar2(20) not null,
	noticeanswer_pwd varchar2(20) not null,
	noticeanswer_content varchar2(2000) not null,
	noticeanswer_writeday date default sysdate
	
);

select * from noticeanswer_table;




drop sequence noticeanswer_table_seq;

create sequence noticeanswer_table_seq;

ALTER TABLE NOTICEANSWER_TABLE
ADD CONSTRAINT FK_NOTICEANSWER_QNA_NUM FOREIGN KEY(noticeanswer_notice_num)
REFERENCES NOTICE_TABLE(NOTICE_NUM);

ALTER TABLE QNAANSWER_TABLE
DROP CONSTRAINT FK_QNAANSWER_QNA_NUM