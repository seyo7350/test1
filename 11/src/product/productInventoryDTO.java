package product;

/*
create table productInventory_table(
	productInventory_seq number(8) primary key,
	productInventory_product_seq number(8) not null,
	productInventory_color varchar2(20) not null,
	productInventory_colorCode varchar2(20) not null,
	productInventory_amount number(100) not null,
	productInventory_del number(1) not null
)

create sequence seq_productInventory_table
start with 1 increment by 1;

alter table productInventory_table
add constraint fk_productInventory_product_seq foreign key(productInventory_product_seq)
references product_table(product_seq);
 */


public class productInventoryDTO {

}
