drop table QNAANSWER_TABLE
CASCADE CONSTRAINT;

create table QNAANSWER_TABLE(
	qnaanswer_num number(10) primary key,
	qnaanswer_qna_num number(4) not null,
	qnaanswer_author varchar2(20) not null,
	qnaanswer_pwd varchar2(20) not null,
	qnaanswer_content varchar2(2000) not null,
	qnaanswer_writeday date default sysdate
	
);

select * from qnaanswer_TABLE;




drop sequence QNAANSWER_table_seq;

create sequence QNAANSWER_table_seq;

ALTER TABLE QNAANSWER_TABLE
ADD CONSTRAINT FK_QNAANSWER_QNA_NUM FOREIGN KEY(qnaanswer_qna_num)
REFERENCES QNA_TABLE(QNA_NUM);

ALTER TABLE QNAANSWER_TABLE
DROP CONSTRAINT FK_QNAANSWER_QNA_NUM