<%@ page import="member.memberDAO" %>
<%@ page import="member.memberDTO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mypage</title>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/jquery.bxslider.css">
<link href="css/my.css" rel="stylesheet" type="text/css">

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
<div class="side">
	<div class="side_inner">
		<div class="side_inner_top">
			<a href='logout.jsp'>logout</a>&nbsp;&nbsp;/&nbsp;&nbsp;
			<a href='join.jsp'>join</a><br>
			shopping bag<br>
			<a href='myPage.jsp'>mypage</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href='index.jsp'>home</a>
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
			
<div id="container">
 <div id="contentWrapper">
        <div id="contentWrap">
            
           <div id="content"> 
                <div id="mypage" class="section_mypage">

                    <div class="page-body">

						<ul class="mypage_menu_tabs">
							<li class="first_child selected"><a href="mypage.jsp" class="mypage_menu1"><span class="hide">my page</span></a></li>
							<li><a href="shoppingbag.jsp" class="mypage_menu2"><span class="hide">shopping bag</span></a></li>
							<li><a href="myorder.jsp" class="mypage_menu3"><span class="hide">주문내역</span></a></li>
							<li><a href="myqna.jsp" class="mypage_menu5"><span class="hide">Q&A 내역</span></a></li>
							<li><a href="mymodify.jsp" class="mypage_menu7"><span class="hide">내정보수정</span></a></li>
							<li class="last_child"><a href="mydelete.jsp" class="mypage_menu8"><span class="hide">회원탈퇴</span></a></li>
						</ul>


                        <div class="mypage_index_info" style="text-align: center;">
                            <div class="user">
                                <!-- <p class="hide">안지훈[ahnjihunj]님 <a href="/shop/idinfo.html" class="custom_button button_tiny_level1"><img src="/images/d3/modern_simple/btn/h18_modify.gif" alt="정보수정" /></a></p> -->
                                <ul class="user_info_list">
                                    <li><span class="title">이름</span><span class="item"><%=mem.getMember_name() %></span></li>
                                    <li><span class="title">회원가입일</span><span class="item"><%=mem.getMember_regidate() %></span></li>
 									<li><span class="title">포인트</span><span class="item"><strong><%=mem.getMember_point() %></strong>P&nbsp;</span></li>
                                </ul>
                                <ul class="user_info_list">
                                    <li><span class="title">연락처</span><span class="item"><%=mem.getMember_phone() %></span></li>
                                    <li><span class="title">이메일</span><span class="item"><%=mem.getMember_email() %></span></li>
                                    <li><span class="title">집주소</span><span class="item"><%=mem.getMember_address() %></span></li>
 									<li><span class="title">상세주소</span><span class="item"><%=mem.getMember_addressDetail() %></span></li>
                                </ul>
							
                            </div>
							<br><br><br>

							

							<div class="mypage_index_board">
								<ul>
									<li><a href="noticeList.do" style="text-decoration: none;" ;>공지사항</a></li>
									<li><a href="qnaList.do" style="text-decoration: none;"> Q&A</a></li>
									<li><a href="change.jsp" style="text-decoration: none;">반품교환안내</a></li>
									<li><a href="guide.jsp" style="text-decoration: none;">이용가이드</a></li>
								</ul>
							</div>



                        </div><!--/.mypage_index_info -->



                    </div><!-- .page-body -->
                </div><!-- #mypage -->
            </div><!-- #content -->
        </div><!-- #contentWrap -->
    </div><!-- #contentWrapper-->
    <hr />
    <!-- ### 하단 시작 -->
    
    </div> <!--/#container -->
		
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