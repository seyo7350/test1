<%@page import="java.util.List"%>
<%@page import="product.productOptionDTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="product.productDTO"%>
<%@page import="product.productDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>koko</title>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/jquery.bxslider.css">
<link rel="stylesheet" href="css/contentstyle.css">

<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="js/textRolling.js"></script>
<script src="js/jquery.bxslider.js"></script>
<script src="js/jquery.bxslider.min.js"></script>

</head>
<body>

<%-- <%
Object ologin = session.getAttribute("login");
memberDTO mem = null;
if(ologin == null){
	%>
	<script type="text/javascript">
	alert('로그인 하십시오');
	location.href = 'index.jsp';
	</script>
	<%
	return;
}
mem = (memberDTO)ologin;
%> --%>

<%
String product_style_code_string = request.getParameter("product_style_code");
int product_style_code = Integer.parseInt(product_style_code_string);

productDAO pdao = productDAO.getInstance();
List<productDTO> pList = pdao.getProductList(product_style_code);
System.out.println(pList.size());
%>

<div class="side">
	<div class="side_inner">
		<div class="side_inner_top">
			<a href='login.jsp'>login</a>&nbsp;&nbsp;/&nbsp;&nbsp;join<br>
			shopping bag<br>
			mypage&nbsp;&nbsp;/&nbsp;&nbsp;home
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
		<div class="top_log" align="center">
			<img src="image/<%=product_style_code %>.jpg">
			<br>
			<br>
		</div>
		<div class="content">
			<div class="item-list">
				<ul class="prdlist">
				<%
				for(int i = 0; i < pList.size(); i++){
					productDTO pdto = pList.get(i);					
					List<productOptionDTO> poList =  pdao.getProductOptionList(pdto.getProduct_seq());
					%>
					<li class="item">
                  		<div class="box">
                    		<a href="product_detail.jsp?product_seq=<%=pdto.getProduct_seq()%>&product_style_code=<%=product_style_code %>" class="prdimg">
                    			<img src="upload/product/<%=pdto.getProduct_seq()%>/<%=pdto.getProduct_photo_gif()%>" alt="이미지 없음" onmouseover='src="upload/product/<%=pdto.getProduct_seq()%>/<%=pdto.getProduct_photo_main()%>"' onmouseout="src='upload/product/<%=pdto.getProduct_seq()%>/<%=pdto.getProduct_photo_gif()%>'"/>
                    		</a>
                  			<div class="product_contents_info">
                  				<p class="name">
                        			<a href="product_detail?product_seq=<%=pdto.getProduct_seq()%>"><%=pdto.getProduct_name()%></a>
                     			</p>
                     			<ul class="product_list_item">
                        			<li>
                           				<strong class="title title_price">판매가:</strong>
                           				<span class="product_price" style="text-align: center;">
                           				<%
                           				int price = pdto.getProduct_price();
                           				DecimalFormat df = new DecimalFormat("###,###,###");                           				
                           				%>
                           				<%=df.format(price)%>원
                           				</span>
                        			</li>
                        			<li class="color_type">
                           				<strong class="title title_color">색상 :</strong>
                           				<%
                           				System.out.println("poList= "+poList.size());
                           				for(int j = 0; j < poList.size(); j++){
                           					productOptionDTO podto = poList.get(j);
                           					%>
                           					<span style="display: inline-block; *margin:0 2px; width: 10px; height: 10px; background: <%=podto.getProductOption_colorCode()%>; border:1px solid #c3c3c3;"></span>
                           					<%
                           				}
                           				%>
                        			</li>
                     			</ul>
                  			</div>
                  		</div>
               		</li>
					<%
				}
				%>
				</ul>
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