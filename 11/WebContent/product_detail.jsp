<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>koko</title>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/detailstyle.css">

</head>
<body>

<div class="side">
	<div class="side_inner">
		<div class="side_inner_top">
			login&nbsp;&nbsp;/&nbsp;&nbsp;join<br>
			shopping bag<br>
			mypage&nbsp;&nbsp;/&nbsp;&nbsp;home
		</div>
		<div class="side_inner_middle">	
			<hr>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OUTER
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TOP
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
			<!-- content -->
			<div id="contnent">
				<div id="productDetail">
					<div class="page_path">
						<h3>현재위치</h3>
					</div>
					<div class="page-body">
						<div class="thumb-info">
							<div class="thumb-wrap">
								<div class="thumb">
									<img src ="image/002001003874.jpg" alt=""/>
								</div>
							</div>
							 <!--  .thumb-wrap  -->
							 <form name="form1" id="form1" method="post">
								<div class="info">
									<h3 class="tit-prd">상품명</h3>
								<div class="table-opt">
									<table summary="판매가격, 적립금, 주문수량, 옵션, 사이즈">
									<colgroup>
										<col width="90">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">
												<div class="tb-left">code</div>
											<th>
											<td>
												<div class="prd-price detail_info_right">코드번호</div>
											</td>
										</tr>
										<tr>
											<th scope="row">
												<div class="tb-left">price</div>
											<th>
											<td>
												<div class="prd-price detail_info_right">가격넣는곳</div>
											</td>
										</tr>
										<tr>
											<th scope="row">
												<div class="tb-left">mileage</div>
											<th>
											<td>
												<div class="prd-price detail_info_right">마일리지 넣는 곳</div>
											</td>
										</tr>
										<tr>
											<th scope="row">
												<div class="tb-left">color</div>
											<th>
											<td>
												<div class="detail_info_right">
													<span id="MK_opt_0">
		    											<input type="hidden" id="optionlist_0" name="optionlist[]" value="">
		    												<select id="MK_p_s_0" onchange="p_add_product(this)" p_opt_cnt="0" mandatory="Y">
		       													<option value="">--옵션 선택--</option>
		        												<option value="0" price="29000" opt_price="0" opt_title="black/블랙" stock_cnt="-1">black/블랙</option>
		    												</select>
		    										</span>
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="3">
												<div class="MK_optAddWrap">
													<div id="MK_innerOptWrap">
														<div id="MK_innerOptTotal">
															<span class="MK_txt-total">총 상품 금액</span>
															<strong class="MK_total" id="MK_p_total">0</strong>
															<span class="MK_txt-won">원</span>
														</div>
													</div>
												</div>
												<!-- .MK_optAddWrap --> 
											</td>
										</tr>	
									</tbody>
									</table> 
								</div>
								<!-- .table-opt -->
								<div class="shopping_tip" style="margin-top: 18px !important;">
									<h2 class="shopping title">
										<img src="image/detail_shopping_title.png">
									</h2>
									<p class="text_area">- 5만원 이상 무료배송<br> <br>


									- 적립금혜택 : 회원가입 적립금 2,000원<br>
									- 상품별 첫포토후기 적립금 5,000원 사진후기2,000원 글 1,000원 <br>
									</p>
							</div>
							<div class="prd-btns">
                            	<a href="buy.jsp" id="buyBtn"><img src="image/detail_buy_bt_over.png" alt="주문하기" title="주문하기"></a>
					    		<a href="cart.jsp" id="cartBtn"><img src="image/detail_cart_bt_over.png" alt="장바구니 담기" title="장바구니 담기"></a>
                			</div>
                		</div>
                		<!--  .info  -->
					</form>
				</div>
				<!-- thumb-info  -->
							<div id="detail_detail">
								<h3 class="tit-detail">DETAIL</h3>
								<div class="prd-detail">
									<div>
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tbody>
												<tr>
													<td></td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- [OPENEDITOR] -->
									<!--    width="90%"      -->
									<center>
										<img alt="yes! we are cherrykoko"
											src="http://cherry07.img12.kr/product/160711_C66PWOP140/1.jpg">
										<br>
										<br>
										<font color="#646464" face="굴림"><span
											style="font-size: 9pt;"><br>
											<br>
											<font color="#000000" face="돋움" size="2"><b>ABOUT
												</b></font><br>
											<br>하나만 입어도 드레스한 느낌으로 모던하면서 간편하게 즐기실 수 있는 원피스를 소개할께요<br>
											<br>심플하고 깔끔한 핏감으로 누구나 페미닌하게 즐기실 수 있는 멋스러운 아이구요<br>
											<br>모델 지원양은 발목 살짝 위로 올라오는 기장감으로 마무리 되었어요^^<br>
											<br>
											<br>
											<font color="#000000" face="돋움" size="2"><b>DETAIL
														TIP </b></font><br>
											<br>하나만 입어도 드레스한 느낌으로 모던하면서 간편하게 즐기실 수 있는 원피스를 소개할께요<br>
											<br>심플하고 깔끔한 핏감으로 누구나 페미닌하게 즐기실 수 있는 멋스러운 아이구요<br>
											<br>모델 지원양은 발목 살짝 위로 올라오는 기장감으로 마무리 되었어요^^<br>
											<br>
											<br>
											<font color="#000000" face="돋움" size="2"><b>SIZE
														TIP </b></font><br>
											<br>원 사이즈 제품이에요! 평소 55 사이즈 착용하는 지원양은 여유있게 잘 맞았구요~<br>
											<br>66사이즈 고객님까지 안정감있게 잘 맞으실꺼같아요 !<br>
											<br>
											<br>
											<font color="#000000" face="돋움" size="2"><b>WASHING
														TIP </b></font><br>
											<br>물에 젖으면 강도가 50%정도 감소되므로 세탁시 비누나 중성세제를 사용하여 <br>
											<br>비틀거나 짜지말고 손으로 조물조물 하여 세탁하세요.<br>
											<br>세탁기를 사용할 시에는 반드시 세탁망에 넣어 단시간에 탈수 후 건조하시면 되요.<br>
											<br></span></font>
									</center>
									<center>
										<img height="250"
											src="http://cherry07.img12.kr/product/aaa.jpg"><br>
										<br>
										<img alt="yes! we are cherrykoko"
											src="http://cherry07.img12.kr/product/160711_C66PWOP140/2.jpg"><br>
										<br>
										<img height="400"
											src="http://cherry07.img12.kr/product/aaa.jpg"><br>
										<br>
										<img alt="yes! we are cherrykoko"
											src="http://cherry07.img12.kr/product/160711_C66PWOP140/3.jpg"><br>
										<br>
										<img height="400"
											src="http://cherry07.img12.kr/product/aaa.jpg"><br>
										<br>
										<img alt="yes! we are cherrykoko"
											src="http://cherry07.img12.kr/product/160711_C66PWOP140/4.jpg"><br>
										<br>
										<img height="400"
											src="http://cherry07.img12.kr/product/aaa.jpg"><br>
										<br>
										<img alt="yes! we are cherrykoko"
											src="http://cherry07.img12.kr/product/160711_C66PWOP140/5.jpg"><br>
										<br>
										<img height="400"
											src="http://cherry07.img12.kr/product/aaa.jpg"><br>
										<br>
										<img alt="yes! we are cherrykoko"
											src="http://cherry07.img12.kr/product/160711_C66PWOP140/6.jpg"><br>
										<br>
										<img height="400"
											src="http://cherry07.img12.kr/product/aaa.jpg"><br>
										<br>
										<img alt="yes! we are cherrykoko"
											src="http://cherry07.img12.kr/product/160711_C66PWOP140/7.jpg"><br>
										<br>
										<img height="400"
											src="http://cherry07.img12.kr/product/aaa.jpg"><br>
										<br>
										<img alt="yes! we are cherrykoko"
											src="http://cherry07.img12.kr/product/160711_C66PWOP140/8.jpg"><br>
										<br>
										<img height="400"
											src="http://cherry07.img12.kr/product/aaa.jpg"><br>
										<br>
										<img alt="yes! we are cherrykoko"
											src="http://cherry07.img12.kr/product/160711_C66PWOP140/9.jpg"><br>
										<br>
										<img height="400"
											src="http://cherry07.img12.kr/product/aaa.jpg"><br>
										<br>
										<img alt="yes! we are cherrykoko"
											src="http://cherry07.img12.kr/product/160711_C66PWOP140/10.jpg"><br>
										<br>
										<img height="400"
											src="http://cherry07.img12.kr/product/aaa.jpg"><br>
										<br>
										<img alt="yes! we are cherrykoko"
											src="http://cherry07.img12.kr/product/160711_C66PWOP140/11.jpg"><br>
										<br>
										<img height="400"
											src="http://cherry07.img12.kr/product/aaa.jpg"><br>
										<br>
										<img alt="yes! we are cherrykoko"
											src="http://cherry07.img12.kr/product/160711_C66PWOP140/12.jpg"><br>
										<br>
										<img height="400"
											src="http://cherry07.img12.kr/product/aaa.jpg"><br>
										<br>
										<img alt="yes! we are cherrykoko"
											src="http://cherry07.img12.kr/product/160711_C66PWOP140/13.jpg"><br>
										<br>
										<img height="400"
											src="http://cherry07.img12.kr/product/aaa.jpg"><br>
										<br>
										<img alt="yes! we are cherrykoko"
											src="http://cherry07.img12.kr/product/160711_C66PWOP140/14.jpg"><br>
										<br>
										
								</div>
							</div>
		</div>
	</div>
		
	</div>
	<div class="container_footer">
	container_footer
	</div>
</div>


</body>
</html>