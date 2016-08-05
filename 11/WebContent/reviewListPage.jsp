<%@page import="product.productDTO"%>
<%@page import="product.productDAO"%>
<%@page import="review.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@page import="review.ReviewDAO"%>
<%@ page import="member.memberDAO" %>
<%@ page import="member.memberDTO"%>

<%
request.setCharacterEncoding("utf-8");
String strMemberSeq = request.getParameter("memberSeq");
/* String strProductSeq = request.getParameter("productSeq"); */
String strProductOptionSeq = request.getParameter("productOptionSeq");
String reviewId = request.getParameter("reviewId");

int MemberSeq = Integer.parseInt(strMemberSeq);

ReviewDAO rDAO = ReviewDAO.getInstance();

memberDAO mDAO = memberDAO.getInstance();

productDAO pDAO = productDAO.getInstance();

/* int productSeq = Integer.parseInt(strProductSeq); */

/* productDTO pDTO = pDAO.getProduct(productSeq); */



%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰</title>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/jquery.bxslider.css">
<link rel="stylesheet" href="css/review.css">

<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="js/textRolling.js"></script>
<script src="js/jquery.bxslider.js"></script>
<script src="js/jquery.bxslider.min.js"></script>
</head>
<body>
	<div class="side">
	<div class="side_inner">
		<div class="side_inner_top">
		            <%
Object ologin = session.getAttribute("login");
memberDTO mem = null;

mem = mDAO.getMember(MemberSeq);

if(ologin == null){
	%>
    <a href='login.jsp'>login</a>&nbsp;&nbsp;/&nbsp;&nbsp;
	<%
}else{
 %>
    <a href='logout.jsp'>logout</a>&nbsp;&nbsp;/&nbsp;&nbsp;
    <%} %>
			<a href='join.jsp'>join</a><br>
			shopping bag<br>
			<a href='myPage.jsp'>mypage</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href='index.jsp'>home</a>
		</div>
		<div class="side_inner_middle">	
			<hr>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OUTER
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="top.jsp">TOP</a>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;BOTTOM
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ONEPIECE
			<br>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href ="noticeList.do">NOTICE</a>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href ="qnaList.do">Q&A</a>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;REVIEW		
			<hr>
		</div>
	</div>
</div>



      
      
<div class="container">
	<div class="container_top">
		<div class="logo">
			<a href='index.jsp'><img alt="로고" src="image/header.png"></a>
		</div>
	</div>	
	<div class="container_middle">
		<div class="content">
		
		
				<p align="center">
					<img src="image/review.jpg" width=""/>
				</p>
				<br>
				<br>

				<div id="content">
					<div class="widget-body index-thumbnail-container">
						<div class="page">
							<div class="reviews-contents">
								<ul class="reviews reviews-gallery">
									
									
									<!--리뷰시작  -->
									<%
									List<ReviewDTO> rDTO = rDAO.getReviewList();
									for(int i = 0; i < rDTO.size(); i++) {
										ReviewDTO reDTO = rDTO.get(i);
										productDTO pdto = pDAO.getProduct(reDTO.getReview_product_seq());
									%>
									<li class="review review_thumbnail"
										data-product-url="http://www.cherrykoko.com/shop/shopdetail.html?branduid=29789"
										id="review_267988"/>
										<div class="photo-review-popup"
											data-photo-review-popup-url="/cherrykoko.com/reviews/267988/photo_review_popup">
											<div class="thumbnail-container">
													<%-- C:/Users/aa1/git/new01/test1/11/WebContent/upload/review/<%= strMemberSeq%>/<%=rDTO.get(i).getReview_imageUrl() --%>
														<!--이미지 소스--> 
														<img class="review-image loaded"	 alt="FUCK YOU"
														src="upload/review/<%=reDTO.getReview_member_seq()%>/<%=reDTO.getReview_imageUrl() %>">

												<div class="images-count-indicator image-count-2"></div>
											</div>
											<div class="review-author-info">
												<div class="review-title">
													<!--리뷰 타이틀-->
													<%=reDTO.getReview_title() %>
												</div>
												<div class="date-name-container show-created-at">
													<div class="author-name">
														<!--작성자-->
														<%=reDTO.getReview_author()  %>
													</div>
													<div class="created-at">
														<!--작성일-->
														<%=reDTO.getReview_writeday() %>
													</div>
												</div>
											</div>
										</div>
										<div class="review-product link-product">
								
											<div class="review-product-thumbnail">
											
												<!--구입 제품 이미지-->
												<img alt="racella, skirt" width="90" height="90" src="upload/product/<%=reDTO.getReview_product_seq()%>/<%=pdto.getProduct_photo_gif()%>">
											</div>
											<div class="review-product-info">
												<div class="product-info-title">
													<!--구입 제품명-->
													<%=pdto.getProduct_name()%>										
													
												</div>
												<div class="product-info-feedbacks">
													<!--기타 정보-->
													<!-- <span class="reviews-count">리뷰<strong>27</strong></span><span	class="display-score">평점<strong>4.9</strong></span> -->
												
												</div>
												
											</div>
											
											<%
											}
											%>
											
										
											<!--리뷰 끝 -->

