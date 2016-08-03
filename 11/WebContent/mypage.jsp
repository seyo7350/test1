<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>koko</title>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/jquery.bxslider.css">
<link href="css/my.css" rel="stylesheet" type="text/css">

<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="js/textRolling.js"></script>
<script src="js/jquery.bxslider.js"></script>
<script src="js/jquery.bxslider.min.js"></script>


</head>
<body>
<div class="side">
	<div class="side_inner">
		<div class="side_inner_top">
			<a href='login.jsp'>login</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href='join.jsp'>join</a><br>
			shopping bag<br>
			mypage&nbsp;&nbsp;/&nbsp;&nbsp;home
		</div>
		<div class="side_inner_middle">	
			<hr>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OUTER
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="top.jsp?product_style_code=<%=1 %>">TOP</a>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;BOTTOM
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ONEPIECE
			<br>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NOTICE
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q&A
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;REVIEW		
			<hr>
		</div>
	</div>
</div>



      
      
<div class="container">
	<div class="container_top">
		<div class="logo">
			<img alt="로고" src="image/header.png">
		</div>
	</div>	
	<div class="container_middle">
		<div class="content">
		
<span></span>            <div id="content">
                <div id="mypage" class="section_mypage">

					<div class="page_path hide">
						<h3>현재 위치</h3>
						<ol>
							<li class="first"><a href="/">Home</a></li>
							<li><a href="javascript:;">Mypage</a></li>
						</ol>
					</div>
                    <div class="page-body">

						<ul class="mypage_menu_tabs">
							<li class="first_child selected"><a href="mypage.jsp" class="mypage_menu1"><span class="hide">my page</span></a></li>
							<li><a href="shoppingbag.jsp" class="mypage_menu2"><span class="hide">shopping bag</span></a></li>
							<li><a href="/shop/mypage.html?mypage_type=myorder" class="mypage_menu3"><span class="hide">주문내역</span></a></li>
							<!-- <li><a href="/shop/mypage.html?mypage_type=mywishlist" class="mypage_menu4"><span class="hide">wish list</span></a></li> -->
							<li><a href="/shop/mypage.html?mypage_type=myarticle" class="mypage_menu5"><span class="hide">Q&A 내역</span></a></li>
							<!-- <li><a href="/shop/mypage.html?mypage_type=mym2mboard" class="mypage_menu6"><span class="hide">1:1 문의</span></a></li> -->
							<li><a href="/shop/idinfo.html" class="mypage_menu7"><span class="hide">내정보수정</span></a></li>
							<li class="last_child"><a href="/shop/mypage.html?mypage_type=myexituser" class="mypage_menu8"><span class="hide">회원탈퇴</span></a></li>
						</ul>


                        <div class="mypage_index_info">
                            <div class="user">
                                <!-- <p class="hide">안지훈[ahnjihunj]님 <a href="/shop/idinfo.html" class="custom_button button_tiny_level1"><img src="/images/d3/modern_simple/btn/h18_modify.gif" alt="정보수정" /></a></p> -->
                                <ul class="user_info_list">
                                    <li><span class="title">이름</span><span class="item">안지훈</span></li>
                                    <li><span class="title">회원등급</span><span class="item">HAPPY KOKO</span></li>
                                    <li><span class="title">총구매금액</span><span class="item"><strong>0</strong>원</span></li>
                                    <li><span class="title">회원가입일</span><span class="item">2016-07-26 09:15:37</span></li>
                                    <li><span class="title">최근로그인</span><span class="item">2016-07-27 14:04:32</span></li>
                                </ul>
                                <ul class="user_info_list">
									<li><span class="title" style="background:none !important;"><a href="/board/board.html?code=cherry07_board2&page=1&type=v&num1=999748&num2=00000&lock=N&flag=notice"><img src="image/grade.png" /></a></span></li>
									<li><span class="title">적립금</span><span class="item"><strong>2,000</strong>원</span> <a href="/shop/mypage.html?mypage_type=myreserve"><img src="image/detailView.png" class="detail_btn" /></a></li>
                                    <li><span class="title">예치금</span><span class="item"><strong></strong>원</span><a href="/shop/mypage.html?mypage_type=myemoney"><img src="image/detailView.png" class="detail_btn" /></a></li>
                                    <li><span class="title">포인트</span><span class="item"><strong>0</strong>P&nbsp;</span><a href="/shop/mypage.html?mypage_type=mypoint"><img src="image/detailView.png" class="detail_btn" /></a></li>
                                    <li><span class="title">할인쿠폰</span><span class="item"><strong>0</strong>개</span><a href="/shop/mypage.html?mypage_type=mycoupon"><img src="image/detailView.png" class="detail_btn" /></a></li>
                                </ul>
								<div class="clearfix"></div>
                            </div>
							<div class="clearfix"></div>

														<div class="grp hide">
								<!--/group_message/-->
								<p>
									<!-- 안지훈님은 <span class="fc-blue">[HAPPY KOKO]</span>회원입니다.<br /> -->
																										</p>
							</div>
							

							<div class="mypage_index_board">
								<ul>
									<li><a href="/board/board.html?code=cherry07_board2">공지사항</a></li>
									<li><a href="/board/board.html?s_id=&code=cherry07&page=1&type=s&search_header=%BB%F3%C7%B0%B9%AE%C0%C7&search_type=&stext=%BB%F3%C7%B0%B9%AE%C0%C7"> Q&A</a></li>
									<li><a href="/board/board.html?code=cherry07_board10">미입금 확인자</a></li>
									<li><a href="/shop/page.html?id=1">반품교환안내</a></li>
									<li><a href="/html/info.html">이용가이드</a></li>
									<li><a href="/board/board.html?code=cherry07_board9">배송지연상품</a></li>
								</ul>
							</div>



                        </div><!--/.mypage_index_info -->



                    </div><!-- .page-body -->
                </div><!-- #mypage -->
            </div><!-- #content -->
           <hr />
    <!-- ### 하단 시작 -->
		
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
	                	법인명(상호): (주)체리코코  | 대표자(성명): 지동헌 | 사업자 등록번호 안내: [215-87-15936] | 통신판매업 신고 제 2011 - 서울강남 - 03186호<br>
						전화: 1600-7255 | 주소: 서울특별시 강남구 신사동 517-4 M SPACE 빌딩 2층 (강남대로158길 26) -(주)체리코코 <br>
						교환 & 반품 주소 : 서울 성북구 종암동 57-39번지 CJ대한통운 종암대리점 (주)체리코코 <br>
						개인정보관리책임자: 지동헌 | Contact help@cherrykoko.com for more information.<br>
	                </p>
	                <p class="copyright" style="text-align: right;"><img src="http://img29.makeshop.co.kr/design/cherry07/trend9/cherrycoco/imgs/footer_copy_img.png" /></p>
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
</html>