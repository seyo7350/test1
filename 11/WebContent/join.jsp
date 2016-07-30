<%@ page import="member.memberDAO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>koko</title>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/jquery.bxslider.css">

<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="js/textRolling.js"></script>
<script src="js/jquery.bxslider.js"></script>
<script src="js/jquery.bxslider.min.js"></script>
<style type="text/css">
form {
	margin: 0 auto; /* 회원관리 폼 700px로 고정 및 가운데 정렬 */
	width: 700px;
}

a {
	font-size: 12px;
	color: gray;
}

input {
	outline-style: none;
}

input[type=text] {
	size: 30;
	font-size: 12px;
	border-left: 0px;
	border-right: 0px;
	border-top: 0px;
	border-bottom: 1px soild gray;
}

input[type=password] {
	size: 30;
	font-size: 12px;
	border-left: 0px;
	border-right: 0px;
	border-top: 0px;
	border-bottom: 1px soild gray;
}

input[type=email] {
	size: 30;
	font-size: 12px;
	border-left: 0px;
	border-right: 0px;
	border-top: 0px;
	border-bottom: 1px soild gray;
}

img {
	vertical-align: middle;
	outline-style: none;
}

select {
	font-size: 10px;
}

input[type=button]  {
   color: white;
   background-color:lightgray;
   border: none;
   font-size:8pt;
   height:20px;'
   }
</style>

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
</script>

<script type="text/javascript">
//아이디 중복 여부를 판단
function openConfirmId(user){
	//아이디를 입력했는지 검사
	if(user.id.value==''){
		alert('아이디를 입력하세요!!');
		return;
	}

	//url과 사용자 입력 id를 조합
	var url = 'confirmId.jsp?id=' + user.id.value;
	
	//새로운 윈도우를 열기
	open(url, 'confirm', 'toolbar=no,scrollbars=no,resizable=no,width=300,height=200');
}

