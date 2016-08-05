<%@page import="java.text.DecimalFormat"%>
<%@ page import="member.memberDAO" %>
<%@ page import="member.memberDTO" %>
<%@page import="product.productDTO"%>
<%@page import="product.productOptionDTO"%>
<%@page import="product.productDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이용안내</title>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/jquery.bxslider.css">

<style type="text/css">
.page_title_area h2 {
    text-align: center;
    width: 100%;
    margin: 0 0 -1px 0;
    padding: 0 0 0 0;
    font-size: 20px;
    color: #494949;
    font-weight: bold;
    text-transform: capitalize;
    background-color: #d6d6d6 !important;
}

</style>


<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="js/textRolling.js"></script>
<script src="js/jquery.bxslider.js"></script>
<script src="js/jquery.bxslider.min.js"></script>


</head>
<body>
<%
int outer_style_code = 101;
int top_style_code = 102;
int bottom_style_code = 103;
int onepice_style_code = 104;

productDAO pdao = productDAO.getInstance();

List<productDTO> outerList = pdao.getProductList(outer_style_code);
List<productDTO> topList = pdao.getProductList(top_style_code);
List<productDTO> bottomList = pdao.getProductList(bottom_style_code);
List<productDTO> onepiceList = pdao.getProductList(onepice_style_code);
%>

<div class="side">
	<div class="side_inner">
		<div class="side_inner_top">
            <%
Object ologin = session.getAttribute("login");
memberDTO mem = null;

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
			<a href='mypage.jsp'>mypage</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href='index.jsp'>home</a>
		</div>
		<div class="side_inner_middle">	
			<hr>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="product.jsp?product_style_code=<%=101 %>">OUTER</a>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="product.jsp?product_style_code=<%=102 %>">TOP</a>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="product.jsp?product_style_code=<%=103 %>">BOTTOM</a>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="product.jsp?product_style_code=<%=104 %>">ONEPIECE</a>
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
			
<div class="page_title_area">
<h2>이용안내</h2>
</div>
		
<pre style="font-size: 12px;">
저희 쇼핑몰을 방문해 주셔서 감사드립니다. 저희 쇼핑몰은 회원제를 실시하고 있습니다.
처음 오신 분은 먼저 회원가입을 하신 후 이용하시길 바랍니다.
<hr>
<strong>상품 주문 방법</strong><br>
1. 각 코너를 클릭하셔서 들어갑니다.
2. "바로가기" 메뉴 또는 사진이나 상품명을 클릭하세요!
3. "장바구니 담기"를 클릭하세요!
4. "장바구니에 넣었습니다" 메시지가 나오면, 주문상품을 확인한 후 "주문버튼"을 클릭하세요!
5. 주문버튼을 누르면, "주문서"가 나옵니다! 주문서를 작성 후 "주문"을 클릭하면 주문이 완료됩니다!
<hr>
<strong>전화</strong><br>
주소 : 서울시 강남구 신사동 517-4 2층 체리코코
전화 : 1600-7255
메일 : help@cherrykoko.com
<hr>
<strong>배송일</strong><br>
배송 방법은 택배입니다.
주문하신 날로부터 1 ~ 4일 안에 받을 수 있습니다.
온라인 입금 시 입금 확인 후 1 ~ 4일
신용카드 결제 시 주문 후 1 ~ 4일
<hr>
<strong>반품 안내</strong><br>
고객의 변심에 의한 교환 및 반품이면 배송비는 소비자부담입니다.
상품의 이상에 의한 교환 및 반품이면 배송비는 판매자부담입니다.
문의 : 1600-7255
담당 : 나반품
전화 : 1600-7255
메일 : help@applekoko.com</pre>
<hr>

<strong>찾아오시는 길</strong><br><br>
<img alt="지도" src="image/map.jpg"/>
		
			
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
</html>