package review;

public class ReviewDTO {

	private int review_seq;
	private int review_member_seq;
	private int review_product_seq;
	private int review_productOption_seq;
	private String review_author;
	private String review_title;
	private String review_content;
	private String review_writeday;
	private int review_del;
	private String review_imageUrl;
	
	public ReviewDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReviewDTO(int review_seq, int review_member_seq, int review_product_seq, int review_productOption_seq,
			String review_author, String review_title, String review_content, String review_writeday, int review_del,
			String review_imageUrl) {
		super();
		this.review_seq = review_seq;
		this.review_member_seq = review_member_seq;
		this.review_product_seq = review_product_seq;
		this.review_productOption_seq = review_productOption_seq;
		this.review_author = review_author;
		this.review_title = review_title;
		this.review_content = review_content;
		this.review_writeday = review_writeday;
		this.review_del = review_del;
		this.review_imageUrl = review_imageUrl;
	}

	public int getReview_seq() {
		return review_seq;
	}

	public void setReview_seq(int review_seq) {
		this.review_seq = review_seq;
	}

	public int getReview_member_seq() {
		return review_member_seq;
	}

	public void setReview_member_seq(int review_member_seq) {
		this.review_member_seq = review_member_seq;
	}

	public int getReview_product_seq() {
		return review_product_seq;
	}

	public void setReview_product_seq(int review_product_seq) {
		this.review_product_seq = review_product_seq;
	}

	public int getReview_productOption_seq() {
		return review_productOption_seq;
	}

	public void setReview_productOption_seq(int review_productOption_seq) {
		this.review_productOption_seq = review_productOption_seq;
	}

	public String getReview_author() {
		return review_author;
	}

	public void setReview_author(String review_author) {
		this.review_author = review_author;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_writeday() {
		return review_writeday;
	}

	public void setReview_writeday(String review_writeday) {
		this.review_writeday = review_writeday;
	}

	public int getReview_del() {
		return review_del;
	}

	public void setReview_del(int review_del) {
		this.review_del = review_del;
	}

	public String getReview_imageUrl() {
		return review_imageUrl;
	}

	public void setReview_imageUrl(String review_imageUrl) {
		this.review_imageUrl = review_imageUrl;
	}

	@Override
	public String toString() {
		return "ReviewDTO [review_seq=" + review_seq + ", review_member_seq=" + review_member_seq
				+ ", review_product_seq=" + review_product_seq + ", review_productOption_seq="
				+ review_productOption_seq + ", review_author=" + review_author + ", review_title=" + review_title
				+ ", review_content=" + review_content + ", review_writeday=" + review_writeday + ", review_del="
				+ review_del + ", review_imageUrl=" + review_imageUrl + "]";
	}

	
}
