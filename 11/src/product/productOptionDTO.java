package product;

/*
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
 */


public class productOptionDTO {
	private int productOption_seq;
	private int productOption_product_seq;
	private String productOption_color;			// 색깔이름
	private String productOption_colorCode;		// #...
	private int productOption_amount;
	private int productOption_del;
	
	public productOptionDTO(int productOption_seq, int productOption_product_seq, String productOption_color,
			String productOption_colorCode, int productOption_amount, int productOption_del) {
		super();
		this.productOption_seq = productOption_seq;
		this.productOption_product_seq = productOption_product_seq;
		this.productOption_color = productOption_color;
		this.productOption_colorCode = productOption_colorCode;
		this.productOption_amount = productOption_amount;
		this.productOption_del = productOption_del;
	}
		
	public int getProductOption_seq() {
		return productOption_seq;
	}
	public void setProductOption_seq(int productOption_seq) {
		this.productOption_seq = productOption_seq;
	}
	public int getProductOption_product_seq() {
		return productOption_product_seq;
	}
	public void setProductOption_product_seq(int productOption_product_seq) {
		this.productOption_product_seq = productOption_product_seq;
	}
	public String getProductOption_color() {
		return productOption_color;
	}
	public void setProductOption_color(String productOption_color) {
		this.productOption_color = productOption_color;
	}
	public String getProductOption_colorCode() {
		return productOption_colorCode;
	}
	public void setProductOption_colorCode(String productOption_colorCode) {
		this.productOption_colorCode = productOption_colorCode;
	}
	public int getProductOption_amount() {
		return productOption_amount;
	}
	public void setProductOption_amount(int productOption_amount) {
		this.productOption_amount = productOption_amount;
	}
	public int getProductOption_del() {
		return productOption_del;
	}
	public void setProductOption_del(int productOption_del) {
		this.productOption_del = productOption_del;
	}
	
	@Override
	public String toString() {
		return "productOptionDTO [productOption_seq=" + productOption_seq + ", productOption_product_seq="
				+ productOption_product_seq + ", productOption_color=" + productOption_color
				+ ", productOption_colorCode=" + productOption_colorCode + ", productOption_amount="
				+ productOption_amount + ", productOption_del=" + productOption_del + "]";
	}
	
}
