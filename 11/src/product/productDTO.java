package product;

import java.util.Date;

/*
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
 */


public class productDTO {
	private int product_seq;
	private String product_name;
	private int product_price;
	private int product_point;
	private int product_option_count;
	
	private String product_info_about;
	private String product_info_detail_tip;
	private String product_info_size_tip;
	private String product_info_washing_tip;
	
	private String product_photo_gif;
	private String product_photo_main;
	private String product_photo_detail_main;
	private String product_photo_detail;
	private int product_style_code;
	private Date product_regiDate;
	private int product_del;	
		
	public productDTO(int product_seq, String product_name, int product_price, int product_point,
			int product_option_count, String product_info_about, String product_info_detail_tip,
			String product_info_size_tip, String product_info_washing_tip, String product_photo_gif,
			String product_photo_main, String product_photo_detail_main, String product_photo_detail,
			int product_style_code, Date product_regiDate, int product_del) {
		this.product_seq = product_seq;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_point = product_point;
		this.product_option_count = product_option_count;
		this.product_info_about = product_info_about;
		this.product_info_detail_tip = product_info_detail_tip;
		this.product_info_size_tip = product_info_size_tip;
		this.product_info_washing_tip = product_info_washing_tip;
		this.product_photo_gif = product_photo_gif;
		this.product_photo_main = product_photo_main;
		this.product_photo_detail_main = product_photo_detail_main;
		this.product_photo_detail = product_photo_detail;
		this.product_style_code = product_style_code;
		this.product_regiDate = product_regiDate;
		this.product_del = product_del;
	}
	public int getProduct_seq() {
		return product_seq;
	}
	public void setProduct_seq(int product_seq) {
		this.product_seq = product_seq;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_point() {
		return product_point;
	}
	public void setProduct_point(int product_point) {
		this.product_point = product_point;
	}
	public int getProduct_option_count() {
		return product_option_count;
	}
	public void setProduct_option_count(int product_option_count) {
		this.product_option_count = product_option_count;
	}
	public String getProduct_info_about() {
		return product_info_about;
	}
	public void setProduct_info_about(String product_info_about) {
		this.product_info_about = product_info_about;
	}
	public String getProduct_info_detail_tip() {
		return product_info_detail_tip;
	}
	public void setProduct_info_detail_tip(String product_info_detail_tip) {
		this.product_info_detail_tip = product_info_detail_tip;
	}
	public String getProduct_info_size_tip() {
		return product_info_size_tip;
	}
	public void setProduct_info_size_tip(String product_info_size_tip) {
		this.product_info_size_tip = product_info_size_tip;
	}
	public String getProduct_info_washing_tip() {
		return product_info_washing_tip;
	}
	public void setProduct_info_washing_tip(String product_info_washing_tip) {
		this.product_info_washing_tip = product_info_washing_tip;
	}	
	public String getProduct_photo_gif() {
		return product_photo_gif;
	}
	public void setProduct_photo_gif(String product_photo_gif) {
		this.product_photo_gif = product_photo_gif;
	}	
	public String getProduct_photo_detail_main() {
		return product_photo_detail_main;
	}
	public void setProduct_photo_detail_main(String product_photo_detail_main) {
		this.product_photo_detail_main = product_photo_detail_main;
	}
	public String getProduct_photo_main() {
		return product_photo_main;
	}
	public void setProduct_photo_main(String product_photo_main) {
		this.product_photo_main = product_photo_main;
	}	
	public String getProduct_photo_detail() {
		return product_photo_detail;
	}
	public void setProduct_photo_detail(String product_photo_detail) {
		this.product_photo_detail = product_photo_detail;
	}
	public int getProduct_style_code() {
		return product_style_code;
	}
	public void setProduct_style_code(int product_style_code) {
		this.product_style_code = product_style_code;
	}
	public Date getProduct_regiDate() {
		return product_regiDate;
	}
	public void setProduct_regiDate(Date product_regiDate) {
		this.product_regiDate = product_regiDate;
	}
	public int getProduct_del() {
		return product_del;
	}
	public void setProduct_del(int product_del) {
		this.product_del = product_del;
	}
	@Override
	public String toString() {
		return "productDTO [product_seq=" + product_seq + ", product_name=" + product_name + ", product_price="
				+ product_price + ", product_point=" + product_point + ", product_option_count=" + product_option_count
				+ ", product_info_about=" + product_info_about + ", product_info_detail_tip=" + product_info_detail_tip
				+ ", product_info_size_tip=" + product_info_size_tip + ", product_info_washing_tip="
				+ product_info_washing_tip + ", product_photo_gif=" + product_photo_gif + ", product_photo_main="
				+ product_photo_main + ", product_photo_detail_main=" + product_photo_detail_main
				+ ", product_photo_detail=" + product_photo_detail + ", product_style_code=" + product_style_code
				+ ", product_regiDate=" + product_regiDate + ", product_del=" + product_del + "]";
	}
	
	
}