//이메일 중복 여부를 판단
function openConfirmEmail(user){
	//아이디를 입력했는지 검사
	if(user.email.value==''){
		alert('email을 입력하세요!!');
		return;
	}
	
	if ( !email_check(user.email.value) ) {
		alert('	올바른 이메일 형식이 아닙니다.');
		user.email.focus();
		return ;
	}	
	//url과 사용자 입력 id를 조합
	var url = 'confirmEmail.jsp?email=' + user.email.value;
	
	//새로운 윈도우를 열기
	open(url, 'confirm', 'toolbar=no,scrollbars=no,resizable=no,width=300,height=200');
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
	if (user.name.value == '') {
		alert('이름을 입력하세요!');
		user.name.focus();
		return false;
	}
	if (user.id.value == '') {
		alert('아이디를 입력하세요!');
		user.id.focus();
		return false;
	}
	
	// 폼 전송시 아이디 중복체크 확인
	if (user.id_check_confirm.value == "false") // 기본값은 false
	{
	alert("아이디 중복 체크를 하지 않았습니다");
	return false;
	}
	
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
		
	if (user.password.value == user.id.value) {
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
	
	if (user.postcode.value =="" ) {
		alert('	우편번호 및 집주소를 입력하세요!');
		user.postcode.focus();
		return false;
	}
	if (user.address2.value =="" ) {
		alert('	상세주소를 입력하세요!');
		user.address2.focus();
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
	
	// 폼 전송시 이메일 중복체크 확인
	if (user.email_check_confirm.value == "false") // 기본값은 false
	{
	alert("이메일 중복 체크를 하지 않았습니다");
	return false;
	}
}

</script>


</head>
<body>
	<div class="side">
		<div class="side_inner">
			<div class="side_inner_top">
				<a href='login.jsp'>login</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href='join.jsp'>join<br> 
				shopping bag<br>mypage&nbsp;&nbsp;/&nbsp;&nbsp;home 
			</div>
			<div class="side_inner_middle">
				<hr>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="product_detail.jsp">OUTER</a>
				<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TOP <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;BOTTOM <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ONEPIECE <br> <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NOTICE <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q&A <br>
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

				<p align="center">
					<img src="image/join_img.jpg" width="700px" />
				</p>
				<p style="color: rgb(248, 194, 143);">일반회원</p>
				<hr style="border: soild 1px #8a8a8a;">
				
				<form action="joinAF.jsp" method="post" name ="form" onsubmit="return checkIt()">
					<!--이름입력  -->
					<a style="color: rgb(248, 194, 143);">●&nbsp;</a> 
					<a>이름 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	</a> 
					<input type="text" name="name" onkeyup="noSpaceForm(this)" /> <br><br>
					
					<!--아이디입력  -->
					<a style="color: rgb(248, 194, 143);">●&nbsp;</a> 
					<a>아이디 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </a> 
					<input type="text" name="id" onkeyup="noSpaceForm(this)" maxlength="20"/> 
					<input type="button" name="confirm_id" value="ID 중복확인" onclick="openConfirmId(this.form)"> 
					<input type="hidden" name="id_check_confirm" value="false">
					<a	style="font-size: 8px">*아이디는 최대 12자까지 가능합니다.</a><br><br>
							
					<!--비밀번호입력  -->
					<a style="color: rgb(248, 194, 143);">●&nbsp;</a> 
					<a>비밀번호 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> 
					<input type="password"	name="password" onkeyup="noSpaceForm(this)" maxlength='20' /> 
					<a	style="font-size: 8px">*영문/숫자/특수문자를 혼용하여 8~20자</a> <br><br>
					
					<!--비밀번호 확인 -->
					<a style="color: rgb(248, 194, 143);">●&nbsp;</a> 
					<a>비밀번호 확인	:&nbsp;&nbsp;</a> 
					<input type="password" name="Chk_password" onkeyup="noSpaceForm(this)" maxlength='20' /> <br><br>
					
					<!--생일 성별 -->
					<a style="color: rgb(248, 194, 143);">●&nbsp;</a> 
					<a>생년월일 :	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
					
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
					</select><a>일</a> <br><br>
													
					<!--우편번호-->
					<a style="color: rgb(248, 194, 143);">●&nbsp;</a> 
					<a>우편번호:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
					<!--우편번호 찾기  -->
					<input type="text" name="postcode" id="postcode" readonly="readonly">
					<input type="button"  value="우편번호 검색" onclick="findZip()"/><br><br>

					<div id="wrap"
						style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
						<img
							src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
							id="btnFoldWrap"
							style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
							onclick="foldDaumPostcode()" alt="접기 버튼">
					</div>
					<a style="color: rgb(248, 194, 143);">●&nbsp;</a> 
					<a>집주소 :	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> 
					<input type="text" size="42" name="address1" readonly="readonly"	id="sample3_address" class="d_form large">

					<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
					<script>
						// 우편번호 찾기 찾기 화면을 넣을 element
						var element_wrap = document.getElementById('wrap');

						function foldDaumPostcode() {
							// iframe을 넣은 element를 안보이게 한다.
							element_wrap.style.display = 'none';
						}

						function findZip() {
							// 현재 scroll 위치를 저장해놓는다.
							var currentScroll = Math.max(
									document.body.scrollTop,
									document.documentElement.scrollTop);
							new daum.Postcode(
									{
										oncomplete : function(data) {
											// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

											// 각 주소의 노출 규칙에 따라 주소를 조합한다.
											// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
											var fullAddr = data.address; // 최종 주소 변수
											var extraAddr = ''; // 조합형 주소 변수

											// 기본 주소가 도로명 타입일때 조합한다.
											if (data.addressType === 'R') {
												//법정동명이 있을 경우 추가한다.
												if (data.bname !== '') {
													extraAddr += data.bname;
												}
												// 건물명이 있을 경우 추가한다.
												if (data.buildingName !== '') {
													extraAddr += (extraAddr !== '' ? ', '
															+ data.buildingName
															: data.buildingName);
												}
												// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
												fullAddr += (extraAddr !== '' ? ' ('
														+ extraAddr + ')'
														: '');
											}

											// 우편번호와 주소 정보를 해당 필드에 넣는다.
											document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
											document
													.getElementById('sample3_address').value = fullAddr;

											// iframe을 넣은 element를 안보이게 한다.
											// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
											element_wrap.style.display = 'none';

											// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
											document.body.scrollTop = currentScroll;
										},
										// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
										onresize : function(size) {
											element_wrap.style.height = size.height
													+ 'px';
										},
										width : '100%',
										height : '100%'
									}).embed(element_wrap);

							// iframe을 넣은 element를 보이게 한다.
							element_wrap.style.display = 'block';
						}
					</script>

					<br><br>
					<!--상세주소  -->
					<a style="color: rgb(248, 194, 143);">●&nbsp;</a> 
					<a>상세주소 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </a> 
					<input type="text" name="address2" /> <br><br>
					
					<!--연락처  -->
					<a style="color: rgb(248, 194, 143);">●&nbsp;</a>
				    <a>연락처 :	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> 
				    <input type="text" name="phone" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'/> 
				    <a	style="font-size: 8px">*숫자만 입력가능합니다.</a> <br><br>
				    
				    
					<!--이메일  -->
					<a style="color: rgb(248, 194, 143);">●&nbsp;</a> 
					<a>이메일 :	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> 
					<input type="text" name="email" onkeyup="noSpaceForm(this)" />
					<input type="button" name="confirm_email" value="email 중복확인" onclick="openConfirmEmail(this.form)"/>
					<input type="hidden" name="email_check_confirm" value="false">
					<a	style="font-size: 8px">*한메일(hanmail.net) 사용시 정보 메일이 수신이 안될 수	있습니다.</a> <br><br>
					<p align="center">
						<input TYPE="IMAGE" src="image/ok_btn.jpg" name="submit"	value="submit" width="90px" /> &nbsp;&nbsp;
						<a href='index.jsp'><img src="image/cancel_btn.jpg" width="90px" style="vertical-align: top;"/></a>
					</p>
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
						<p style="text-align: right; color: #9c9c9c;">
							법인명(상호): (주)체리코코 | 대표자(성명): 지동헌 | 사업자 등록번호 안내: [215-87-15936] |
							통신판매업 신고 제 2011 - 서울강남 - 03186호<br> 전화: 1600-7255 | 주소:
							서울특별시 강남구 신사동 517-4 M SPACE 빌딩 2층 (강남대로158길 26) -(주)체리코코 <br>
							교환 & 반품 주소 : 서울 성북구 종암동 57-39번지 CJ대한통운 종암대리점 (주)체리코코 <br>
							개인정보관리책임자: 지동헌 | Contact help@cherrykoko.com for more
							information.<br>
						</p>
						<p class="copyright" style="text-align: right;">
							<img
								src="http://img29.makeshop.co.kr/design/cherry07/trend9/cherrycoco/imgs/footer_copy_img.png" />
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