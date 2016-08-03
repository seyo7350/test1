insert into product_table (product_seq, product_name, product_price, product_point, product_option_count, 
	product_info_about, product_info_detail_tip, product_info_size_tip, product_info_washing_tip, 
	product_photo_gif, product_photo_main, product_photo_detail_main, product_photo_detail, 
	product_style_code, product_regiDate, product_del) 
values (seq_product_table.nextval, 'love some, ops', 32000, 3200, 1,
'사랑스러운 레이스의 디자인으로 소녀감성 가득한 원피스를 소개할께요|깨끗한 화이트 컬러감으로 여성스러움을 더했구요.|너무 타이트 하지 않게 제작되어 누구나 편안하게 착용해 보실 수 있어요.|무릎살짝 위로 오는 기장감이 안정감있게 즐기실 수 있어요^^', 
'스퀘어넥에서 V라인의 트임이 더해져 시원하게 즐기실 수 있어요.|촤르륵 떨어지는 소재감이 여리여리함을 더했구요~|안감이 덧에어져 있지만 강한 햇빛에는 비침이 살짝 있으실 수 있는 점 참고해 주세요.|허리 라인에는 짱짱한 밴딩으로 처리되어있어 흘러내릴 걱정 없이 착용 가능하세요^^', 
'원 사이즈 제품이에요! 평소 55 사이즈 착용하는 현진양은 여유있게 잘 맞았구요~|66사이즈 고객님까지 안정감있게 잘 맞으실꺼같아요 !|*신장에 따라 길이감이 짧아질 수 있으니 참고하시고 쵸이스해주세요~',
'물에 젖으면 강도가 50%정도 감소되므로 세탁시 비누나 중성세제를 사용하여|비틀거나 짜지말고 손으로 조물조물 하여 세탁하세요.|세탁기를 사용할 시에는 반드시 세탁망에 넣어 단시간에 탈수 후 건조하시면 되요.', 
'0020030030003.gif', '0020030030002.jpg', '002003003000.jpg', '1.jpg|2.jpg|3.jpg|4.jpg|5.jpg|6.jpg|7.jpg|8.jpg|9.jpg|10.jpg|', 1, sysdate, 0)

select * from product_table

drop table product_table
cascade constraint

drop sequence seq_product_table
		
create table product_table(
	product_seq number(8) primary key,
	product_name varchar2(50) not null,
	product_price number(20) not null,
	product_point number(20) not null,
	product_option_count number(20) not null,
	product_info_about varchar2(1000) not null,
	product_info_detail_tip varchar2(1000) not null,
	product_info_size_tip varchar2(1000) not null,
	product_info_washing_tip varchar2(1000) not null,
	product_photo_gif varchar2(1000) not null,
	product_photo_main varchar2(1000) not null,
	product_photo_detail_main varchar2(1000) not null,
	product_photo_detail varchar2(1000) not null,
	product_style_code number(3) not null,
	product_regiDate date not null,
	product_del number(1) not null
)

create sequence seq_product_table
start with 1 increment by 1;


insert into productOption_table (productOption_seq, productOption_product_seq, productOption_color, 
	productOption_colorCode, productOption_amount, productOption_del)
values (seq_productOption_table.nextval, 1, 'ivory/아이보리', '#f6efe4', 100, 0)

insert into productOption_table (productOption_seq, productOption_product_seq, productOption_color, 
	productOption_colorCode, productOption_amount, productOption_del)
values (seq_productOption_table.nextval, 1, 'black/블랙', '#ffffff', 100, 0)

drop table productOption_table
cascade constraint

drop sequence seq_productOption_table

create table productOption_table(
	productOption_seq number(8) primary key,
	productOption_product_seq number(8) not null,
	productOption_color varchar2(20) not null,
	productOption_colorCode varchar2(20) not null,
	productOption_amount number(20) not null,
	productOption_del number(1) not null
)

create sequence seq_productOption_table
start with 1 increment by 1;

alter table productOption_table
add constraint fk_productOption_product_seq foreign key(productOption_product_seq)
references product_table(product_seq);

select * from product_table
select * from productOption_table
