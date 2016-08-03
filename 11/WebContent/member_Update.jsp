<%@ page import="member.memberDTO" %>
<%@ page import="member.memberDAO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보수정</title>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/jquery.bxslider.css">
<link rel="stylesheet" href="css/member.css">

<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="js/textRolling.js"></script>
<script src="js/jquery.bxslider.js"></script>
<script src="js/jquery.bxslider.min.js"></script>
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

</head>
<body>
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
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OUTER
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="top.jsp">TOP</a>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;BOTTOM
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ONEPIECE
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
        &nbsp;&nbsp;<a href='myPage.jsp'><img src="image/update_cancel.gif"  width="90px" style="outline-style:none; vertical-align: top;"/></p>
      </td>
  </tr>
</table>
</form>
				
				



			</div>
		</div>
		<div class="container_footer">
			<div class="footer_content">
				<div class="footer_info">
					<!-- <ul class="menu">
	                GUIDE/개인정보취급방침/..
	            </ul> -->
					<div class="address">
						<p
							style="text-align: right; color: #6c6c6c; font-weight: bold; font-style: italic;">
							CALL 1600 - 7255<br> MON-FRI AM 10:00 - PM 5:00 / SAT AM
							10:00 - PM 1:00<br> LUNCHI TIME PM 1:00 - 2:00 / SUN/HOLYDAY
							CLOSED<br>
							<br> _BANK_ : WOORI 1005-501-330632, ....
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
		</div>
		<!-- container_footer -->
	</div>

	<a style="position: fixed; bottom: 700px; right: 240px;" href="#"
		title="Top"><img src="image/quick_top.png"></a>

	<script type="text/javascript">
		var real_search_keyword = new textScroll('scroll'); // 스크롤링 하고자하는 ul 엘리먼트의 id값을 인자로 넣습니다
		real_search_keyword.name = "real_search_keyword"; // 인스턴스 네임을 등록합니다
		real_search_keyword.start(); // 스크롤링 시작
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('.slider').bxSlider({
				mode : 'fade', //사라지는 모냥
				speen : 3000, // 이미지변환 속도 기본 500
				pager : false, //하단 페이지
				auto : true, //자동시작
				captions : true, //캡션
				controls : true
			//전 후 콘트롤 보이기 안보이기
			});
		});
	</script>


</body>
</html>