<!-- 
									리뷰시작 
									<li class="review review_thumbnail"
										data-product-url="http://www.cherrykoko.com/shop/shopdetail.html?branduid=29789"
										id="review_267988"/>
										<div class="photo-review-popup"
											data-photo-review-popup-url="/cherrykoko.com/reviews/267988/photo_review_popup">
											<div class="thumbnail-container">
									
														이미지 소스 
														<img class="review-image loaded"	 alt="입은 첫 날 차에 올라타는 순간 드드득! 조심하세요"
														src="//assets1.cre.ma/p/cherrykoko-com/reviews/00/00/26/79/88/image1/portrait_ff140ea111d0f026.jpg">

												<div class="images-count-indicator image-count-2"></div>
											</div>
											<div class="review-author-info">
												<div class="review-title">
													리뷰 타이틀
													입은 첫 날 차에 올라타는 순간 드드득!
												</div>
												<div class="date-name-container show-created-at">
													<div class="author-name">
														작성자
														sjd***
													</div>
													<div class="created-at">
														작성일
														2016. 08. 02
													</div>
												</div>
											</div>
										</div>
										<div class="review-product link-product">
											<div class="review-product-thumbnail">
												구입 제품 이미지
												<img alt="racella, skirt" width="90" height="90" src="//assets1.cre.ma/p/cherrykoko-com/products/00/00/02/40/40/image/extra_small_938d7f1aa4c5b28c.jpg">
											</div>
											<div class="review-product-info">
												<div class="product-info-title">
													구입 제품명
													racella, skirt
												</div>
												<div class="product-info-feedbacks">
													기타 정보
													<span class="reviews-count">리뷰<strong>27</strong></span><span	class="display-score">평점<strong>4.9</strong></span>
												</div>
											</div>
											리뷰 끝
											
																				리뷰시작 
									<li class="review review_thumbnail"
										data-product-url="http://www.cherrykoko.com/shop/shopdetail.html?branduid=29789"
										id="review_267988"/>
										<div class="photo-review-popup"
											data-photo-review-popup-url="/cherrykoko.com/reviews/267988/photo_review_popup">
											<div class="thumbnail-container">
									
														이미지 소스 
														<img class="review-image loaded"	 alt="입은 첫 날 차에 올라타는 순간 드드득! 조심하세요"
														src="//assets1.cre.ma/p/cherrykoko-com/reviews/00/00/26/79/88/image1/portrait_ff140ea111d0f026.jpg">

												<div class="images-count-indicator image-count-2"></div>
											</div>
											<div class="review-author-info">
												<div class="review-title">
													리뷰 타이틀
													입은 첫 날 차에 올라타는 순간 드드득!
												</div>
												<div class="date-name-container show-created-at">
													<div class="author-name">
														작성자
														sjd***
													</div>
													<div class="created-at">
														작성일
														2016. 08. 02
													</div>
												</div>
											</div>
										</div>
										<div class="review-product link-product">
											<div class="review-product-thumbnail">
												구입 제품 이미지
												<img alt="racella, skirt" width="90" height="90" src="//assets1.cre.ma/p/cherrykoko-com/products/00/00/02/40/40/image/extra_small_938d7f1aa4c5b28c.jpg">
											</div>
											<div class="review-product-info">
												<div class="product-info-title">
													구입 제품명
													racella, skirt
												</div>
												<div class="product-info-feedbacks">
													기타 정보
													<span class="reviews-count">리뷰<strong>27</strong></span><span	class="display-score">평점<strong>4.9</strong></span>
												</div>
											</div>
											리뷰 끝
											
																				리뷰시작 
									<li class="review review_thumbnail"
										data-product-url="http://www.cherrykoko.com/shop/shopdetail.html?branduid=29789"
										id="review_267988"/>
										<div class="photo-review-popup"
											data-photo-review-popup-url="/cherrykoko.com/reviews/267988/photo_review_popup">
											<div class="thumbnail-container">
									
														이미지 소스 
														<img class="review-image loaded"	 alt="입은 첫 날 차에 올라타는 순간 드드득! 조심하세요"
														src="//assets1.cre.ma/p/cherrykoko-com/reviews/00/00/26/79/88/image1/portrait_ff140ea111d0f026.jpg">

												<div class="images-count-indicator image-count-2"></div>
											</div>
											<div class="review-author-info">
												<div class="review-title">
													리뷰 타이틀
													입은 첫 날 차에 올라타는 순간 드드득!
												</div>
												<div class="date-name-container show-created-at">
													<div class="author-name">
														작성자
														sjd***
													</div>
													<div class="created-at">
														작성일
														2016. 08. 02
													</div>
												</div>
											</div>
										</div>
										<div class="review-product link-product">
											<div class="review-product-thumbnail">
												구입 제품 이미지
												<img alt="racella, skirt" width="90" height="90" src="//assets1.cre.ma/p/cherrykoko-com/products/00/00/02/40/40/image/extra_small_938d7f1aa4c5b28c.jpg">
											</div>
											<div class="review-product-info">
												<div class="product-info-title">
													구입 제품명
													racella, skirt
												</div>
												<div class="product-info-feedbacks">
													기타 정보
													<span class="reviews-count">리뷰<strong>27</strong></span><span	class="display-score">평점<strong>4.9</strong></span>
												</div>
											</div>
											리뷰 끝
											
											
																				리뷰시작 
									<li class="review review_thumbnail"
										data-product-url="http://www.cherrykoko.com/shop/shopdetail.html?branduid=29789"
										id="review_267988"/>
										<div class="photo-review-popup"
											data-photo-review-popup-url="/cherrykoko.com/reviews/267988/photo_review_popup">
											<div class="thumbnail-container">
									
														이미지 소스 
														<img class="review-image loaded"	 alt="입은 첫 날 차에 올라타는 순간 드드득! 조심하세요"
														src="//assets1.cre.ma/p/cherrykoko-com/reviews/00/00/26/79/88/image1/portrait_ff140ea111d0f026.jpg">

												<div class="images-count-indicator image-count-2"></div>
											</div>
											<div class="review-author-info">
												<div class="review-title">
													리뷰 타이틀
													입은 첫 날 차에 올라타는 순간 드드득!
												</div>
												<div class="date-name-container show-created-at">
													<div class="author-name">
														작성자
														sjd***
													</div>
													<div class="created-at">
														작성일
														2016. 08. 02
													</div>
												</div>
											</div>
										</div>
										<div class="review-product link-product">
											<div class="review-product-thumbnail">
												구입 제품 이미지
												<img alt="racella, skirt" width="90" height="90" src="//assets1.cre.ma/p/cherrykoko-com/products/00/00/02/40/40/image/extra_small_938d7f1aa4c5b28c.jpg">
											</div>
											<div class="review-product-info">
												<div class="product-info-title">
													구입 제품명
													racella, skirt
												</div>
												<div class="product-info-feedbacks">
													기타 정보
													<span class="reviews-count">리뷰<strong>27</strong></span><span	class="display-score">평점<strong>4.9</strong></span>
												</div>
											</div>
											리뷰 끝
											
											
																				리뷰시작 
									<li class="review review_thumbnail"
										data-product-url="http://www.cherrykoko.com/shop/shopdetail.html?branduid=29789"
										id="review_267988"/>
										<div class="photo-review-popup"
											data-photo-review-popup-url="/cherrykoko.com/reviews/267988/photo_review_popup">
											<div class="thumbnail-container">
									
														이미지 소스 
														<img class="review-image loaded"	 alt="입은 첫 날 차에 올라타는 순간 드드득! 조심하세요"
														src="//assets1.cre.ma/p/cherrykoko-com/reviews/00/00/26/79/88/image1/portrait_ff140ea111d0f026.jpg">

												<div class="images-count-indicator image-count-2"></div>
											</div>
											<div class="review-author-info">
												<div class="review-title">
													리뷰 타이틀
													입은 첫 날 차에 올라타는 순간 드드득!
												</div>
												<div class="date-name-container show-created-at">
													<div class="author-name">
														작성자
														sjd***
													</div>
													<div class="created-at">
														작성일
														2016. 08. 02
													</div>
												</div>
											</div>
										</div>
										<div class="review-product link-product">
											<div class="review-product-thumbnail">
												구입 제품 이미지
												<img alt="racella, skirt" width="90" height="90" src="//assets1.cre.ma/p/cherrykoko-com/products/00/00/02/40/40/image/extra_small_938d7f1aa4c5b28c.jpg">
											</div>
											<div class="review-product-info">
												<div class="product-info-title">
													구입 제품명
													racella, skirt
												</div>
												<div class="product-info-feedbacks">
													기타 정보
													<span class="reviews-count">리뷰<strong>27</strong></span><span	class="display-score">평점<strong>4.9</strong></span>
												</div>
											</div>
											리뷰 끝
											
											
																				리뷰시작 
									<li class="review review_thumbnail"
										data-product-url="http://www.cherrykoko.com/shop/shopdetail.html?branduid=29789"
										id="review_267988"/>
										<div class="photo-review-popup"
											data-photo-review-popup-url="/cherrykoko.com/reviews/267988/photo_review_popup">
											<div class="thumbnail-container">
									
														이미지 소스 
														<img class="review-image loaded"	 alt="입은 첫 날 차에 올라타는 순간 드드득! 조심하세요"
														src="//assets1.cre.ma/p/cherrykoko-com/reviews/00/00/26/79/88/image1/portrait_ff140ea111d0f026.jpg">

												<div class="images-count-indicator image-count-2"></div>
											</div>
											<div class="review-author-info">
												<div class="review-title">
													리뷰 타이틀
													입은 첫 날 차에 올라타는 순간 드드득!
												</div>
												<div class="date-name-container show-created-at">
													<div class="author-name">
														작성자
														sjd***
													</div>
													<div class="created-at">
														작성일
														2016. 08. 02
													</div>
												</div>
											</div>
										</div>
										<div class="review-product link-product">
											<div class="review-product-thumbnail">
												구입 제품 이미지
												<img alt="racella, skirt" width="90" height="90" src="//assets1.cre.ma/p/cherrykoko-com/products/00/00/02/40/40/image/extra_small_938d7f1aa4c5b28c.jpg">
											</div>
											<div class="review-product-info">
												<div class="product-info-title">
													구입 제품명
													racella, skirt
												</div>
												<div class="product-info-feedbacks">
													기타 정보
													<span class="reviews-count">리뷰<strong>27</strong></span><span	class="display-score">평점<strong>4.9</strong></span>
												</div>
											</div>
											리뷰 끝 -->
											

												

												
												
												
												
												
												
												
												
									</div>									    
								</ul>	
							</div>
						</div>
					</div>
				</div>	
		</div>
	</div>
	<div class="container_footer">
		<div class="footer_content">
	        <div class="footer_info">
	            <!-- <ul class="menu">
	                GUIDE/개인정보취급방침/..
	            </ul> -->
	            <div class="address">
					<p id="info1">
						CALL 1600 - 7255<br>
						MON-FRI AM 10:00 - PM 5:00 / SAT AM 10:00 - PM 1:00<br>
						LUNCHI TIME PM 1:00 - 2:00 / SUN/HOLYDAY CLOSED<br><br>
						_BANK_ : WOORI 1005-501-330632, ....
					</p>
	                <p id="info2">
	                	법인명(상호): (주)애플코코  | 대표자(성명): 나대표 | 사업자 등록번호 안내: [777-77-77777] | 통신판매업 신고 제 2016 - 서울강북 - 77777호<br>
						전화: 1600-7255 | 주소: 서울특별시 마포구 백범로18(노고산동) 미화빌딩 3층 F반 강의실 -(주)애플코코 <br>
						교환 & 반품 주소 : 서울특별시 마포구 백범로18(노고산동) 미화빌딩 3층 F반 강의실 (주)애플코코 <br>
						개인정보관리책임자: 나책임 | Contact help@applekoko.com for more information.<br>
	                </p>
	               </div>          
	        </div>
	        
		</div>		
	</div><!-- container_footer -->
</div>

<a style="position: fixed; bottom: 700px; right: 240px;" href="#" title="Top"><img src="image/quick_top.png"></a>

<script type="text/javascript">
var real_search_keyword = new textScroll('scroll'); // 스크롤링 하고자하는 ul 엘리먼트의 id값을 인자로 넣습니다
real_search_keyword.name = "real_search_keyword"; // 인스턴스 네임을 등록합니다
real_search_keyword.start(); // 스크롤링 시작
</script>

<script type="text/javascript">
$(document).ready(function(){
 $('.slider').bxSlider({ 
   mode: 'fade',    //사라지는 모냥
   speen: 3000,     // 이미지변환 속도 기본 500
   pager: false,     //하단 페이지
   auto: true,     //자동시작
   captions: true,  //캡션
   controls: true //전 후 콘트롤 보이기 안보이기
 }); 
});
</script>

</body>
</body>
</html>