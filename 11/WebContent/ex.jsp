<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="my.css" rel="stylesheet" type="text/css">
<style type="text/css">

.MS_search_word { }

                            /* 배송비 레이어 */
                            .MS_tb_delivery { position: relative; cursor: pointer; }
                            .MS_tb_delivery .MS_deli_block { display: block; }
                            .MS_tb_delivery .MS_layer_delivery { 
                                display: none; 
                                position: absolute; 
                                right: -221px; 
                                top: 0px; 
                                border: 3px solid #747474; 
                                cursor: default; 
                                background: #fff;
                            }
                            .MS_tb_delivery .MS_layer_delivery iframe.MS_layer_delivery_iframe { 
                                left:-3px;
                                top:-3px;
                                width:192px;
                                height:100px;
                                position:absolute;
                                filter:alpha(opacity=0); 
                                opacity:0;
                                z-index:-1;
                            }
                            .MS_tb_delivery .MS_layer_delivery dl { padding: 10px; width: 180px; text-align: left; border: 3px solid #eee; }
                            .MS_tb_delivery .MS_layer_delivery dl dt { font-weight: bold; }
                            .MS_tb_delivery .MS_layer_delivery dl dd { margin-top: 5px; }
                            .MS_tb_delivery .MS_layer_delivery .bull { 
                                display: block; 
                                position: absolute; 
                                left: -13px; 
                                top: 0px; 
                                width: 0px; 
                                height: 0px; 
                                font-size:0; 
                                line-height: 0; 
                                border: 5px solid #fff; 
                                border-right: 5px solid #747474;
                            }


#cart .page-wrap h3.cart_top_title {
    padding: 20px 0 40px;
    text-align: center;
}

.section_cart {
    width: 935px;
    margin: 0 auto;
    font-family: dotum;
}

table {
    display: table;
    border-collapse: separate;
    border-spacing: 2px;
    border-color: gray;
}

table {
    width: 100%;
    border-collapse: collapse;
    border-spacing: 0;
    table-layout: fixed;
    word-wrap: break-word;
    word-break: keep-all;
}

hr, caption, legend {
    display: none;
}

user agent stylesheet
caption {
    display: table-caption;
    text-align: -webkit-center;
}

colgroup {
    display: table-column-group;
}

thead {
    display: table-header-group;
    vertical-align: middle;
    border-color: inherit;
}

tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}

#cart .page-wrap .cart-ct th {
    padding: 5px 0;
    border-top: 0px solid #d0d0d0;
    border-bottom: 1px solid #bbb;
    background-color: #fff;
    font-weight: normal;
    font-size: 11px;
    color: #787878;
}

tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}

tfoot {
    display: table-footer-group;
    vertical-align: middle;
    border-color: inherit;
}

p {
    display: block;
    -webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
}

#cart p.cart_desc {
    text-align: center;
    padding: 50px 0;
}


#cart .page-wrap .cart-ft {
    margin-top: 20px;
    text-align: right;
}


element.style {
    margin-top: 10px;
    text-align: right;
}

div {
    display: block;
}

#cart p.cart_desc {
    text-align: center;
    padding: 50px 0;
}

#cart .page-wrap h3.cart_top_title2 {
    padding-top: 100px;
}
#cart .page-wrap h3.cart_top_title {
    padding: 20px 0 40px;
    text-align: center;
}

#cart .page-wrap .second_cart_ct {
    padding-bottom: 150px;
}

div[Attributes Style] {
    text-align: -webkit-center;
}
user agent stylesheet
div {
    display: block;
}

#cart .page-wrap .cart-ct .p10 {
    padding: 10px 0;
}

.tb-center {
    text-align: center;
}

button, input, select, textarea, a {
    vertical-align: middle;
}
a {
    color: #787878;
    text-decoration: none;
}

user agent stylesheet
a:-webkit-any-link {
    color: -webkit-link;
    text-decoration: underline;
    cursor: auto;
}

.content_wrap_area {
    position: absolute;
    z-index: 1;
    left: 310px;
    top: 0px;
    background-color: #fff;
}

#cart .page-wrap .cart-ct tfoot td {
    padding: 3px 0;
    border-bottom: 2px solid #d0d0d0;
}

#cart .page-wrap .cart-ct td {
    padding: 8px 0;
}

/* #cart .page-wrap .cart-ct td {
    padding: 5px 0;
    border-bottom: 1px solid #bbb;
} */

