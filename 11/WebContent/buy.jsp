<%@page import="java.util.ArrayList"%>
<%@page import="order.orderDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="product.productOptionDTO"%>
<%@page import="product.productDTO"%>
<%@page import="product.productDAO"%>
<%@page import="member.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>koko</title>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/buy.css">
<link rel="stylesheet" href="css/jquery.bxslider.css">

<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="js/textRolling.js"></script>
<script src="js/jquery.bxslider.js"></script>
<script src="js/jquery.bxslider.min.js"></script>


</head>

<%
Object ologin = session.getAttribute("login");
memberDTO mdto = null;
if(ologin == null){
	%>
	<script type="text/javascript">
	alert('로그인 하십시오');
	location.href = 'login.jsp';
	</script>
	<%
	return;
}
mdto = (memberDTO)ologin;
%>
<%
DecimalFormat df = new DecimalFormat("###,###,###");

request.setCharacterEncoding("utf-8");

List<orderDTO> orderList;

orderList = (ArrayList<orderDTO>)session.getAttribute("buyList");

productDAO pdao = productDAO.getInstance();

int total = 0;
int totalPoint = 0;
%>

<script type="text/javascript">
function buy(){
	document.getElementById('frm1').submit();
}
</script>

<body>

<%-- product_seq : <%=product_seq%>
<br>
product_option_count : <%=product_option_count%>
<br>
<%
for(int i = 0; i < product_option_count; i++){
	%>
	productOption_seq : <%=productOption_seq[i]%>
	amount : <%=request.getParameter("MK_p_cnt_"+i)%>
	<br>
	<%
}
%> --%>

