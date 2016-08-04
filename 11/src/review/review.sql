drop table REVIEW_TABLE
cascade constraint;

create table REVIEW_TABLE(
	review_num number(8) primary key,
	review_member_num number(8) not null,
	review_product_num number(8) not null,
	review_productOption_num number(8) not null,
	review_author varchar2(50) not null, 
	review_title varchar2(500) not null,
	review_content varchar2(1000) not null,
	review_writeday date default sysdate not null,
	review_del number(1),
	review_imageUrl varchar2(200)

);

select * from REVIEW_TABLE;

drop sequence review_table_seq;

create sequence review_table_seq;

alter table REVIEW_TABLE
add constraint fk_review_member_seq foreign key(review_member_num)
references member_table(member_seq);

alter table REVIEW_TABLE
add constraint fk_review_produc_seq foreign key(review_product_num)
references product_table(product_seq);

alter table REVIEW_TABLE
add constraint fk_review_productOption_seq foreign key(review_productOption_num)
references productOption_table(productOption_seq);

