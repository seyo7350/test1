<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>koko</title>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/jquery.bxslider.css">

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
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="product.jsp?product_style_code=<%=1 %>">TOP</a>
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
			<div class="rolling">
				<div class="rolling_title">
					<ul>
					    <li style="float: none; list-style: none; position: relative; height: 21px;">please read me;</li>
					</ul>
				</div>
				<div class="rolling_text">
					<ul id="scroll">
					    <li style="float: none; list-style: none; position: relative; height: 21px;"><a href="">공지사항 111111111111111111</a></li>
					    <li style="float: none; list-style: none; position: relative; height: 21px;"><a href="">222222222222222222222위</a></li>
					    <li style="float: none; list-style: none; position: relative; height: 21px;"><a href="">333333333333333333위</a></li>
					    <li style="float: none; list-style: none; position: relative; height: 21px;"><a href="">444444444444444위</a></li>
					    <li style="float: none; list-style: none; position: relative; height: 21px;"><a href="">555555555555555555위</a></li>
					    <li style="float: none; list-style: none; position: relative; height: 21px;"><a href="">6666666666666666위</a></li>
					    <li style="float: none; list-style: none; position: relative; height: 21px;"><a href="">7777777777777777777위</a></li>
					    <li style="float: none; list-style: none; position: relative; height: 21px;"><a href="">888888888888888888위</a></li>
					    <li style="float: none; list-style: none; position: relative; height: 21px;"><a href="">9999999999999999999위</a></li>
					    <li style="float: none; list-style: none; position: relative; height: 21px;"><a href="">1000000000000000위</a></li>
					</ul>
				</div>
			</div>
			<!-- content -->
			<!-- 여기에 삽입 -->
			<div id="main">
				<div class="widget_main_visual_area"> 
	   				<ul class="slider">	      
					  <li><img src="image/main1.jpg" style="width: 1155px;"/></li>
					  <li><img src="image/main2.jpg" style="width: 1155px;"/></li>
					  <li><img src="image/main3.jpg" style="width: 1155px;"/></li>
					  <li><img src="image/main4.jpg" style="width: 1155px;"/></li>
					  <li><img src="image/main5.jpg" style="width: 1155px;"/></li>
					  <li><img src="image/main6.jpg" style="width: 1155px;"/></li>
					  <li><img src="image/main7.jpg" style="width: 1155px;"/></li>
					  <li><img src="image/main8.jpg" style="width: 1155px;"/></li>
					</ul>
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