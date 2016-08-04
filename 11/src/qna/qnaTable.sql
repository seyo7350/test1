drop table QNA_TABLE
cascade constraint;

create table QNA_TABLE(
	qna_num number(4) primary key,
	qna_product_num number(4),
	qna_author varchar2(20) not null,
	qna_pwd varchar2(20) not null,
	qna_subhead varchar2(20) not null,
	qna_title varchar2(200) not null,
	qna_content varchar2(500) not null,
	qna_writeday date default sysdate,
	qna_readCnt number(4),
	qna_important number(1)

);

select * from QNA_TABLE;




drop sequence qna_table_seq;

create sequence qna_table_seq;

alter table qna_table
add constraint fk_qna_product_num foreign key(qna_product_num)
references product_table(product_seq)