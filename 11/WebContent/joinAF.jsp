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
<title>회원가입</title>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/jquery.bxslider.css">

<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="js/textRolling.js"></script>
<script src="js/jquery.bxslider.js"></script>
<script src="js/jquery.bxslider.min.js"></script>

<style type="text/css"> 
table { border-collapse:collapse; border:3px solid lightgray; } 
</style> 

</head>
<body>
 <%! //메소드 모음 
//1분을 01분으로 나타나게 만드는 메소드
public String two(String msg){
	return msg.trim().length()<2 ? "0"+msg : msg.trim();
}
%>
 
 <%
String name = request.getParameter("name");
String id = request.getParameter("id");
String password = request.getParameter("password");
String Chk_password = request.getParameter("Chk_password");

String year = request.getParameter("year");
String smonth = request.getParameter("month");
int month = Integer.parseInt(smonth);
String sday = request.getParameter("day");
int day = Integer.parseInt(sday);
String birthday = year+two(month+"")+two(day+"");

String postcode = request.getParameter("postcode");
String address1 = request.getParameter("address1");
String address2 = request.getParameter("address2");

String phone = request.getParameter("phone");
String email = request.getParameter("email");


memberDAO mdao = memberDAO.getInstance();

boolean isS = mdao.addMember(new memberDTO(name, id, password, postcode, address1, address2, email, phone, birthday));
 if(isS){
	%>
	<script type="text/javascript">
	alert("회원가입이 완료되었습니다.");
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("회원가입 중 오류가 발생하였습니다. 정보를 제대로 기입하셨는지 확인하시고 이상이 있으면 관리자에게 문의하세요.");
	location.href="join.jsp";
	</script>
	<%
}
%>     

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
			
<p style="text-align: center; background-color:rgb(214,214,214);" ><strong>회원가입 완료</strong></p>
<table align="center"  >
<col width ="150"><col width ="400">
 <tr>
      <td rowspan="4"> <img src ="image/legiAF.JPG" /> </td>
      <td> <a style="font-size: 12px; color:gray;"><%=name %>님의 회원가입이 성공적으로 이루어졌습니다.</a></td>
 </tr>
  <tr>
    <td> <a style="font-size: 12px; color:gray;">APPLEKOKO 안에서 즐거운 쇼핑 되세요.</a> </td>
 </tr>
  <tr>
    <td><a style="color: red;"><%=name %>님의 축하적립금은 2000원 입니다.</a></td>
 </tr>
   <tr>
    <td> <a style="font-size: 12px; color:gray;">감사합니다.</a> </td>
 </tr>
</table>
			
 <!--아래거 수정금지  --> 	
		</div>
	</div>
	<div class="container_footer">
		<div class="footer_content">
	        <div class="footer_info">
	            <!-- <ul class="menu">
	                GUIDE/개인정보취급방침/..
	            </ul> -->
	            <div class="address">
					<p style="text-align: right; color: #6c6c6c; font-weight: bold; font-style: italic;">
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