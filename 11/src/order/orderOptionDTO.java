package order;

/*
create table orderOption_table(
	orderOption_seq number(8) primary key,
	orderOption_order_seq number(8) not null,
	orderOption_productOption_seq number(8) not null,
	orderOption_amount number(8) not null
)

create sequence seq_orderOption_table
start with 1 increment by 1;

alter table orderOption_table
add constraint fk_orderOption_order_seq foreign key(orderOption_order_seq)
references order_table(order_seq);

alter table orderOption_table
add constraint fk_orderOption_productOption_seq foreign key(orderOption_productOption_seq)
references productOption_table(productOption_seq);
*/

public class orderOptionDTO {
	private int orderOption_seq;
	private int orderOption_order_seq;
	private int orderOption_productOption_seq;
	private int orderOption_amount;
	
	public orderOptionDTO(int orderOption_seq, int orderOption_order_seq, int orderOption_productOption_seq,
			int orderOption_amount) {
		this.orderOption_seq = orderOption_seq;
		this.orderOption_order_seq = orderOption_order_seq;
		this.orderOption_productOption_seq = orderOption_productOption_seq;
		this.orderOption_amount = orderOption_amount;
	}
	
	public int getOrderOption_seq() {
		return orderOption_seq;
	}
	public void setOrderOption_seq(int orderOption_seq) {
		this.orderOption_seq = orderOption_seq;
	}
	public int getOrderOption_order_seq() {
		return orderOption_order_seq;
	}
	public void setOrderOption_order_seq(int orderOption_order_seq) {
		this.orderOption_order_seq = orderOption_order_seq;
	}
	public int getOrderOption_productOption_seq() {
		return orderOption_productOption_seq;
	}
	public void setOrderOption_productOption_seq(int orderOption_productOption_seq) {
		this.orderOption_productOption_seq = orderOption_productOption_seq;
	}
	public int getOrderOption_amount() {
		return orderOption_amount;
	}
	public void setOrderOption_amount(int orderOption_amount) {
		this.orderOption_amount = orderOption_amount;
	}
	
	@Override
	public String toString() {
		return "orderOptionDTO [orderOption_seq=" + orderOption_seq + ", orderOption_order_seq=" + orderOption_order_seq
				+ ", orderOption_productOption_seq=" + orderOption_productOption_seq + ", orderOption_amount="
				+ orderOption_amount + "]";
	}
	
}