#cart .page-wrap .cart-ct .amount input, #cart .page-wrap .cart-ct .amount .amount-txt {
	position: absolute;
	top: 0;
    left: 0;
    width: 20px;
    height: 14px;
    border: 1px solid #bbb;
    text-align: right;
}

#cart .page-wrap .cart-ct .thumb {
    padding: 0 5px;
}

#cart .page-wrap .cart-ct .thumb img {
    width: 60px;
    height: 60px;
    margin-right: 20px;
}

#cart .page-wrap .cart-ct .amount {
    position: relative;
    width: 33px;
    height: 35px;
    margin-left: auto;
    margin-right: auto;
}

.tb-left, .tb-center, .tb-right {
    padding: 0 10px;
}

#cart .page-wrap .cart-ct .amount .amount-up img {
    position: absolute;
    top: 2px;
    right: 0;
}

#cart .page-wrap .cart-ct .amount .amount-dw img {
    position: absolute;
    top: 10px;
    right: 0;
}

#cart .page-wrap .cart-ct .amount .amount-btn {
    position: absolute;
    bottom: 0;
    left: 0;
}
</style>




</head>
<body>
 <div id="contentWrapper">
        <div id="contentWrap">
            

<span></span>            <div id="content" >



                <div id="cart" class="section_cart">
                    <div class="navi hide">
                      <!--   <p><a href="/">Home</a> &gt; 장바구니</p> -->
                    </div>
                    <div class="page-hd hide">
                        <!-- <h2 class="local"><img src="/images/d3/dandy_style/tit_shopping_cart.gif" alt="shopping order" title="shopping order" /></h2> -->
                    </div>

					<ul class="mypage_menu_tabs">
						<li class="first_child"><a href="/shop/mypage.html" class="mypage_menu1"><span class="hide">my page</span></a></li>
						<li class="selected"><a href="/shop/basket.html" class="mypage_menu2"><span class="hide">shopping bag</span></a></li>
						<li><a href="/shop/mypage.html?mypage_type=myorder" class="mypage_menu3"><span class="hide">주문내역</span></a></li>
						<li><a href="/shop/mypage.html?mypage_type=mywishlist" class="mypage_menu4"><span class="hide">wish list</span></a></li>
						<li><a href="/shop/mypage.html?mypage_type=myarticle" class="mypage_menu5"><span class="hide">Q&A 내역</span></a></li>
						<li><a href="/shop/mypage.html?mypage_type=mym2mboard" class="mypage_menu6"><span class="hide">1:1 문의</span></a></li>
						<li><a href="/shop/idinfo.html" class="mypage_menu7"><span class="hide">내정보수정</span></a></li>
						<li class="last_child"><a href="/shop/mypage.html?mypage_type=myexituser" class="mypage_menu8"><span class="hide">회원탈퇴</span></a></li>
					</ul>

					<div class="page-wrap">
                        <h3 class="cart_top_title"><img src="image/shoppingBag.png" /></h3>
                        <div class="cart-ct">
                            <table summary="번호, 사진, 제품명, 수량, 적립, 가격, 배송비, 취소">
                                <caption>장바구니 담긴 상품 목록</caption>
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
				                    <form action="basket.html" method="post" name="forms"></from>
				                    <input type="hidden" name="brandcode" value="001001004819" />
				                    <input type="hidden" name="branduid" value="29791" />
				                    <input type="hidden" name="type" />
				                    <input type="hidden" name="orgamount" value="1" />
				                    <input type="hidden" name="orgspcode" value="0" />
				                    <input type="hidden" name="orgspcode2" value="0" />
				                    <input type="hidden" name="opts" value="0" />
				                    <input type="hidden" name="optioncode" value="0" />
				                    <input type="hidden" name="optionvalue" value="" />
				                    <input type="hidden" name="option_type" value="PS" />
				                    <input type="hidden" name="pack_uid" value="" />
				                    <input type="hidden" name="min_add_amount" value="1" />                                    
				                    <tr class="nobd">
                                        <td>
                                        <div class="tb-center">                                
                                        <input type="checkbox" name="basketchks"  id ="basketchks" checked="checked"  class="MS_input_checkbox" />
                                		<input type="hidden" name="basket_item" value='{"uid":"29791","brandcode":"001001004819","spcode":"0","spcode2":"0","optcode":"0","optioncode":"0","pack_uid":"","optionvalue":""}' />1
                                		</div>
                                	</td>
                                        <td>
                                        	<div class="tb-center thumb" style="margin-right: 20px;">
                                        	<a href="/shop/shopdetail.html?branduid=29791&xcode=001&mcode=&scode=&GfDT=bmx3UQ%3D%3D"><img src="image/0010010048193.jpg" alt="상품 섬네일" title="상품 섬네일" /></a>
                                        	</div>
                                        </td>
                                        
                                        <td>
                                            <div class="tb-left" align="center">
                                                <a href="/shop/shopdetail.html?branduid=29791&xcode=001&mcode=&scode=&GfDT=bmx3UQ%3D%3D">screws, blouse</a> <span class='MK-product-icons'></span>                                            </div>
                                        </td>
                                        <td>
                                            <div class="tb-center">
                                                <div class="amount">
                                                    <input type="text" name="amount" value="1" />
                                                    <a href="javascript:count_change(0, 0)" class="amount-up"><img src="image/arrow_w7_h4_top.gif" alt="수량증가" title="수량증가" /></a><a href="javascript:count_change(1, 0)" class="amount-dw"><img src="image/arrow_w7_h4_bottom.gif" alt="수량감소" title="수량감소" /></a>
                                                    <a href="javascript:send(0, 'upd')" class="amount-btn"><img src="image/cart_quantity_modify.png" alt="수정" title="수정" /></a>
                                                </div>
                                            </div>
                                        </td>
                                        <td><div class="tb-right">410</div></td>
                                        <td><div class="tb-right tb-bold"><span>41,000</span>원</div></td>
                                        <td><div class="tb-center">                    <div class="MS_tb_delivery">
                        <span class="MS_deli_txt" onmouseover="overcase(this, '0')" onmouseout="outcase(this, '0')">
                            <span class="MS_deli_title MS_deli_block">[기본배송]</span><span class="MS_deli_desc MS_deli_block">조건</span>
                        </span>
                        <div id="deliverycase0" class="MS_layer_delivery">
                            <dl>
                                <dt>배송조건 : 기본배송(조건)</dt>
                                <dd>
                                    주문금액이 <span class='MS_highlight'>50,000원</span> 미만시 <br /><br style='line-height:3px' />배송비 <span class='MS_highlight'>2,500원</span>이 청구됩니다.
                                </dd>
                            </dl>
                            <span class="bull"></span>
                            <iframe id="deliverycase_iframe0" class="MS_layer_delivery_iframe" frameborder="no" border="0"></iframe>
                        </div>
                    </div></div></td>
                                        <td>
                                            <div class="tb-center">
                                                <span class="d-block"><a href="javascript:go_wish('29791','0','0','0','0');"><img src="image/cart_go_wish.png" alt="관심상품" title="관심상품" /></a></span><br>
                                                <span class="d-block"><a href="javascript:send(0, 'del')"><img src="image/cart_list_delete.png" alt="삭제" title="삭제" /></a></span>
                                            </div>
                                        </td>
                                    </tr>
                                            <tr>
                                        <td colspan="8">
                                            <div class="tb-left" style="padding-left: 80px">
                                                <img src="image/basket_option.gif" alt="옵션" title="옵션" /> color : navy/네이비                                            </div>
                                        </td>
                                    </tr>
            </form>                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="8">
                                            <div class="tb-right p10" style="padding:3px 0;">
                                                총 구매금액 : 
                                                41,000원
                                                 
                                                 + 배송료 2,500원                                                                                                                                                = <strong style="color:#d29b63;">43,500원</strong>
                                                (적립금 410원)                                            </div>
                                        </td>
                                    </tr>
                                </tfoot>

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

                    </div>
                </div><!-- #cart -->
<!-- SOS 장바구니 코드 설치 iframe start ver. div-->
<div align="center">
<iframe id="srd_du_frame_cart" name="srd_du_frame_cart" align="center" frameborder=no scrolling=no src="" style="width:0px;height:0px;border:1px solid #d7d7d7;"></iframe>
</div>
<!-- SOS 장바구니 코드 설치 iframe end ver. div-->

            </div><!-- #content -->
            <hr />
        </div><!-- #contentWrap -->
    </div><!-- #contentWrapper -->
<!-- smrtrecm 장바구니 코드 설치 start -->
<script type="text/javascript" src="http://landingmaker.com/srd/sos/srd_cart.js"></script>
<!-- smrtrecm 장바구니 코드 설치 end-->
    <hr />
    <!-- ### 하단 시작 -->
    </div> <!--/#container -->

    <hr class="layout" />





















</body>
</html>