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
<title>비밀번호 찾기</title>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/jquery.bxslider.css">
<link rel="stylesheet" href="css/login.css">

<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="js/textRolling.js"></script>
<script src="js/jquery.bxslider.js"></script>
<script src="js/jquery.bxslider.min.js"></script>

<script>
	function noSpaceForm(obj) { // 공백사용못하게
		var str_space = /\s/; // 공백체크
		if (str_space.exec(obj.value)) { //공백 체크
			alert("해당 항목에는 공백을 사용할수 없습니다.");
			obj.focus();
			obj.value = obj.value.replace(' ', ''); // 공백제거
			return false;
		}
	}
	
	function email_check(email) {
		var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	    return (email != '' && email != 'undefined' && regex.test(email) === true);
	}
	
	function pwd_check(password){
		
	}
	
	//이메일 중복 여부를 판단
	function openConfirmEmail(user){
		//이메일을 입력했는지 검사
		if(user.email.value==''){
			alert('email을 입력하세요!!');
			return;
		}
		
		if ( !email_check(user.email.value) ) {
			alert('	올바른 이메일 형식이 아닙니다.');
			user.email.focus();
			return ;
		}	
	}

	//연락처 숫자 입력
	function onlyNumber(event){
				event = event || window.event;
				var keyID = (event.which) ? event.which : event.keyCode;
				if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
					return;
				else
					return false;
			}
	function removeChar(event) {
				event = event || window.event;
				var keyID = (event.which) ? event.which : event.keyCode;
				if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
					return;
				else
					event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}
	
	//회원 가입시 예외처리 확인
	function checkIt() {
		var user = document.form;
		
		
		
		if (user.id.value == '') {
			alert('아이디를 입력하세요!');
			user.id.focus();
			return false;
		}
		
		if (user.name.value == '') {
			alert('이름을 입력하세요!');
			user.name.focus();
			return false;
		}
		
	
		if (user.phone.value =="" ) {
			alert('	연락처를 입력하세요!');
			user.phone.focus();
			return false;
		}
			
		if (user.email.value =="") {
			alert('	이메일 계정을 입력하세요!');
			user.email.focus();
			return false;
		}
		
		if ( !email_check(user.email.value) ) {
			alert('	올바른 이메일 형식이 아닙니다.');
			user.email.focus();
			return false;
		}	
	}

	</script>
</script>


</head>
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
			
			
				<div class="wrapper">
		<div class="main"> <!-- 로고와 로그인창이 들어올 영역 -->
			<div class="logo">	<!-- 로고 이미지 영역 -->
			
			</div>
			<div class="login_box">
			
				<div class="input_login1">
				<!-- <iframe scrolling="no" frameborder="no" clocktype="html5" style="overflow:hidden;border:0;margin:0;padding:0;width:91px;height:30px;"
     src="http://www.clocklink.com/html5embed.php?clock=008&timezone=KoreaRepublicof_Seoul&color=gray&size=91&Title=&Message=&Target=&From=2016,1,1,0,0,0&Color=gray">
     </iframe> -->
				<form action="findPWAF.jsp" method="post"  name ="form" onsubmit="return checkIt()">
				</div>
				<div class="input_login">
					<input type="text" name="id" placeholder="아이디" onkeyup="noSpaceForm(this)"> 
				</div>
				<div class="input_login">
					<input type="text" name="name" placeholder="이름" onkeyup="noSpaceForm(this)">
				</div>
				<div class="input_login">
					 <input type="text" name="phone" placeholder="연락처" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'/> 
				</div>
				<div class="input_login">
					<input type="text" name="email" placeholder="이메일" onkeyup="noSpaceForm(this)" />
				</div>
				
				<div class="input_login" style="color: gray;">
					생년월일
						<!--태어난 년도 선택  -->
					<select name="year">
						<%
							for (int i = 1920; i <= 2016; i++) {
						%>
						<option <%=(i + "")%> value="<%=i%>"><%=i%></option>
						<%
							}
						%>
					</select><a>년</a> &nbsp;

					<!--태어난 월 선택  -->
					<select name="month">
						<%
							for (int i = 1; i <= 12; i++) {
						%>
						<option <%=(i + "")%> value="<%=i%>"><%=i%></option>
						<%
							}
						%>
					</select><a>월</a> &nbsp;

					<!--태어난 일 선택  -->
					<select name="day">
						<%
							for (int i = 1; i <= 31; i++) {
						%>
						<option <%=(i + "")%> value="<%=i%>"><%=i%></option>
						<%
							}
						%>
					</select><a>일</a> 
				</div>
							
				<div class="login">
					<input type="submit" value="비밀번호 찾기">
				</div>
     			</form>
			
				<div class="last">
					<div class="join" ><a href="join.jsp" style="color: gray;">회원가입</a></div>
				</div>
			</div>
		</div>
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