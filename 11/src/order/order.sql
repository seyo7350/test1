create table order_table(
	order_seq number(8) primary key,
	order_member_seq number(8) not null,
	order_product_seq number(8) not null,
	order_productOption_seq number(8) not null,
	order_amount number(8) not null,
	order_regiDate date not null,
	order_confirm number(8) not null,
	order_del number(8) not null
)

create sequence seq_order_table
start with 1 increment by 1;

alter table order_table
add constraint fk_order_member_seq foreign key(order_member_seq)
references member_table(member_seq);

alter table order_table
add constraint fk_order_product_seq foreign key(order_product_seq)
references product_table(product_seq);

alter table order_table
add constraint fk_order_productOption_seq foreign key(order_productOption_seq)
references productOption_table(productOption_seq);

drop table order_table

drop sequence seq_order_table

select * from ORDER_TABLE