<div class="side">
	<div class="side_inner">
		<div class="side_inner_top">
			<a href='login.jsp'>login</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href='join.jsp'>join</a><br>
			shopping bag<br>
			<a href='mypage.jsp'>mypage</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href='index.jsp'>home</a>
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
			<div id="order">
				<div class="page_title_area">
					<h2>주문서 작성</h2>
				</div>				
			</div>
			<div class="content">
				<div class="order">
					<div class="page_body">
						<h5><img src="image/order_detail01.gif"></h5>
						<div class="table-cart table-order-prd">
							<div class="boxTop">
							</div>
							<div class="boxMiddle">
								<table cellspacing="0" cellpadding="0" class="boxMiddleright" align="center" border="0" width="100%">
									<tbody>
										<tr>
											<td style="background: none !important;">
												<table width="98%" cellspacing="0" cellpadding="2" align="center" border="0">
													<thead>
														<tr>
															<th align="center" width="40%" colspan="2">
																<table width="100%" cellspacing="0" cellpadding="0">
																	<tbody>
																		<tr>
																			<td width="100%" bgcolor="#efedeb" align="center" style="background: none !important;">
																				<img src="image/title01.gif">
																			</td>
																			<!-- <td>
																				<img src="image/title_box_right1.gif">
																			</td> -->
																		</tr>
																	</tbody>
																</table>
															</th>
															<th align="center" width="15%">
																<table width="100%" cellspacing="0" cellpadding="0">
																	<tbody>
																		<tr>
																			<!-- <td>
																				<img src="image/title_box_right1.gif">
																			</td> -->
																			<td width="100%" bgcolor="#efedeb" align="center" style="background: none !important;">
																				<img src="image/title02.gif">
																			</td>
																			<!-- <td>
																				<img src="image/title_box_right1.gif">
																			</td> -->
																		</tr>
																	</tbody>
																</table>
															</th>
															<th align="center" width="8%">
																<table width="100%" cellspacing="0" cellpadding="0">
																	<tbody>
																		<tr>
																			<!-- <td>
																				<img src="image/title_box_right1.gif">
																			</td> -->
																			<td width="100%" bgcolor="#efedeb" align="center" style="background: none !important;">
																				<img src="image/title03.gif">
																			</td>
																			<!-- <td>
																				<img src="image/title_box_right1.gif">
																			</td> -->
																		</tr>
																	</tbody>
																</table>
															</th>
															<th align="center" width="15%">
																<table width="100%" cellspacing="0" cellpadding="0">
																	<tbody>
																		<tr>
																			<!-- <td>
																				<img src="image/title_box_right1.gif">
																			</td> -->
																			<td width="100%" bgcolor="#efedeb" align="center" style="background: none !important;">
																				<img src="image/title04.gif">
																			</td>
																			<!-- <td>
																				<img src="image/title_box_right1.gif">
																			</td> -->
																		</tr>
																	</tbody>
																</table>
															</th>
															<th align="center" width="15%">
																<table width="100%" cellspacing="0" cellpadding="0">
																	<tbody>
																		<tr>
																			<!-- <td>
																				<img src="image/title_box_right1.gif">
																			</td> -->
																			<td width="100%" bgcolor="#efedeb" align="center" style="background: none !important;">
																				<img src="image/title05.gif">
																			</td>
																			<!-- <td>
																				<img src="image/title_box_right1.gif">
																			</td> -->
																		</tr>
																	</tbody>
																</table>
															</th>
														</tr>
													</thead>
													<tbody>
														<%
														for(int i = 0; i < orderList.size(); i++){
															orderDTO odto = orderList.get(i);
															productDTO pdto = pdao.getProduct(odto.getOrder_product_seq());
															productOptionDTO podto = pdao.getProductOption(odto.getOrder_product_seq(), odto.getOrder_productOption_seq());
															%>
															<tr class="nbg">
																	<td>
																		<div class="tb-left">
																			<img src="upload/product/<%=pdto.getProduct_seq()%>/<%=pdto.getProduct_photo_gif()%>" width="38" height="50">
																		</div>
																	</td>
																	<td>
																		<div class="tb-left">
																			<a href="#"><%=pdto.getProduct_name()%></a>
																			(color : <%=podto.getProductOption_color()%>)
																		</div>
																	</td>
																	<td>
																		<div class="tb-right tb-bold">
																			<%=df.format(pdto.getProduct_price())%>원
																		</div>
																	</td>
																	<td>
																		<div class="tb-center">
																			<%=odto.getOrder_amount()%>개
																		</div>
																	</td>
																	<td>
																		<div class="tb-right">
																			<%=df.format(pdto.getProduct_point()*odto.getOrder_amount())%>원
																			<%totalPoint += pdto.getProduct_point()*odto.getOrder_amount();%>
																		</div>
																	</td>
																	<td>
																		<div class="tb-right tb-bold">
																			<%=df.format(pdto.getProduct_price()*odto.getOrder_amount())%>원
																			<%total += pdto.getProduct_price()*odto.getOrder_amount();%>
																		</div>
																	</td>
																</tr>
															<%
														}
														%>
													</tbody>
													<tfoot>
														<tr>
															<td colspan="6" style="background: none !important;">
																<table width="100%" cellspacing="0" cellpadding="0">
																	<tbody>
																		<tr>
																			<td colspan="3" width="100%" style="padding-right: 20px;" align="right">
																				<div class="tb-right">
																					결제금액 : 
																					<span id="order_price_box1" style="display: inline;">
																						<%=df.format(total)%>
																						<%
																						if(total<50000){
																							total += 2500;
																							%> + 배송료2,500원<%
																						}
																						%>
																						=
																						<strong><%=df.format(total)%>원</strong>
																						(적립금 <%=df.format(totalPoint)%>원)
																					</span>
																				</div>
																			</td>
																		</tr>
																	</tbody>
																</table>
															</td>
														</tr>
													</tfoot>
												</table>
											</td>
										</tr>
									</tbody>
								</table>
							</div>	<!-- boxMiddle -->							
						</div>
						<div style="text-align: right;">
							<form action="buyAf.jsp" id="frm1" method="post">
								<div class="btnBox">
									<div id="order1">
										<a href="javascript:buy();" style="text-decoration: none !important;">
											<img src="image/order_finish.gif" alt="주문하기" title="주문하기">
										</a>
										<a href="shoppingbag.jsp" style="text-decoration: none !important;">
											<img src="image/order_cancel.gif" alt="주문취소" title="주문취소">
										</a>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container_footer">
		<div class="footer_content">
	        <div class="footer_info">
	           <!--  <ul class="menu">
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
	</div>container_footer
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