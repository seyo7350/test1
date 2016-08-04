package review;

import java.util.List;

public interface iReviewDAO {

	// 리뷰 불러오기
	List<ReviewDTO> getReviewList();
	
	// 리뷰 등록
	void writeReview(int review_member_num, int review_product_num, int review_productOption_num, String review_author, String review_title, String review_content, String review_imageUrl);
	
	// 특정인 리뷰 불러오기
	
	// 특정인 리뷰 확인
	
	// 리뷰 삭제
	
	
}

