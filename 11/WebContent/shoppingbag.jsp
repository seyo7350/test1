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
<link href="css/shoppingbag.css" rel="stylesheet" type="text/css">


<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="js/textRolling.js"></script>
<script src="js/jquery.bxslider.js"></script>
<script src="js/jquery.bxslider.min.js"></script>


</head>
<body>

<%
request.setCharacterEncoding("utf-8");

DecimalFormat df = new DecimalFormat("###,###,###");

List<orderDTO> orderList;
productDAO pdao = productDAO.getInstance();

Object oshoppingbag = session.getAttribute("shoppingbag");

int total = 0;
int totalPoint = 0;
%>

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
                <div id="cart" class="section_cart">

					<div class="page_path hide">
						<h3>현재 위치</h3>
						<ol>
							<li class="first"><a href="/">Home</a></li>
							<li><a href="javascript:;">Mypage</a></li>
						</ol>
					</div>
                    <div class="page-body">

						<ul class="mypage_menu_tabs">
							<li class="first_child"><a href="mypage.jsp" class="mypage_menu1"><span class="hide">my page</span></a></li>
							<li class="selected"><a href="shoppingbag.jsp" class="mypage_menu2"><span class="hide">shopping bag</span></a></li>
							<li><a href="/shop/mypage.html?mypage_type=myorder" class="mypage_menu3"><span class="hide">주문내역</span></a></li>
							<!-- <li><a href="/shop/mypage.html?mypage_type=mywishlist" class="mypage_menu4"><span class="hide">wish list</span></a></li> -->
							<li><a href="/shop/mypage.html?mypage_type=myarticle" class="mypage_menu5"><span class="hide">Q&A 내역</span></a></li>
							<!-- <li><a href="/shop/mypage.html?mypage_type=mym2mboard" class="mypage_menu6"><span class="hide">1:1 문의</span></a></li> -->
							<li><a href="/shop/idinfo.html" class="mypage_menu7"><span class="hide">내정보수정</span></a></li>
							<li class="last_child"><a href="/shop/mypage.html?mypage_type=myexituser" class="mypage_menu8"><span class="hide">회원탈퇴</span></a></li>
						</ul>


                        <div class="page-wrap">
                        <h3 class="cart_top_title"><img src="image/shoppingBag.png" /></h3>
                        <div class="cart-ct">
                            <table summary="번호, 사진, 제품명, 수량, 적립, 가격, 배송비, 취소">
                                <!-- <caption>장바구니 담긴 상품 목록</caption> -->
                                <colgroup>
                                    <col width="70" />
                                    <col width="70" />
                                    <col />
                                    <col width="70" />
                                    <col width="70" />
                                    <col width="90" />
                                    <col width="90" />
                                    <col width="70" />
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>사진</th>
                                        <th>제품명</th>
                                        <th>수량</th>
                                        <th>적립</th>
                                        <th>가격</th>
                                        <th>배송비</th>
                                        <th>취소</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<%
                                	if(oshoppingbag == null){
                                		%>
                                		<tr class="nobd">
                                		<td colspan="8" style="text-align: center;">
                                		장바구니에 담긴 상품이 없습니다
                                		</td>
                                		</tbody>
                                		<%                                		
                                	}else{
                                		orderList = (ArrayList<orderDTO>)oshoppingbag;
                                		for(int i = 0; i < orderList.size(); i++){
                                    		orderDTO odto = orderList.get(i);
                                    		productDTO pdto = pdao.getProduct(odto.getOrder_product_seq());
                                    		productOptionDTO podto = pdao.getProductOption(odto.getOrder_product_seq(), odto.getOrder_productOption_seq());
                                    		%>
                                    		<tr class="nobd">
                                            <td>
    	                                        <div class="tb-center">                                
    	                                        	<input type="checkbox" onclick="checkProduct()" name="basketchks"  id ="basketchks" value="<%=odto.getOrder_seq()%>" checked="checked"  class="MS_input_checkbox" />
    	                                		</div>
                                    		</td>
                                            <td>
                                            	<div class="tb-center thumb" style="margin-right: 20px;">	<!-- img -->
                                            	<a href="product_detail.jsp?seq=<%=odto.getOrder_product_seq()%>"><img src="upload/product/<%=odto.getOrder_product_seq()%>/<%=pdto.getProduct_photo_gif()%>"></a>
                                            	</div>
                                            </td>                                        
                                            <td>
                                                <div class="tb-left" align="center">	<!-- 제품명 -->
                                                <a href="product_detail.jsp?seq=<%=odto.getOrder_product_seq()%>"><%=pdto.getProduct_name()%></a>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="tb-center">	<!-- 수량 -->
                                                	<%=odto.getOrder_amount()%>
                                                </div>
                                            </td>
                                            <td>	<!-- 적립 -->
                                            	<div class="tb-right">
                                            		<%=pdto.getProduct_point()*odto.getOrder_amount()%>
                                            		<%totalPoint += pdto.getProduct_point()*odto.getOrder_amount();%>
                                            	</div>
                                            </td>	                                            	
                                            <td>	<!-- 가격 -->
                                            	<div class="tb-right tb-bold">
                                            		<span><%=pdto.getProduct_price()*odto.getOrder_amount()%></span>원
                                            		<%total += pdto.getProduct_price()*odto.getOrder_amount();%>
                                            	</div>
                                            </td>	
                                            <td>
                                            	<div class="tb-center">
                                            		<div class="MS_tb_delivery">
    							                        <span class="MS_deli_txt">
    							                            <span class="MS_deli_title MS_deli_block">[기본배송]</span>
    							                        </span>                        							
                            						</div>
                        						</div>
                        					</td>
                                            <td>
                                                <div class="tb-center">
                                                	<span class="d-block"><a href="javascript:send(0, 'del')"><img src="image/cart_list_delete.png" alt="삭제" title="삭제" /></a></span>
                                                </div>
                                            </td>
                           				</tr>		
                                        <tr class="nobd-option">
                                            <td colspan="8">
                                                <div class="tb-left" style="padding-left: 80px">
                                                    <img src="image/basket_option.gif" alt="옵션" title="옵션" /> color : <%=podto.getProductOption_color()%>
                                                </div>
                                            </td>
                                        </tr>
                                        <%
                                		}
                                	%>
                                	</tbody>
                                	<tfoot>
	                                    <tr>
	                                        <td colspan="8">
	                                            <div class="tb-right p10" style="padding:3px 0;">
	                                            	총 구매금액 : <%=df.format(total)%>원
													<%
													if(total<50000){
														total += 2500;
														%> + 배송료2,500원<%
													}
													%>
													=
													<strong id="total" style="color:#d29b63;"><%=df.format(total)%>원</strong>
													(적립금 <%=df.format(totalPoint)%>원)
	                                            </div>
	                                        </td>
	                                    </tr>
                               		</tfoot>
                                    <%
                               	}
                               	%>
                                	<!-- <tr class="nobd">
                                        <td>
	                                        <div class="tb-center">                                
	                                        	<input type="checkbox" name="basketchks"  id ="basketchks" checked="checked"  class="MS_input_checkbox" />
	                                		</div>
                                		</td>
                                        <td>
                                        	<div class="tb-center thumb" style="margin-right: 20px;">
                                        	a 안에 이미지
                                        	</div>
                                        </td>                                        
                                        <td>
                                            <div class="tb-left" align="center">
                                            a 안에 이름
                                            </div>
                                        </td>
                                        <td>
                                            <div class="tb-center">
                                                	몇개
                                            </div>
                                        </td>
                                        <td><div class="tb-right">마일리지</div></td>
                                        <td><div class="tb-right tb-bold"><span>가격</span>원</div></td>
                                        <td>
                                        	<div class="tb-center">
                                        		<div class="MS_tb_delivery">
							                        <span class="MS_deli_txt">
							                            <span class="MS_deli_title MS_deli_block">[기본배송]</span>
							                        </span>                        							
                        						</div>
                    						</div>
                    					</td>
                                        <td>
                                            <div class="tb-center">
                                            	<span class="d-block"><a href="javascript:send(0, 'del')"><img src="image/cart_list_delete.png" alt="삭제" title="삭제" /></a></span>
                                            </div>
                                        </td>
                       				</tr>		
                                    <tr class="nobd-option">
                                        <td colspan="8">
                                            <div class="tb-left" style="padding-left: 80px">
                                                <img src="image/basket_option.gif" alt="옵션" title="옵션" /> color : navy/네이비
                                            </div>
                                        </td>
                                    </tr> -->
                              <!-- </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="8">
                                            <div class="tb-right p10" style="padding:3px 0;">
                                                	총 구매금액 : 41,000원  + 배송료 2,500원   = <strong style="color:#d29b63;">43,500원</strong> (적립금 410원)
                                            </div>
                                        </td>
                                    </tr>
                                </tfoot> -->

                            </table>
                        </div>


						<p class="cart_desc"><img src="image/cart_list_delivery_desc.png" /></p>

                        <div class="cart-ft">
                            <a href="javascript:basket_clear();"><img src="image/cart_list_clear_cart2.png" alt="장바구니 비우기" title="장바구니 비우기" /></a>&nbsp;
                             <a href="/html/mainm.html"><img src="image/cart_list_go_shopping2.png" alt="계속 쇼핑하기" title="계속 쇼핑하기" /></a>&nbsp;
                               <a href="javascript:multi_order()"><img src="image/cart_list_order2.png " alt="주문하기" title="주문하기" /></a>
                            <!-- <a href="javascript:basket_estimate()" class="hide"><img src="/design/cherry07/trend9/cherrycoco/imgs/cart_list_print_estimate.png" alt="견적서 출력" title="견적서 출력" /></a> -->
                        </div>
