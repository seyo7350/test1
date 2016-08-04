<%@page import="java.text.DecimalFormat"%>
<%@page import="product.productOptionDTO"%>
<%@page import="product.productDAO"%>
<%@page import="product.productDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="order.orderDTO"%>
<%@ page import="member.memberDTO" %>
<%@ page import="member.memberDAO" %>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정</title>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/jquery.bxslider.css">
<link href="css/my.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/member.css">


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
			<img alt="로고" src="image/header.png">
		</div>
	</div>	
	<div class="container_middle">
		<div class="content">
		
<span></span>
			<div id="content">
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
							<li class="first_child"><a href="mypage.jsp" class="mypage_menu1"><span class="hide">my page</span></a></li>
							<li><a href="shoppingbag.jsp" class="mypage_menu2"><span class="hide">shopping bag</span></a></li>
							<li><a href="myorder.jsp" class="mypage_menu3"><span class="hide">주문내역</span></a></li>
							<li><a href="myqna.jsp" class="mypage_menu5"><span class="hide">Q&A 내역</span></a></li>
							<li class="selected"><a href="mymodify.jsp" class="mypage_menu7"><span class="hide">내정보수정</span></a></li>
							<li class="last_child"><a href="mydelete.jsp" class="mypage_menu8"><span class="hide">회원탈퇴</span></a></li>
						</ul>
            
			            <!-- 여기삽입! -->
			            
			            <script>
function noSpaceForm(obj) { // 공백사용못하게
    var str_space = /\s/;  // 공백체크
    if(str_space.exec(obj.value)) { //공백 체크
        alert("해당 항목에는 공백을 사용할수 없습니다.");
        obj.focus();
        obj.value = obj.value.replace(' ',''); // 공백제거
        return false;
    }
}

//정보 처리 요청 확인
function checkIt() {
	var user = document.form;
	
	if (user.password.value == '') {
		alert('	비밀번호를 입력하세요!');
		user.password.focus();
		return false;
	}
}
</script>


<%
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

<form action="confirmpw.jsp" name= "form" method="post" onsubmit="return checkIt()">
<table width="700px">
   <tr>
      <td> 
       <img src ="image/reconfirm_pwd.gif" /><br><br>
    </td>
   </tr>
   <tr>
       <td>  
         <a>저희 쇼핑몰에서는 회원님의 소중한 개인정보를 안전하게 보호하고</a><br>
         <a>개인정보 도용으로 인한 피해를 예방하기 위하여 비밀번호를 확인합니다.</a><br>
         <a>비밀번호는 타인에게 노출되지 않도록 주의해주세요.</a><br><br>
       </td>
   </tr>
   <tr bgcolor="#f4f4f4";>
       <td>  
          <a style="font-size: 15px">아이디  : &nbsp;&nbsp;<%=mem.getMember_id() %></a><br><br>
          <input type="password" name = "password"  onkeyup="noSpaceForm(this)"; placeholder="비밀번호" />
          <input type="hidden" name="id" value="<%=mem.getMember_id() %>"/>
      </td>
  </tr>

  <tr>
     <td class="td">  
        <p align="center"><input  TYPE="IMAGE" src="image/update_confirm.gif" name="submit" value="submit" style="outline-style:none" width="90px" />
        &nbsp;&nbsp;<a href='mypage.jsp'><img src="image/update_cancel.gif"  width="90px" style="outline-style:none; vertical-align: top;"/></p>
      </td>
  </tr>
</table>
</form>
			            
			            
			            
			            
			            
			            
			            
			            
			            
			            
			            <!-- 여기삽입! -->
            		</div>
            	</div>             
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