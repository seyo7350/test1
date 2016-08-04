<%@page import="member.memberDTO"%>
<%@page import="order.orderDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="product.productOptionDTO"%>
<%@page import="product.productDAO"%>
<%@page import="product.productDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="order.orderDTO"%>
<%@page import="java.util.List"%>
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
<link href="css/myorder.css" rel="stylesheet" type="text/css">


<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="js/textRolling.js"></script>
<script src="js/jquery.bxslider.js"></script>
<script src="js/jquery.bxslider.min.js"></script>


</head>
<body>
<%
Object ologin = session.getAttribute("login");
memberDTO mem = null;

if(ologin == null){
	%>
	<script>
	  alert("로그인을 해주세요");
	  location.href="login.jsp";
	</script>
	<%
	return;
}
 mem = (memberDTO)ologin;
%>

<%
request.setCharacterEncoding("utf-8");

DecimalFormat df = new DecimalFormat("###,###,###");

orderDAO odao = orderDAO.getInstance();
productDAO pdao = productDAO.getInstance();

List<orderDTO> orderList = odao.getMemberOrderList(mem.getMember_seq());
%>

<script type="text/javascript">
function buy(){
	document.getElementById('frm1').submit();
}
</script>

<div class="side">
	<div class="side_inner">
		<div class="side_inner_top">
			<a href='logout.jsp'>logout</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href='join.jsp'>join</a><br>
			<a href='shoppingbag.jsp'>shopping bag</a><br>
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
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href ="reviewListPage.jsp">REVIEW</a>
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
		
<span></span>            <div id="content" >
                <div id="myOrder" class="section_myorder">

					<div class="page_path hide">
						<h3>현재 위치</h3>
						<ol>
							<li class="first"><a href="/">Home</a></li>
							<li><a href="javascript:;">Mypage</a></li>
							<li><a href="javascript:;">주문내역</a></li>
						</ol>
					</div>

					<div class="page_title_area hide">
						<h2></h2>
					</div>
                    <div class="page_title_area hide">
                        <!-- <h2 class="local"><img src="/images/d3/dandy_style/tit_shopping_cart.gif" alt="shopping order" title="shopping order" /></h2> -->
                    </div>

					<ul class="mypage_menu_tabs">
						<li class="first_child"><a href="mypage.jsp" class="mypage_menu1"><span class="hide">my page</span></a></li>
						<li><a href="shoppingbag.jsp" class="mypage_menu2"><span class="hide">shopping bag</span></a></li>
						<li class="selected"><a href="myorder.jsp" class="mypage_menu3"><span class="hide">주문내역</span></a></li>
						<li><a href="myqna.jsp" class="mypage_menu5"><span class="hide">Q&A 내역</span></a></li>
						<li><a href="mymodify.jsp" class="mypage_menu7"><span class="hide">내정보수정</span></a></li>
						<li class="last_child"><a href="mydelete.jsp" class="mypage_menu8"><span class="hide">회원탈퇴</span></a></li>
					</ul>
				
				  <div class="page-body">
                        <!-- <p class="t-box-msg hide"><strong>[안지훈]</strong>님이 쇼핑몰에서 주문한 내역입니다.</p> -->
                        <div class="table-d2-list">
							<h3><img src="image/myorder_table_title.png" /></h3>
                            <table summary="번호, 주문일자, 상품명, 결제금액, 주문상세, 배송현황" >
                                <caption></caption>
                                <colgroup>
                                    <col width="70" />
                                    <col width="95" />
                                    <col width="*" />
                                    <col width="100" />
                                    <col width="100" />
                                    <col width="100" />
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="row"><div class="tb-center">번호</div></th>
                                        <th scope="row"><div class="tb-center">주문일자</div></th>
                                        <th scope="row"><div class="tb-center">상품명</div></th>
                                        <th scope="row"><div class="tb-center">결제금액</div></th>
                                        <th scope="row"><div class="tb-center">주문상세</div></th>
                                        <th scope="row"><div class="tb-center">배송현황</div></th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<%
                                	if(orderList.isEmpty()){
                                		%>
                                		<tr>
	                                        <td colspan="6"><div class="tb-center">주문내역이 없습니다.</div></td>
	                                    </tr>
                                		<%
                                	}else{
                                		for(int i = 0; i < orderList.size(); i++){
                                			orderDTO odto = orderList.get(i);
                                			productDTO pdto = pdao.getProduct(odto.getOrder_product_seq());
                                			productOptionDTO podto = pdao.getProductOption(odto.getOrder_product_seq(), odto.getOrder_productOption_seq());                                			
                                			%>
                                			<tr>
                                				<td>
                                					<div class="tb-center">
                                						<%=i+1%>
                                					</div>
                                				</td>
                                				<td>
                                					<div class="tb-center">
                                						<%=odto.getOrder_regiDate()%>
                                					</div>
                                				</td>
                                				<td>
                                					<div class="tb-center">
                                						<%=pdto.getProduct_name()%>
                                					</div>
                                				</td>
                                				<td>
                                					<div class="tb-center">
                                						<%=pdto.getProduct_price()*odto.getOrder_amount()%>
                                					</div>
                                				</td>
                                				<td>
                                					<div class="tb-center">
                                						<%=podto.getProductOption_color()%><br><%=odto.getOrder_amount()%>개
                                					</div>
                                				</td>
                                				<td>
                                					<div class="tb-center">
	                                					<%
	                                					if(odto.getOrder_confirm()==0){
	                                						%>
	                                						결제완료
	                                						<%
	                                					}else{
	                                						%>
	                                						배송완료
	                                						<%
	                                						/* if() 리뷰*/
	                                					}
	                                					%>
	                                				</div>
                                				</td>
                                			<%
                                		}
                                	}
                                	%>
                                    
                                </tbody>
                            </table>
                        </div>

						<div class="page custom_paging">
							<p class="first"><a href="javascript:;">[처음]</a></p>
							<p class="prev"><a href="javascript:;">[이전]</a></p>
							<ol>
														</ol>
							<p class="next"><a href="javascript:;">[다음]</a></p>
							<p class="last"><a href="javascript:;">[끝]</a></p>
						</div>

                       <!--  <ul class="foot-dsc hide">
                            <li>상품명 또는 주문상세의 조회 버튼을 클릭하시면, 주문상세 내역을 확인하실 수 있습니다.</li>
                            <li>배송현황의 조회 버튼을 클릭하시면, 해당 주문의 배송 현황을 한눈에 확인하실 수 있습니다.</li>
                        </ul> -->
                    </div><!-- .page-body -->
                </div><!-- #myOrder -->
            </div><!-- #content -->
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
















