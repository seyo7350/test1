package review;

import java.util.List;

public interface iReviewDAO {

	List<ReviewDTO> getReviewList();
	void writeReview(int review_member_num, int review_product_num, int review_productOption_num, String review_author, String review_title, String review_content, String review_imageUrl);
	List<ReviewDTO> getProductReviewList(int review_product_seq);
}

