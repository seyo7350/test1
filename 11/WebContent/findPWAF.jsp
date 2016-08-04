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

String year = request.getParameter("year");
String smonth = request.getParameter("month");
int month = Integer.parseInt(smonth);
String sday = request.getParameter("day");
int day = Integer.parseInt(sday);
String birthday = year+two(month+"")+two(day+"");

String phone = request.getParameter("phone");
String email = request.getParameter("email");

memberDAO mdao = memberDAO.getInstance();
memberDTO mem  = mdao.findPWLogin(new memberDTO(0,name,id,null,null,null,null,email,phone,birthday,null,0,0,0));

if(mem != null && !mem.getMember_id().equals("")&&mem.getMember_del()==0){
	session.setAttribute("login", mem);
	%>
	<script type="text/javascript">
	alert("비밀번호를 변경합니다.");
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("탈퇴 신청을 한 회원이거나 없는 아이디입니다. 또는 입력하신 정보 중 틀린 정보가 있습니다. 확인해주세요");
	location.href="findPW.jsp";
	</script>
	<%
}
%>
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
	
	
	//회원 가입시 예외처리 확인
	function checkIt() {
		var user = document.form;
		
			
		if (user.password.value == '') {
			alert('	비밀번호를 입력하세요!');
			user.password.focus();
			return false;
		}

		var check = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;

		if (!check.test(user.password.value)) {    
			alert("비밀번호는 문자, 숫자, 특수문자의 조합으로 8~20자리로 입력해주세요.");
	        return false;
		} 
			
		if (user.password.value == id) {
			alert('	비밀번호는 아이디와 똑같이 설정할 수 없습니다!');
			user.password.focus();
			return false;
		}
		
		if (user.Chk_password.value == '') {
			alert('	비밀번호 확인을 입력하세요!');
			user.Chk_password.focus();
			return false;
		}
		
		if (user.Chk_password.value != user.password.value) {
			alert('	비밀번호와 비밀번호 확인이 다릅니다. 확인하세요!');
			user.Chk_password.focus();
			return false;
		}
	}

	</script>
</script>


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
            memberDTO dto = null;
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
				<form action="changePW.jsp" method="post"  name ="form" onsubmit="return checkIt()">
				</div>
				<div class="input_login">
					<input type="password" name="password" placeholder="비밀번호" onkeyup="noSpaceForm(this)"> 
				</div>
				<div class="input_login">
					<input type="password" name="Chk_password" placeholder="비밀번호 확인" onkeyup="noSpaceForm(this)">
				</div>
				<div class="login">
				    <input type="hidden" name="id" value="<%=id%>"/>
					<input type="submit" value="비밀번호 변경">
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