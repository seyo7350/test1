package order;

import java.util.Date;

/*
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
*/

public class orderDTO {
	private int order_seq;
	private int order_member_seq;
	private int order_product_seq;
	private int order_productOption_seq;
	private int order_amount;
	private Date order_regiDate;
	private int order_confirm;
	private int order_del;
	
	public orderDTO(int order_seq, int order_member_seq, int order_product_seq, int order_productOption_seq,
			int order_amount, Date order_regiDate, int order_confirm, int order_del) {
		this.order_seq = order_seq;
		this.order_member_seq = order_member_seq;
		this.order_product_seq = order_product_seq;
		this.order_productOption_seq = order_productOption_seq;
		this.order_amount = order_amount;
		this.order_regiDate = order_regiDate;
		this.order_confirm = order_confirm;
		this.order_del = order_del;
	}
	
	public orderDTO(int order_member_seq, int order_product_seq, int order_productOption_seq, int order_amount) {
		this.order_member_seq = order_member_seq;
		this.order_product_seq = order_product_seq;
		this.order_productOption_seq = order_productOption_seq;
		this.order_amount = order_amount;
	}

	public int getOrder_seq() {
		return order_seq;
	}
	public void setOrder_seq(int order_seq) {
		this.order_seq = order_seq;
	}
	public int getOrder_member_seq() {
		return order_member_seq;
	}
	public void setOrder_member_seq(int order_member_seq) {
		this.order_member_seq = order_member_seq;
	}
	public int getOrder_product_seq() {
		return order_product_seq;
	}
	public void setOrder_product_seq(int order_product_seq) {
		this.order_product_seq = order_product_seq;
	}
	public int getOrder_productOption_seq() {
		return order_productOption_seq;
	}
	public void setOrder_productOption_seq(int order_productOption_seq) {
		this.order_productOption_seq = order_productOption_seq;
	}
	public int getOrder_amount() {
		return order_amount;
	}
	public void setOrder_amount(int order_amount) {
		this.order_amount = order_amount;
	}
	public Date getOrder_regiDate() {
		return order_regiDate;
	}
	public void setOrder_regiDate(Date order_regiDate) {
		this.order_regiDate = order_regiDate;
	}
	public int getOrder_confirm() {
		return order_confirm;
	}
	public void setOrder_confirm(int order_confirm) {
		this.order_confirm = order_confirm;
	}
	public int getOrder_del() {
		return order_del;
	}
	public void setOrder_del(int order_del) {
		this.order_del = order_del;
	}
	
	@Override
	public String toString() {
		return "orderDTO [order_seq=" + order_seq + ", order_member_seq=" + order_member_seq + ", order_product_seq="
				+ order_product_seq + ", order_productOption_seq=" + order_productOption_seq + ", order_amount="
				+ order_amount + ", order_regiDate=" + order_regiDate + ", order_confirm=" + order_confirm
				+ ", order_del=" + order_del + "]";
	}	
}