<div style="margin-top: 10px; text-align:right"></div>


						<p class="cart_desc"><img src="image/cart_list_cart_desc.png" /></p>

                       <!-- <h3 class="cart_top_title cart_top_title2"><img src="image/cart_top_wish_title.png" /></h3>
                        <div class="cart-ct second_cart_ct">
                            <table summary="사진, 제품명, 수량, 적립, 재고, 가격, 취소">
                                <caption>관심 상품 목록</caption>
                                <colgroup>
                                    <col width="70" />
                                    <col />
                                    <col width="70" />
                                    <col width="70" />
                                    <col width="70" />
                                    <col width="90" />
                                    <col width="70" />
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>사진</th>
                                        <th>제품명</th>
                                        <th>수량</th>
                                        <th>적립</th>
                                        <th>재고</th>
                                        <th>가격</th>
                                        <th>취소</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td colspan="7">
                                            <div class="tb-center p10">관심 상품이 없습니다.</div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table> -->
                        </div>



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

<script type="text/javascript">
function checkProduct(){
	var product = document.getElementByName("basketchks");
	var total = 0;
	for(var i = 0; i < product.length; i++){
		if(product[i].checked){
			total += product[i].value;
		}
	}
	printTotal(total);
}
function printTotal(total){
	document.getElementById(total).innerHTML = total;
}
</script>

</body>
</html>